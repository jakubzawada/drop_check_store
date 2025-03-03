import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: const Row(
          children: [
            Image(
              image: AssetImage('images/icon4.png'),
              width: 100,
              height: 100,
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.search, size: 40),
                SizedBox(width: 20),
                Icon(Icons.person, size: 40),
                SizedBox(width: 20),
                Icon(Icons.shopping_bag_outlined, size: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
