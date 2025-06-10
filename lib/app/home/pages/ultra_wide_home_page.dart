import 'package:drop_check_store/widgets/bottom_hub.dart';
import 'package:drop_check_store/widgets/bestseller_products.dart';
import 'package:drop_check_store/widgets/brand_hub.dart';
import 'package:drop_check_store/widgets/banner_carousel.dart';
import 'package:drop_check_store/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';

class UltraWideHomePage extends StatelessWidget {
  const UltraWideHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                const BannerCarousel(),
                const SizedBox(height: 40),
                const Center(
                  child: Text('BESTSELLERY', style: TextStyle(fontSize: 50)),
                ),
                const BestsellerProducts(),
                const SizedBox(height: 140),
                BrandHub(),
                const SizedBox(height: 60),
                const BottomHub(),
              ],
            ),
          ),
          const TopNavBar(),
        ],
      ),
    );
  }
}
