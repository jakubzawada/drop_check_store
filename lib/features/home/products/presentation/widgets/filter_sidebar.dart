import 'package:drop_check_store/features/home/products/presentation/pages/products_page.dart';
import 'package:flutter/material.dart';

class FilterSidebar extends StatefulWidget {
  const FilterSidebar({
    super.key,
    required this.widget,
  });

  final ProductsPage widget;

  @override
  State<FilterSidebar> createState() => _FilterSidebarState();
}

class _FilterSidebarState extends State<FilterSidebar> {
  RangeValues _selectedRange = const RangeValues(0, 1000);

  final List<String> shoeCategories = [
    'Air Jordan',
    'Nike',
    'Adidas',
    'Adidas Yeezy',
    'New Balance',
    'Wszystkie',
  ];

  List<String> getSizesForCategory(String category) {
    if (shoeCategories.contains(category)) {
      return ['40', '41', '42', '43', '44', '45'];
    } else {
      return ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentCategory = widget.widget.category;
    final availableSizes = getSizesForCategory(currentCategory);

    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Filtruj",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text("Rozmiar", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: availableSizes.map((size) {
              return ChoiceChip(
                label: Text(size),
                selected: widget.widget.size == size,
                onSelected: (_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsPage(
                        category: widget.widget.category,
                        size: size,
                        minPrice: widget.widget.minPrice,
                        maxPrice: widget.widget.maxPrice,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          const Text("Cena (PLN)", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          RangeSlider(
            values: _selectedRange,
            min: 0,
            max: 2000,
            divisions: 40,
            labels: RangeLabels(
              '${_selectedRange.start.round()}',
              '${_selectedRange.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _selectedRange = values;
              });
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsPage(
                    category: widget.widget.category,
                    size: widget.widget.size,
                    minPrice: _selectedRange.start,
                    maxPrice: _selectedRange.end,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 81, 55, 126),
            ),
            child: const Text(
              "Zastosuj filtr",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
