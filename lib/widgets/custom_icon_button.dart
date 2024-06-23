import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '../utils/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.icon = TablerIcons.dots_vertical,
    this.color = colorBlueLight,
    this.size = 20,
    this.onPressed,
    this.backgrounColor = Colors.transparent,
  });

  final IconData icon;
  final Color color;
  final Color backgrounColor;
  final double size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      alignment: Alignment.center,
      color: backgrounColor,
      onPressed: onPressed,
      iconSize: size,
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
