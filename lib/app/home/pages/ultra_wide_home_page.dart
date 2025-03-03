import 'package:drop_check_store/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';

class UltraWideHomePage extends StatelessWidget {
  const UltraWideHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.only(top: 200, left: 200.0, right: 220),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Placeholder(
                        child: SizedBox(height: 100, width: 100),
                      ),
                      Placeholder(
                        child: SizedBox(height: 100, width: 100),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TopNavBar(),
        ],
      ),
    );
  }
}
