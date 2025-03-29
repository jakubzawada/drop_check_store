import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text(widget.category.toUpperCase())),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: query.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Brak produktów'));
          }

          var products = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index].data();
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      product['image'],
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Text(product['name'] ?? 'Brak nazwy'),
                    Text('${product['price']} zł'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
