import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

import 'animated_beat.dart';

class AnimatedLike extends StatefulWidget {
  const AnimatedLike({
    super.key,
    required this.child,
    this.animatingChildren,
    this.onTap,
    this.animateOnTap = true,
  });

  final Widget child;
  final List<Widget>? animatingChildren;
  final VoidCallback? onTap;
  final bool animateOnTap;

  @override
  AnimatedLikeState createState() => AnimatedLikeState();
}

class AnimatedLikeState extends State<AnimatedLike>
    with TickerProviderStateMixin {
  final Random _random = Random();

  final Queue<List<Widget>> _animatingWidgets = Queue<List<Widget>>();

  final Queue<List<Animation<double>>> _animationsToTop =
      Queue<List<Animation<double>>>();
  final Queue<List<Animation<double>>> _animationsToSides =
      Queue<List<Animation<double>>>();
  final Queue<Animation<double>> _fadeAnimation = Queue<Animation<double>>();
  final Queue<Animation<double>> _scaleAnimation = Queue<Animation<double>>();
  final Queue<AnimationController> _controllers = Queue<AnimationController>();

  final GlobalKey<AnimatedBeatState> _animatedBeatKey =
      GlobalKey<AnimatedBeatState>();

  late ThemeData _themeData;

  void _addAnimations() {
    _controllers.addFirst(AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    ));
    const radius = 85.0;

    const animationToTopCurve = Curves.easeOutQuart;

    _animationsToTop.addFirst(List.generate(19, (index) {
      return Tween<double>(
              begin: 0.0, end: -radius * 1.69 * (_random.nextDouble() + 0.2))
          .animate(CurvedAnimation(
        parent: _controllers.first,
        curve: animationToTopCurve,
      ));
    }));

    _animationsToSides.addFirst(List.generate(19, (index) {
      final end = ((pow(-1, index)) * _random.nextDouble()) * radius;
      return Tween<double>(begin: 0.0, end: end).animate(CurvedAnimation(
        parent: _controllers.first,
        curve: const Interval(0.0, 0.1, curve: Curves.easeInOut),
      ));
    }));

    _fadeAnimation
        .addFirst(Tween<double>(begin: 1.0, end: 0).animate(CurvedAnimation(
      parent: _controllers.first,
      curve: const Interval(0.1, 1.0, curve: animationToTopCurve),
    )));
    _scaleAnimation
        .addFirst(Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controllers.first,
      curve: const Interval(0.0, 0.169, curve: Curves.easeOut),
    )));
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildLikeIcon(int index) {
    final hasChildren = widget.animatingChildren != null &&
        widget.animatingChildren!.isNotEmpty;

    return MatrixTransition(
      animation: _animationsToTop.first[index],
      onTransform: (value) => Matrix4.translationValues(0.0, value, 1.0),
      child: MatrixTransition(
        animation: _animationsToSides.first[index],
        onTransform: (value) => Matrix4.translationValues(value, 0.0, 1.0),
        child: FadeTransition(
          opacity: _fadeAnimation.first,
          child: ScaleTransition(
            scale: _scaleAnimation.first,
            child: hasChildren
                ? (widget.animatingChildren![
                    Random().nextInt(widget.animatingChildren!.length)])
                : widget.child,
          ),
        ),
      ),
    );
  }

  static const _animatingChildrenCount = 17;

  void animate() {
    if (_controllers.isEmpty || _controllers.last.isAnimating) {
      _addAnimations();
      _animatingWidgets.addFirst(
        List.generate(
          _animatingChildrenCount,
          (index) {
            return _buildLikeIcon(index);
          },
        ),
      );
    }

    setState(() {});

    _controllers.first.forward().then((value) {
      _controllers.last.reset();
      _controllers.last.dispose();
      _controllers.removeLast();
      _animationsToTop.removeLast();
      _animationsToSides.removeLast();
      _fadeAnimation.removeLast();
      _scaleAnimation.removeLast();
      _animatingWidgets.removeLast();
    });
    _animatedBeatKey.currentState?.animate();
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Builder(builder: (context) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: List.generate(_animatingWidgets.length + 1, (index) {
          if (index == _animatingWidgets.length) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.animateOnTap
                  ? () {
                      animate();

                      widget.onTap?.call();
                    }
                  : widget.onTap,
              onTapDown: widget.animateOnTap
                  ? (TapDownDetails _) {
                      _animatedBeatKey.currentState?.holdBeat();
                    }
                  : null,
              onTapUp: widget.animateOnTap
                  ? (TapUpDetails _) {
                      _animatedBeatKey.currentState?.releaseBeat();
                    }
                  : null,
              onTapCancel: widget.animateOnTap
                  ? () {
                      _animatedBeatKey.currentState?.releaseBeat();
                    }
                  : null,
              child: AnimatedBeat(
                key: _animatedBeatKey,
                animateOnTap: false,
                child: widget.child,
              ),
            );
          }
          return Stack(
            alignment: Alignment.bottomCenter,
            children: List.generate(_animatingWidgets.elementAt(index).length,
                (listIndex) {
              return _animatingWidgets.elementAt(index)[listIndex];
            }),
          );
        }),
      );
    });
  }
}
