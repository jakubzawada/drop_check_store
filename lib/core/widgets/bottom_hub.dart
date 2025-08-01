import 'package:drop_check_store/features/home/regulations/presentation/pages/regulations_page.dart';
import 'package:drop_check_store/core/widgets/link_text.dart';
import 'package:flutter/material.dart';

class BottomHub extends StatelessWidget {
  const BottomHub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 27, 26, 26),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.help_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Pomoc i kontakt',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegulationsPage()),
                                );
                              },
                              child: Text(
                                'Regulamin',
                                style: TextStyle(
                                  color: Colors.white54,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Reklamacje',
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Tabela Rozmiarów',
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Polityka prywatności',
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'FAQ',
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                SizedBox(width: 400),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Social Media',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    LinkText(
                      text: 'Instagram',
                      url: 'https://www.instagram.com/dropcheck.app/',
                    ),
                    SizedBox(height: 10),
                    LinkText(
                      text: 'Facebook',
                      url:
                          'https://www.facebook.com/profile.php?id=61564449824160',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              '© 2025 DropCheck.Store Wszystkie prawa zastrzeżone',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
