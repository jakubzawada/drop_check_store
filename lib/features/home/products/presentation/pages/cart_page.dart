import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double total =
        cartItems.fold(0.0, (sum, item) => sum + (item['price'] ?? 0));

    return Scaffold(
      appBar: AppBar(title: const Text('Twój koszyk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(child: Text('Koszyk jest pusty'))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ListTile(
                          leading: Image.network(item['image'],
                              width: 60, fit: BoxFit.cover),
                          title: Text(item['name']),
                          subtitle: Text('${item['price']} PLN'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            Text('Razem: $total PLN',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Przejdź do płatności'),
            ),
          ],
        ),
      ),
    );
  }
}
