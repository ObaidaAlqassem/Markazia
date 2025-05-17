import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/common/widgets/custom_image_view.dart';
import 'package:marakzia_task/model/products_model.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/routes/routes.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final arguments = (product: product,);
        AppRouter.pushNamed(
          Routes.productsDetailsScreen,
          args: arguments,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.greyColor,
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    product.description ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            SizedBox(
              child: CustomImageView(
                imageUrl: product.thumbnail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
