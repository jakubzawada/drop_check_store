import 'package:flutter/material.dart';
import 'hover_menu.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({super.key});

  @override
  TopNavBarState createState() => TopNavBarState();
}

class TopNavBarState extends State<TopNavBar> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  void _showMenu(BuildContext context, Offset position,
      Map<String, List<String>> categories) {
    _hideMenu();

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => HoverMenu(
        position: position,
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
              const Image(
                image: AssetImage('images/DCLogo2.png'),
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 20),
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
                    ),
                    const SizedBox(width: 20),
                    const Text('/'),
                    const SizedBox(width: 20),
                    const Text('BUTY'),
                    const SizedBox(width: 20),
                    const Text('/'),
                    const SizedBox(width: 20),
                    const Text('AKCESORIA'),
                    const SizedBox(width: 20),
                    const Text('/'),
                    const SizedBox(width: 20),
                    const Text('PROMOCJE'),
                    const SizedBox(width: 20),
                    const Text('/'),
                    const SizedBox(width: 20),
                    const Text('KARTY PODARUNKOWE'),
                  ],
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.search, size: 30),
                  SizedBox(width: 20),
                  Icon(Icons.person, size: 30),
                  SizedBox(width: 20),
                  Icon(Icons.shopping_bag_outlined, size: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title,
      Map<String, List<String>> categories) {
    return MouseRegion(
      onEnter: (event) {
        _showMenu(
          context,
          Offset(event.position.dx, event.position.dy + 10),
          categories,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(title),
      ),
    );
  }
}
