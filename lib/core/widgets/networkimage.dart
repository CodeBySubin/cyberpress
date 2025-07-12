import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:healthsync/core/constants/app_colors.dart';

class NetworkImageWidget extends StatelessWidget {
 final String url;
 final double? width;
 final double? height;
  const NetworkImageWidget({super.key, required this.url, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
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
}