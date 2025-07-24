import 'package:drop_check_store/core/widgets/bottom_hub.dart';
import 'package:drop_check_store/features/home/regulations/presentation/widgets/payment_methods_row.dart';
import 'package:drop_check_store/features/home/regulations/presentation/widgets/regulations_content.dart';
import 'package:drop_check_store/core/widgets/top_nav_bar.dart';
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
                PaymentMethodsRow(),
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
