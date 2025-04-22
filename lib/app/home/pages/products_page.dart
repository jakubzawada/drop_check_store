import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drop_check_store/widgets/bottom_hub.dart';
import 'package:drop_check_store/widgets/filter_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:drop_check_store/widgets/top_nav_bar.dart';

class ProductsPage extends StatefulWidget {
  final String category;
  final String? size;

  const ProductsPage({super.key, required this.category, this.size});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    print('Pobieranie z kategorii: ${widget.category}');

    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: widget.category);

    if (widget.size != null) {
      query = query.where('size', arrayContains: widget.size);
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20),
                      FilterSidebar(widget: widget),
                      const SizedBox(width: 20),
                      Expanded(
                        child:
                            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: query.snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                  child: Text('Brak produktów'));
                            }

                            var products = snapshot.data!.docs;

                            return GridView.count(
                              crossAxisCount: 4,
                              padding: const EdgeInsets.all(20),
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.7,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: products.map((product) {
                                var data = product.data();
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Card(
                                    elevation: 4,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          data['image'],
                                          height: 400,
                                          width: 400,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Icon(Icons.broken_image,
                                                      size: 100),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          data['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          '${data['price']} PLN',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  BottomHub(), // <- teraz pełna szerokość
                ],
              ),
            ),
          ),
          const TopNavBar(),
        ],
      ),
    );
  }
}
