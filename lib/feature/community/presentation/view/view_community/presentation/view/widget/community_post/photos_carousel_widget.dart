import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class PhotoCarouselWidget extends StatefulWidget {
  final List<dynamic> photoUrls;
  final double height;

  const PhotoCarouselWidget({
    super.key,
    required this.photoUrls,
    this.height = 220,
  });

  @override
  _PhotoCarouselWidgetState createState() => _PhotoCarouselWidgetState();
}

class _PhotoCarouselWidgetState extends State<PhotoCarouselWidget> {
  int _currentImageIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: context.scheme().tabBarBorderDivider),
          ),
          clipBehavior: Clip.antiAlias,
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: widget.height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
            items: widget.photoUrls.map((photoUrl) {
              return CachedNetworkImage(
                imageUrl: photoUrl,
                fadeInDuration: const Duration(milliseconds: 500),
                fadeOutDuration: const Duration(milliseconds: 500),
                fit: BoxFit.cover,
                width: double.infinity,
                height: widget.height,
                placeholder: (context, url) =>
                    appAssets.placeHolderImage.image(fit: BoxFit.cover),
                errorWidget: (context, url, error) =>
                    appAssets.placeHolderImage.image(fit: BoxFit.cover),
              );
            }).toList(),
          ),
        ),
        if (widget.photoUrls.length > 1) ...[
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.photoUrls.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(
                      _currentImageIndex == entry.key ? 0.9 : 0.4,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}
