import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/widgets/custom_image_view.dart';
import 'package:marakzia_task/model/products_model.dart';
import 'package:marakzia_task/view/products/widget/product_single_widget.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products Details',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            ProductSingleWidget(
              product: product,
            ),
            if (product.images != null && product.images!.isNotEmpty) ...[
              SizedBox(height: 20.h),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h),
                  itemBuilder: (_, index) {
                    final productImage = product.images![index];
                    return CustomImageView(
                      imageUrl: productImage,
                    );
                  },
                  itemCount: product.images!.length,
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
