import 'package:flutter/material.dart';
import 'package:spark/screens/terms_and_conditions.dart';
import 'dart:math' as math;
class CurvedTextButton extends StatelessWidget {
  final double radius;
  final String text;
  final TextStyle textStyle;
  final double startAngle;
  final double rotationAngle;
  final VoidCallback onPressed;

  const CurvedTextButton({
    Key? key,
    required this.radius,
    required this.text,
    required this.textStyle,
    this.startAngle = 0,
    this.rotationAngle = 0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, 

      child: CustomPaint(
        painter: _Painter(
          radius: radius,
          text: text,
          textStyle: textStyle,
          initialAngle: startAngle,
          rotationAngle: rotationAngle,
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final double radius;
  final String text;
  final double initialAngle;
  final TextStyle textStyle;
  final double rotationAngle;

  _Painter({
    required this.radius,
    required this.text,
    required this.textStyle,
    this.initialAngle = 0,
    this.rotationAngle = 0, // Initialize rotation angle
  });

  final _textPainter = TextPainter(textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2 - radius);

    if (initialAngle != 0) {
      final d = 2 * radius * math.sin(initialAngle / 2);
      final rotationAngle = _calculateRotationAngle(0, initialAngle);
      canvas.rotate(rotationAngle);
      canvas.translate(d, 0);
    }

    double angle = initialAngle;
    for (int i = 0; i < text.length; i++) {
      angle = _drawLetter(canvas, text[i], angle);
    }
  }

  double _drawLetter(Canvas canvas, String letter, double prevAngle) {
    _textPainter.text = TextSpan(text: letter, style: textStyle);
    _textPainter.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );

    final double d = _textPainter.width;
    final double alpha = 2 * math.asin(d / (2 * radius)) + rotationAngle;

    final newAngle = _calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);

    _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double _calculateRotationAngle(double prevAngle, double alpha) =>
      (alpha + prevAngle) / 2;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}



class LeftCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.75, 0); // Starting point on top edge
    path.quadraticBezierTo(
      size.width,
      size.height / 2,
      size.width * 0.75,
      size.height, // Control point and end point for the curve
    );
    path.lineTo(0, size.height); // Bottom left corner
    path.close(); // Completes the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}



// Custom clipper for the curved shape
class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class TermsCheckbox extends StatefulWidget {
   const TermsCheckbox({Key? key}) : super(key: key);
  @override
   TermsCheckboxState createState() => TermsCheckboxState();
}

class TermsCheckboxState extends State<TermsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
         TextButton(
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TermsAndConditions()),
                      );
                        },
                        child: const Text(
                          'Accept terms and conditions',
                          style: TextStyle(fontSize: 30,fontFamily: 'sparkFont', decoration: TextDecoration.underline,),
                        ),
                      ),
      ],
    );
  }
}