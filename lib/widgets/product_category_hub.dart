import 'package:drop_check_store/app/home/pages/cubit/products_cubit.dart';
import 'package:drop_check_store/app/home/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCategoryHub extends StatelessWidget {
  const ProductCategoryHub({
    super.key,
    required this.widget,
  });

  final ProductsPage widget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.category, color: Colors.black87),
                        const SizedBox(width: 10),
                        Text(
                          widget.category,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (widget.size != null) ...[
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Rozmiar: ${widget.size}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ],
                    ),
                    Text(
                      'Produkty (${state.products.length})',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}
