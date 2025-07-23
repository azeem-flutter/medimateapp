import 'package:flutter/material.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/constants/image_string.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              width: AppSizes.iconMd,
              height: AppSizes.iconMd,
              image: AssetImage(MImages.googlelogo),
            ),
          ),
        ),
        SizedBox(width: AppSizes.spaceBtwitems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              width: AppSizes.iconMd,
              height: AppSizes.iconMd,
              image: AssetImage(MImages.facebooklogo),
            ),
          ),
        ),
      ],
    );
  }
}
