import 'package:drop_check_store/core/widgets/bottom_hub.dart';
import 'package:drop_check_store/features/home/products/presentation/pages/cubit/products_cubit.dart';
import 'package:drop_check_store/features/home/products/presentation/widgets/products_content.dart';
import 'package:flutter/material.dart';
import 'package:drop_check_store/core/widgets/top_nav_bar.dart';
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
                    ProductsContent(widget: widget),
                    const SizedBox(height: 30),
                    const BottomHub(),
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
