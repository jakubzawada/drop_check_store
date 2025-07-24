import 'package:drop_check_store/features/home/login/presentation/widgets/sign_in_container.dart';
import 'package:drop_check_store/core/widgets/bottom_hub.dart';
import 'package:drop_check_store/core/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 160),
                Center(
                  child: SignInContainer(),
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
