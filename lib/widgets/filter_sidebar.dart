import 'package:drop_check_store/app/home/pages/products_page.dart';
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
          const Text("Rozmiar", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: ['XS', 'S', 'M', 'L', 'XL', 'XXL'].map((size) {
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
            child: const Text("Zastosuj filtr"),
          ),
        ],
      ),
    );
  }
}
