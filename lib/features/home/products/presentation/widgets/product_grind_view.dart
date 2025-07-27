import 'package:drop_check_store/features/home/products/presentation/pages/cubit/products_cubit.dart';
import 'package:drop_check_store/features/home/products/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return GridView.count(
          crossAxisCount: 4,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: state.products.map((product) {
            var data = product.data();
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsPage(productData: data),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Image.network(
                        data['image'],
                        height: 350,
                        width: 300,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${data['price']} PLN',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
