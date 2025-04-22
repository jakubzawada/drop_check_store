import 'package:drop_check_store/app/home/pages/products_page.dart';
import 'package:flutter/material.dart';

class FilterSidebar extends StatelessWidget {
  const FilterSidebar({
    super.key,
    required this.widget,
  });

  final ProductsPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Filtruj",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text(
            "Rozmiar",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: ['XS', 'S', 'M', 'L', 'XL', 'XXL'].map((size) {
              return ChoiceChip(
                label: Text(size),
                selected: widget.size == size,
                onSelected: (_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductsPage(category: widget.category, size: size),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
