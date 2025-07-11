import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:healthsync/core/constants/app_colors.dart';
Widget networkImageWidget(String url, {double? width, double? height}) {
  if (url == 'N/A' || url.isEmpty) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(""),
        ),
        color: AppColors.primaryColor,
      ),
    );
  }

  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
        color: AppColors.primaryColor,
      ),
    ),
    placeholder: (context, url) => Container(
      width: width,
      height: height,
      color: AppColors.primaryColor,
      child: const Center(child: CircularProgressIndicator()),
    ),
    errorWidget: (context, url, error) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(""),
        ),
        color: AppColors.primaryColor,
      ),
    ),
  );
}