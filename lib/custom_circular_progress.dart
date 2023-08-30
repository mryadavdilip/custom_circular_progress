import 'package:custom_circular_progress/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CustomCircularProgress extends StatefulWidget {
  /// IndicatorDetails(value: 0.2, itemCount: 10).
  final IndicatorDetails details;

  /// Progress value color. Default is Colors.blue
  final Color? color;

  /// Progress value alternative color that to be animated with. No color animation if default (null)
  final Color? alternativeColor;

  /// Background color: portion that is not shaded with value. Default is Colors.white
  final Color? backgroundColor;

  /// Radius of the indicatior widget. Default is 20
  final double radius;

  /// Animation Curve. Default is Curves.easeIn
  final Curve curve;

  /// Duration of the rotational animation. Default is Duration(seconds: 3)
  final Duration animationDuration;

  /// Duration of color animation. Default is Duration(seconds: 4)
  final Duration colorDuration;

  /// To stop rotational animation. Default is false
  final bool stopController;

  /// To stop color animation. Default is false
  final bool stopColorController;

  /// Size of each units (items) in indicator. Default is Size(5, 5)
  final Size unitSize;

  /// BorderRadius of each unit. Default is BorderRadius.circlular(unitSize.longestSide / 2)
  final BorderRadius? unitBorderRadius;

  const CustomCircularProgress({
    super.key,
    required this.details,
    this.color = Colors.blue,
    this.alternativeColor,
    this.backgroundColor = Colors.white,
    this.radius = 20,
    this.curve = Curves.easeIn,
    this.animationDuration = const Duration(seconds: 3),
    this.colorDuration = const Duration(seconds: 4),
    this.stopController = false,
    this.stopColorController = false,
    this.unitSize = const Size(5, 5),
    this.unitBorderRadius,
  });
  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress>
    with TickerProviderStateMixin {
  bool animate = false;
  AnimationController? _controller;
  Animation<double>? _animation;

  AnimationController? _colorController;
  Animation<Color?>? _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animation = CurvedAnimation(parent: _controller!, curve: widget.curve);

    _controller!.addStatusListener((status) {
      if (widget.stopController) {
        _controller?.removeStatusListener((status) {});
      } else {
        if (status == AnimationStatus.completed) {
          _controller!.repeat();
        }
      }
    });

    _colorController = AnimationController(
      vsync: this,
      duration: widget.colorDuration,
      animationBehavior: AnimationBehavior.normal,
    );

    _colorAnimation = ColorTween(
      begin: widget.color,
      end: widget.alternativeColor,
    ).animate(_colorController!);

    _colorController!.addStatusListener((status) {
      if (widget.stopColorController) {
        _colorController?.removeStatusListener((status) {});
      } else {
        if (status == AnimationStatus.completed) {
          _colorController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _colorController!.forward();
        }
      }
    });

    if (widget.stopController) {
      _controller!.stop();
    } else {
      _controller!.forward();
    }

    if (widget.stopColorController) {
      _colorController!.stop();
    } else {
      _colorController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.radius * 2 + widget.unitSize.height,
      width: widget.radius * 2 + widget.unitSize.width,
      child: AnimatedBuilder(
        animation: _animation!,
        builder: (context, child) {
          return Stack(
            fit: StackFit.loose,
            children: _buildAnimatedContainers(),
          );
        },
      ),
    );
  }

  List<Widget> _buildAnimatedContainers() {
    BorderRadius borderRadius = widget.unitBorderRadius ??
        BorderRadius.circular(widget.unitSize.longestSide / 2);

    List<Widget> containers = [];
    final values = widget.details.getValues();
    final double radius = widget.radius;

    for (var i = 0; i < values.length; i++) {
      final angle = (2 * pi * i / values.length) + (_animation!.value * 2 * pi);
      final x = radius * cos(angle);
      final y = radius * sin(angle);

      containers.add(
        Positioned(
          left: radius + x,
          top: radius + y,
          child: AnimatedBuilder(
            animation: _colorAnimation!,
            builder: (context, child) {
              return Container(
                height: widget.unitSize.height,
                width: widget.unitSize.width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: Color.lerp(
                      widget.backgroundColor,
                      _colorAnimation!.value,
                      values[i] / (1 / widget.details.itemCount)),
                ),
              );
            },
          ),
        ),
      );
    }

    return containers.reversed.toList();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _colorController!.dispose();
    super.dispose();
  }
}
