import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/bloc/view_community_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class ViewCommunityAppbarWidget extends StatefulWidget {
  const ViewCommunityAppbarWidget(
      {super.key,
      required this.cover,
      required this.communityId,
      this.isOwnCommunity = false});

  final String? cover;
  final bool isOwnCommunity;
  final String communityId;

  @override
  State<ViewCommunityAppbarWidget> createState() =>
      _ViewCommunityAppbarWidgetState();
}

class _ViewCommunityAppbarWidgetState extends State<ViewCommunityAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: false,
      pinned: false,
      leading: AppbarActionIconWidget(
        assetSvg: appAssets.backIcon,
        onTap: () => context.back(),
      ),
      actions: [
        // AppbarActionIconWidget(assetSvg: appAssets.searchIcon,edgeInsets: const EdgeInsets.only(top: 12 , right: 16), onTap: (){},),
        if (widget.isOwnCommunity)
          AppbarActionIconWidget(
            assetSvg: appAssets.menuIcon,
            edgeInsets: const EdgeInsets.only(top: 12, right: 16),
            onTap: () => _appbarOptionsDialog(context, () {}),
          )
      ],
      actionsIconTheme: const IconThemeData(),
      expandedHeight: 230.h,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: widget.cover ?? '',
              cacheKey: widget.cover,
              fadeInDuration: const Duration(milliseconds: 500),
              // Add a fade-in effect
              fadeOutDuration: const Duration(milliseconds: 500),
              // Add a fade-out effect
              fit: BoxFit.fill,
              width: double.infinity,
              height: 220.h,
              progressIndicatorBuilder: (context, url, progress) =>
                  const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  appAssets.placeHolderImage.image(fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: -7,
            left: 0,
            right: 0,
            child: Container(
              height: 20.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _appbarOptionsDialog(BuildContext context, Function() callBack) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.32,
            child: Column(
              children: [
                CustomMenuItems(
                  title: appStrings.deleteCommunity,
                  leading: appAssets.trash.svg(),
                  onTap: () {
                    context.read<ViewCommunityBloc>().add(
                        ViewCommunityEvent.deleteCommunity(
                            id: widget.communityId));
                  },
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: context.scheme().neutralsBorderDivider,
                  indent: 60,
                  endIndent: 30,
                ),
                CustomMenuItems(
                  title: appStrings.editCommunity,
                  leading: appAssets.editProfile.svg(),
                  titleColor: context.scheme().error,
                  onTap: () {},
                ),
              ],
            ),
          );
        });
    // else toast
  }
}

class AppbarActionIconWidget extends StatelessWidget {
  const AppbarActionIconWidget(
      {super.key,
      required this.assetSvg,
      required this.onTap,
      this.edgeInsets,
      this.color});

  final AssetSvg assetSvg;
  final EdgeInsets? edgeInsets;
  final Color? color;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: edgeInsets ??
            const EdgeInsets.only(left: Dimen.pagePaddingHorizontal, top: 12),
        padding: const EdgeInsets.all(6),
        height: 36,
        width: 36,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(
          child: assetSvg.svg(color: context.scheme().primaryText),
        ),
      ),
    );
  }
}
