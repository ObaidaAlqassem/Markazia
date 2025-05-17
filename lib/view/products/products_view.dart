import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/view/products/provider/products_provider.dart';
import 'package:marakzia_task/view/products/widget/product_widget.dart';
import 'package:marakzia_task/view/products/widget/products_loader.dart';
import 'package:shimmer/shimmer.dart';

class ProductsView extends ConsumerWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productsNotifier);
    final productNotifier = ref.read(productsNotifier.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products List',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: productState.productsList!.when(
        data: (products) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            itemBuilder: (_, index) {
              return ProductWidget(
                product: products[index],
              );
            },
            separatorBuilder: (_, index) {
              return SizedBox(height: 20.h);
            },
            itemCount: products.length,
          );
        },
        error: (e, error) {
          return Text(
            e.toString(),
          );
        },
        loading: () {
          return const ProductsLoader();
        },
      ),
    );
  }
}
