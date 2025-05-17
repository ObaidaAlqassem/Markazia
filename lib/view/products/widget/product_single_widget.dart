import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/common/widgets/custom_image_view.dart';
import 'package:marakzia_task/model/products_model.dart';

class ProductSingleWidget extends StatelessWidget {
  final Product product;

  const ProductSingleWidget({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 10.h),
                Text(
                  (product.category ?? '').toUpperCase(),
                  style: TextStyle(
                    color: AppColor.yellowColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  (product.price ?? 0.0).toStringAsFixed(2),
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  product.description ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: AppColor.yellowColor,
          ),
          SizedBox(width: 3.w),
          Text(
            product.rating.toString(),
          )
        ],
      ),
    );
  }
}
