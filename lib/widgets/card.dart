import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color textColor;
  final String imagePath;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomCard({
    Key? key,
    required this.text,
    required this.textColor,
    required this.imagePath,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 140,
              width: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 12),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontFamily: 'sparkFont',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
