import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/database/database_product/products.dart';
import 'package:marakzia_task/model/products_model.dart';
import 'package:marakzia_task/services/api/apt_path.dart';
import 'package:marakzia_task/services/api/http/http_service.dart';
import 'package:marakzia_task/view/products/state/products_state.dart';

final productsNotifier = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) {
    return ProductsNotifier(ref: ref);
  },
);

class ProductsNotifier extends StateNotifier<ProductsState> {
  ProductsNotifier({
    required this.ref,
  }) : super(
          ProductsState.initial(),
        ) {
    getProducts();
  }

  final Ref ref;
  final databaseService = DatabaseService.instance;

  Future<void> getProducts() async {
    try {
      final result = await HttpService.instance.get<ProductsModel>(
        url: APIPath.productsList,
        fromJsonMethod: ProductsModel.fromJson,
      );
      if (result.isRight()) {
        state = state.copyWith(
            productsList: AsyncData(
          result.getRight()?.products ?? [],
        ));
        final products = await databaseService.getProducts();
        if (products.isEmpty) {
          await databaseService.updateProducts(result.getRight()!.products);
        }
      } else {
        await handleAnyIssueOnFetchProducts();
      }
    } catch (e) {
      await handleAnyIssueOnFetchProducts();
    }
  }

  Future<void> handleAnyIssueOnFetchProducts() async {
    final products = await databaseService.getProducts();
    state = state.copyWith(
      productsList: AsyncData(
        products,
      ),
    );
  }
}
