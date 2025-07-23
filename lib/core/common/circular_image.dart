import 'package:flutter/material.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.padding = AppSizes.sm,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
  });

  final double width, height, padding;
  final BoxFit? fit;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final String image;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
        ),
      ),
    );
  }
}
