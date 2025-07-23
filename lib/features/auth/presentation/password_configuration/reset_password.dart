import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';
import 'package:medimate_app/core/constants/image_string.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultspace),
          child: Column(
            children: [
              // ✅ Lottie animation (smaller + centered)
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Lottie.asset(MImages.resendPassword),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              //  Example title
              Text(
                AppStrings.changeYourpasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              SizedBox(height: AppSizes.spaceBtwitems),
              // subtitle
              Text(
                AppStrings.changeYourPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              //   button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(AppStrings.done),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwitems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(AppStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
