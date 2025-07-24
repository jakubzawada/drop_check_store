import 'package:drop_check_store/app/home/home_page.dart';
import 'package:drop_check_store/app/home/pages/account_page.dart';
import 'package:drop_check_store/app/login/login_page.dart';
import 'package:drop_check_store/widgets/hover_menu_clothes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'hover_menu_sneakers_.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({super.key});

  @override
  TopNavBarState createState() => TopNavBarState();
}

class TopNavBarState extends State<TopNavBar> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  void _showMenu(BuildContext context, Map<String, List<String>> categories,
      bool isClothes) {
    _hideMenu();

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => isClothes
          ? HoverMenuClothes(
              position: Offset(MediaQuery.of(context).size.width / 2 - 500, 75),
              categories: categories,
              onExit: _hideMenu,
            )
          : HoverMenuSneakers(
              position: Offset(MediaQuery.of(context).size.width / 2 - 750, 75),
              categories: categories,
              onExit: _hideMenu,
            ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CompositedTransformTarget(
            link: _layerLink,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // logo
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                      );
                    },
                    child: const Image(
                      image: AssetImage('images/DCLogo2.png'),
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // menu
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildMenuItem(
                            context,
                            'ODZIEŻ',
                            {
                              'Spodnie': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
                              'Bluzy': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
                              'Koszulki': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
                              'Kurtki': ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
                            },
                            true),
                        const SizedBox(width: 20),
                        _styledDivider(),
                        const SizedBox(width: 20),
                        _buildMenuItem(
                            context,
                            'BUTY',
                            {
                              'Wszystkie': [],
                              'Air Jordan': [
                                '40',
                                '41',
                                '42',
                                '43',
                                '44',
                                '45'
                              ],
                              'Nike': ['40', '41', '42', '43', '44', '45'],
                              'Adidas': ['40', '41', '42', '43', '44', '45'],
                              'Adidas Yeezy': [
                                '40',
                                '41',
                                '42',
                                '43',
                                '44',
                                '45'
                              ],
                              'New Balance': [
                                '40',
                                '41',
                                '42',
                                '43',
                                '44',
                                '45'
                              ],
                            },
                            false),
                        const SizedBox(width: 20),
                        _styledDivider(),
                        const SizedBox(width: 20),
                        _staticMenuItem('AKCESORIA'),
                        const SizedBox(width: 20),
                        _styledDivider(),
                        const SizedBox(width: 20),
                        _staticMenuItem('PROMOCJE'),
                        const SizedBox(width: 20),
                        _styledDivider(),
                        const SizedBox(width: 20),
                        _staticMenuItem('KARTY PODARUNKOWE'),
                      ],
                    ),
                  ),
                  // icons
                  Row(
                    children: [
                      const Icon(Icons.search, size: 30),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AccountPage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                            );
                          }
                        },
                        child: const Icon(Icons.person, size: 30),
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.shopping_bag_outlined, size: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title,
      Map<String, List<String>> categories, bool isClothes) {
    return MouseRegion(
      onEnter: (event) {
        _showMenu(context, categories, isClothes);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _staticMenuItem(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _styledDivider() {
    return Text(
      '/',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey[700],
      ),
    );
  }
}
