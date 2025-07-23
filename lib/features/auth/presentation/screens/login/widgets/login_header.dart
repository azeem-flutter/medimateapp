import 'package:flutter/material.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/constants/image_string.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(image: AssetImage(MImages.logo)),
        Text("Welcome Back", style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: AppSizes.sm),
        Text(
          "Sign in to manage your medications.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
