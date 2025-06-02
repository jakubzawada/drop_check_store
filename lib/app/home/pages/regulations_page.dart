import 'package:drop_check_store/widgets/bottom_hub.dart';
import 'package:drop_check_store/widgets/regulations_content.dart';
import 'package:drop_check_store/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';

class RegulationsPage extends StatelessWidget {
  const RegulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 150),
                Center(
                  child: Text(
                    'Regulamin',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                const RegulationsContent(),
                const SizedBox(height: 40),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Image.asset('images/visa.png', height: 40),
                    SizedBox(width: 10),
                    Image.asset('images/mastercard.webp', height: 40),
                    SizedBox(width: 10),
                    Image.asset('images/blik.png', height: 40),
                    SizedBox(width: 10),
                    Image.asset('images/googlepay.png', height: 40),
                    SizedBox(width: 10),
                    Image.asset('images/applepay.png', height: 40),
                  ],
                ),
                const SizedBox(height: 100),
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
