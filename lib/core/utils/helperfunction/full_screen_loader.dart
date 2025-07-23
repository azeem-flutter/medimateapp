import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medimate_app/core/constants/custom_colors.dart';
import 'package:medimate_app/core/utils/helperfunction/animation_loader.dart';
import 'package:medimate_app/core/utils/helperfunction/helper_function.dart';

class MFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: MHelperFunction.isDarkMode(Get.context!)
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: MAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                  // You can pass text and animation as dynamic if needed
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
