import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/resources/resources.dart';

class CircularProgressIndicatorWithPercentage extends StatefulWidget {
  final double strokeWidth;
  final double radius;
  final double value;

  CircularProgressIndicatorWithPercentage({
    required this.strokeWidth,
    required this.radius,
    required this.value,
  });

  @override
  _CircularProgressIndicatorWithPercentageState createState() =>
      _CircularProgressIndicatorWithPercentageState();
}

class _CircularProgressIndicatorWithPercentageState
    extends State<CircularProgressIndicatorWithPercentage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '${(_animation.value*100).toInt()}%',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        CustomPaint(
          size: Size(widget.radius * 2, widget.radius * 2),
          painter: CircularProgressPainter(
            strokeWidth: widget.strokeWidth,
            value: _animation.value,
          ),
        ),
      ],
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double value;

  CircularProgressPainter({
    required this.strokeWidth,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    // final Paint paint = Paint()
    //   ..color = AppColors.appBarTextColor
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = strokeWidth;

    // canvas.drawCircle(center, radius, paint);

    final double arcAngle = 2 * pi * value;
    final Paint progressPaint = Paint()
      ..color = AppColors.themeUpColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
