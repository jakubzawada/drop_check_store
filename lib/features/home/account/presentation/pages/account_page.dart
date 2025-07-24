import 'package:drop_check_store/features/home/account/presentation/widgets/account_info_card.dart';
import 'package:drop_check_store/core/widgets/bottom_hub.dart';
import 'package:drop_check_store/core/widgets/top_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const TopNavBar(),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: AccountInfoCard(user: user),
            ),
          ),
          const BottomHub(),
        ],
      ),
    );
  }
}
