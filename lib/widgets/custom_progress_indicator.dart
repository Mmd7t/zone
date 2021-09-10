import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomProgressIndicator extends StatefulWidget {
  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  Animation animationCirc;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    animationCirc = Tween(begin: 5.0, end: 8.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: (animationController.status == AnimationStatus.forward)
              ? (math.pi * 2) * animationController.value
              : -(math.pi * 2) * animationController.value,
          child: Center(
            child: Container(
              width: 20,
              height: 20,
              child: CustomPaint(
                painter: LoaderPainter(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LoaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var x = size.width;
    var y = size.height;
    Paint circ = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(0, y - (x / 5)), x / 5, circ);
    canvas.drawCircle(Offset(x, y - (x / 5)), x / 5, circ);
    canvas.drawCircle(Offset(x / 2, 0), x / 5, circ);
  }

  @override
  bool shouldRepaint(LoaderPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(LoaderPainter oldDelegate) => true;
}
