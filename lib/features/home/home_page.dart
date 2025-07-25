import 'package:drop_check_store/features/home/presentation/pages/narrow_home_page.dart';
import 'package:drop_check_store/features/home/presentation/pages/ultra_wide_home_page.dart';
import 'package:drop_check_store/features/home/presentation/pages/wide_home_page.dart';
import 'package:drop_check_store/core/responsive_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      ultrawawide: UltraWideHomePage(),
      wide: WideHomePage(),
      narrow: NarrowHomePage(),
    );
  }
}
