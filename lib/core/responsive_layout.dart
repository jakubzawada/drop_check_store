import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.ultrawawide,
    required this.wide,
    required this.narrow,
  });

  final Widget ultrawawide;
  final Widget wide;
  final Widget narrow;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        if (maxWidth > 1200) {
          return ultrawawide;
        } else if (maxWidth > 800) {
          return wide;
        } else {
          return narrow;
        }
      },
    );
  }
}
