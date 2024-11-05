import 'package:flutter/material.dart';
import 'package:my_web_portfolio/configs/colors.dart';

class D_HomeSection extends StatefulWidget {
  final bool update;
  const D_HomeSection({
    super.key,
    required this.update,
  });

  @override
  State<D_HomeSection> createState() => _D_HomeSectionState();
}

class _D_HomeSectionState extends State<D_HomeSection> {
  @override
  Widget build(BuildContext context) {
    if (widget.update) {
      setState(() {});
      if (!widget.update) setState(() {});
    }

    return Container(
      height: 600,
      width: double.infinity,
      color: MyColors.themecolor,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [],
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size.infinite, // Size of the canvas
                    painter: ConePainter(),
                    
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class ConePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = MyColors.primarycolor;
    Path path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(size.width * 0.5, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    Paint circlePaint = Paint()
      ..color = MyColors.primarycolor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; 

    double circleRadius = size.width * 0.35;
    Offset circleCenter = Offset(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(circleCenter, circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
