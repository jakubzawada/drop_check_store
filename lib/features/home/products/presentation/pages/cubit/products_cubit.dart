import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit()
      : super(
          const ProductsState(
            products: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start({
    required String category,
    String? size,
    double? minPrice,
    double? maxPrice,
  }) async {
    emit(
      const ProductsState(
        products: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    var query = FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: category);

    if (size != null) {
      query = query.where('size', arrayContains: size);
    }

    if (minPrice != null && maxPrice != null) {
      query = query
          .where('price', isGreaterThanOrEqualTo: minPrice)
          .where('price', isLessThanOrEqualTo: maxPrice);
    }

    _streamSubscription = query.snapshots().listen((products) {
      emit(
        ProductsState(
          products: products.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ProductsState(
            products: [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
