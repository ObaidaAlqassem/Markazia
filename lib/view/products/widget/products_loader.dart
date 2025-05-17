import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoader extends StatelessWidget {
  const ProductsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          baseColor: AppColor.primaryColor,
          highlightColor: AppColor.primaryColor.withOpacity(0.4),
          child: Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, index) {
        return SizedBox(height: 20.h);
      },
      itemCount: 5,
    );
  }
}
