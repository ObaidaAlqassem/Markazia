import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageView extends StatelessWidget {
  final String? imageUrl;

  const CustomImageView({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 100.h,
      width: 100.w,
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) =>
          Center(child: const CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
