import 'package:cloud_firestore/cloud_firestore.dart';
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
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              children: [
                FilterSidebar(widget: widget),

                // PRAWA CZĘŚĆ Z PRODUKTAMI
                Expanded(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: query.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('Brak produktów'));
                      }

                      var products = snapshot.data!.docs;

                      return GridView.count(
                        crossAxisCount: 4,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.7,
                        children: products.map((product) {
                          var data = product.data();
                          return Card(
                            elevation: 4,
                            child: Column(
                              children: [
                                Image.network(
                                  data['image'],
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image, size: 100),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('${data['price']} PLN'),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const TopNavBar(),
        ],
      ),
    );
  }
}
