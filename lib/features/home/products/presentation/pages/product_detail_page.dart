import 'package:flutter/material.dart';
import 'package:drop_check_store/core/widgets/top_nav_bar.dart';
import 'package:drop_check_store/core/widgets/bottom_hub.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> productData;

  const ProductDetailsPage({super.key, required this.productData});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final data = widget.productData;

    List<String> sizes =
        (data['size'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
            [];

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 140),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 600,
                            width: 700,
                            child: Image.network(
                              data['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '${data['price']} PLN',
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                if (sizes.isNotEmpty) ...[
                                  const Text(
                                    'Wybierz rozmiar:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 10),
                                  Wrap(
                                    spacing: 10,
                                    children: sizes.map((size) {
                                      final isSelected = size == selectedSize;
                                      return ChoiceChip(
                                        label: Text(size),
                                        selected: isSelected,
                                        onSelected: (_) {
                                          setState(() {
                                            selectedSize = size;
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                                ElevatedButton(
                                  onPressed: selectedSize == null &&
                                          sizes.isNotEmpty
                                      ? null
                                      : () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Dodano do koszyka')),
                                          );
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 32),
                                  ),
                                  child: const Text(
                                    'Dodaj do koszyka',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                const BottomHub(),
              ],
            ),
          ),
          const TopNavBar(),
        ],
      ),
    );
  }
}
