import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.textStyle = const TextStyle(),
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        textStyle: textStyle,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
