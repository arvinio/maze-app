import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/widget/dismissible_focus.dart';

class ClipRectTransitionsBuilderWidget extends StatefulWidget {
  final Offset buttonOffset;

  final Size buttonSize;

  final Radius buttonRadius;

  final Widget? child;

  final Duration? duration;

  final Widget Function(
      BuildContext context, Widget? child, double animationValue)? builder;

  const ClipRectTransitionsBuilderWidget({
    super.key,
    required this.buttonOffset,
    required this.buttonSize,
    required this.buttonRadius,
    this.child,
    this.builder,
    this.duration,
  }) : assert(child != null || builder != null,
            'Either child or builder must be provided');

  @override
  State<ClipRectTransitionsBuilderWidget> createState() =>
      _ClipRectTransitionsBuilderWidgetState();
}

class _ClipRectTransitionsBuilderWidgetState
    extends State<ClipRectTransitionsBuilderWidget>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  // late Animation<double> _opacityAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 300),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // _opacityAnimation = Tween(begin: 0.05, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: const Interval(
    //       0.0,
    //       0.3,
    //       curve: Curves.easeInOut,
    //     ),
    //   ),
    // );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, __) {
        dismissFocus(context);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return ClipRRect(
            clipper: PageClipperBridge(
              radius: widget.buttonRadius,
              offset: widget.buttonOffset,
              buttonSize: widget.buttonSize,
              sizeRate: _animation.value,
            ),
            child: widget.builder?.call(context, child, _animation.value) ??
                child!,
          );
        },
        child: widget.child,
      ),
    );
  }
}

@immutable
class PageClipperBridge extends CustomClipper<RRect> {
  const PageClipperBridge(
      {required this.sizeRate,
      required this.offset,
      required this.radius,
      required this.buttonSize});

  final double sizeRate;
  final Offset offset;
  final Radius radius;
  final Size buttonSize;

  @override
  RRect getClip(Size size) {
    // sizeRate starts from 0.0 and goes to 1.0

    return RRect.fromRectAndRadius(
      Rect.fromLTWH(
        offset.dx - (offset.dx * sizeRate),
        offset.dy - (offset.dy * sizeRate),
        (size.width - buttonSize.width) * sizeRate + buttonSize.width,
        (size.height - buttonSize.height) * sizeRate + buttonSize.height,
      ),
      Radius.elliptical(
        radius.x - (radius.x * sizeRate),
        radius.y - (radius.y * sizeRate),
      ),
    );
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return oldClipper != this;
  }
}
