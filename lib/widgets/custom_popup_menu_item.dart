import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'custom_text_widget.dart';

class CustomPopupMenuItem extends StatelessWidget {
  const CustomPopupMenuItem({
    super.key,
    required this.value,
    required this.height,
    required this.enabled,
    required this.mouseCursor,
    required this.textStyle,
    required this.icon,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.onTap,
  });
  final String value;
  final double height;
  final bool enabled;
  final MouseCursor mouseCursor;
  final TextStyle textStyle;
  final IconData icon;
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem<String>(
      value: value,
      height: height,
      enabled: enabled,
      mouseCursor: mouseCursor,
      textStyle: textStyle,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color, size: 17),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.aBeeZee(
              textStyle: textStyle,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
