import 'package:flutter/material.dart';

class BottomHub extends StatelessWidget {
  const BottomHub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 27, 26, 26),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40.0, bottom: 20, left: 200, right: 100),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Informacje',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'FAQ',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Tabele Rozmiarów',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Zwroty',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '© 2025 DropCheck.Store',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
