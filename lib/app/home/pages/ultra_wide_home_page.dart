import 'package:drop_check_store/widgets/main_hub.dart';
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
              children: [MainHub(), SizedBox(height: 40), Placeholder()],
            ),
          ),
          TopNavBar(),
        ],
      ),
    );
  }
}
