import 'package:flutter/material.dart';

class HoverMenuClothes extends StatelessWidget {
  final Offset position;
  final Map<String, List<String>> categories;
  final VoidCallback onExit;

  const HoverMenuClothes({
    super.key,
    required this.position,
    required this.categories,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: MouseRegion(
        onExit: (_) => onExit(),
        child: Material(
          color: Colors.white,
          elevation: 6,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categories.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...entry.value.map(
                          (size) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              size,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
