part of 'products_cubit.dart';

@immutable
class ProductsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> products;
  final bool isLoading;
  final String errorMessage;

  const ProductsState({
    required this.products,
    required this.isLoading,
    required this.errorMessage,
  });

  ProductsState copyWith({
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? products,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
