import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/model/products_model.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required AsyncValue<List<Product>>? productsList,
  }) = _ProductsState;

  factory ProductsState.initial() => const ProductsState(
        productsList: AsyncLoading(),
      );
}
