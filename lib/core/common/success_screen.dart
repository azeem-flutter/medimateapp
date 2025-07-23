import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subTitle;
  final VoidCallback onPressed;
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultspace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20), // Smaller top space
              // ✅ Lottie animation (smaller + centered)
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Lottie.asset(image),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              //  Example title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              SizedBox(height: AppSizes.spaceBtwitems),
              // subtitle
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              //   button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(AppStrings.emailButtonname),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
