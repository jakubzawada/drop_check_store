import 'package:drop_check_store/features/home/products/presentation/pages/cubit/products_cubit.dart';
import 'package:drop_check_store/features/home/products/presentation/pages/products_page.dart';
import 'package:drop_check_store/features/home/products/presentation/widgets/filter_sidebar.dart';
import 'package:drop_check_store/features/home/products/presentation/widgets/product_grind_view.dart';
import 'package:drop_check_store/features/home/products/presentation/widgets/products_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsContent extends StatelessWidget {
  final ProductsPage widget;

  const ProductsContent({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        Column(
          children: [
            FilterSidebar(widget: widget),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return ProductsHeader(
                    category: widget.category,
                    size: widget.size,
                    productCount: state.products.length,
                  );
                },
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        'Something went wrong: ${state.errorMessage}',
                      ),
                    );
                  }

                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.products.isEmpty) {
                    return const Center(child: Text('Brak produktów'));
                  }

                  return ProductGridView();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
