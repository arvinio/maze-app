import 'package:flutter/material.dart';

class AnimatedBeat extends StatefulWidget {
  const AnimatedBeat({
    super.key,
    required this.child,
    this.duration,
    this.curve,
    this.onTap,
    this.scale,
    this.animateOnTap = true,
  });

  final Duration? duration;

  final Curve? curve;

  final Widget child;

  final void Function()? onTap;

  final double? scale;

  final bool animateOnTap;

  @override
  AnimatedBeatState createState() => AnimatedBeatState();
}

class AnimatedBeatState extends State<AnimatedBeat>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  static const _defaultDuration = Duration(milliseconds: 100);
  static const _scale = 1.33;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? _defaultDuration,
      vsync: this,
    );

    _animation = Tween(
      begin: 1.0,
      end: widget.scale ?? _scale,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.linear,
      ),
    );
  }

  void animateToScale(double scale, {Duration? duration}) {
    _controller.animateTo(
      scale,
      duration: duration ?? widget.duration ?? _defaultDuration,
    );
  }

  void animate({Duration? duration, double minPercentage = 0.94}) {
    assert(minPercentage >= 0.0 && minPercentage <= 1.0);
    final scale = widget.scale ?? _scale;
    final isPositiveAnimation = scale > 1.0;
    final minAnimationCoefficient = ((scale - 1.0).abs() * minPercentage);
    final minAnimationValue = isPositiveAnimation
        ? 1.0 + minAnimationCoefficient
        : 1.0 - minAnimationCoefficient;
    if ((isPositiveAnimation && _animation.value < minAnimationValue) ||
        (!isPositiveAnimation && _animation.value > minAnimationValue)) {
      _controller
          .animateTo(
            widget.scale ?? _scale,
            duration: duration ??
                const Duration(
                  milliseconds: 25,
                ),
          )
          .then((_) => releaseBeat());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
        onTap: widget.onTap == null && !widget.animateOnTap
            ? null
            : () {
                if (widget.animateOnTap) {
                  animate();
                }
                widget.onTap?.call();
              },
        onTapDown: widget.animateOnTap
            ? (TapDownDetails _) {
                holdBeat();
              }
            : null,
        onTapUp: widget.animateOnTap
            ? (TapUpDetails _) {
                releaseBeat();
              }
            : null,
        onTapCancel: widget.animateOnTap ? () => releaseBeat() : null,
        child: widget.child,
      ),
    );
  }

  void releaseBeat() {
    if (_controller.value > 0.85) {
      _controller.reverse();
    }
  }

  void holdBeat() {
    _controller
        .animateTo(
          widget.scale ?? _scale,
          duration: const Duration(
            milliseconds: 70,
          ),
        )
        .then((_) => _controller.stop());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
