import 'package:drop_check_store/app/home/pages/cubit/products_cubit.dart';
import 'package:drop_check_store/widgets/bottom_hub.dart';
import 'package:drop_check_store/widgets/filter_sidebar.dart';
import 'package:drop_check_store/widgets/product_category_hub.dart';
import 'package:drop_check_store/widgets/product_grind_view.dart';
import 'package:flutter/material.dart';
import 'package:drop_check_store/widgets/top_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  final String category;
  final String? size;
  final double? minPrice;
  final double? maxPrice;

  const ProductsPage({
    super.key,
    required this.category,
    this.size,
    this.minPrice,
    this.maxPrice,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()
        ..start(
          category: widget.category,
          size: widget.size,
          minPrice: widget.minPrice,
          maxPrice: widget.maxPrice,
        ),
      child: Scaffold(
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
                                  return ProductCategoryHub(widget: widget);
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
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  var products = state.products;

                                  if (products.isEmpty) {
                                    return const Center(
                                        child: Text('Brak produktów'));
                                  }

                                  return ProductGridView(products: products);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    BottomHub(),
                  ],
                ),
              ),
            ),
            const TopNavBar(),
          ],
        ),
      ),
    );
  }
}
