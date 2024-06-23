import 'package:flutter/material.dart';

class LayoutBuilderScreen extends StatelessWidget {
  const LayoutBuilderScreen({
    super.key,
    required this.mobileLayoutScreen,
    required this.webLayoutScreen,
  });
  final Widget mobileLayoutScreen;
  final Widget webLayoutScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          return webLayoutScreen;
        }
        return mobileLayoutScreen;
      },
    );
  }
}
