import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BestsellerProducts extends StatelessWidget {
  const BestsellerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('bestseller').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('Brak bestsellerów.'));
        }

        var products = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: products.map((product) {
              var data = product.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Image.network(
                    data['image'],
                    width: 400,
                    height: 400,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 200),
                  ),
                  Text(data['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('${data['price']} PLN'),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
