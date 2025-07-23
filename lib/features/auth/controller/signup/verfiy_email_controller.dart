import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medimate_app/core/common/success_screen.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';
import 'package:medimate_app/core/constants/image_string.dart';
import 'package:medimate_app/core/utils/Loader/loader.dart';
import 'package:medimate_app/data/repositories/authentication/authentication_repository.dart';

class VerfiyEmailController extends GetxController {
  static VerfiyEmailController get instance => Get.find();
  // Send Email Whenever Verify Screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MLoader.successSnackBar(
        title: 'Email',
        message: 'Please check your Inbox and verfiy your email',
      );
    } catch (e) {
      MLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: MImages.emailSuccess,
            title: AppStrings.emailSuccesstitle,
            subTitle: AppStrings.emailSuccesssubtitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  // Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: MImages.emailSuccess,
          title: AppStrings.emailSuccesstitle,
          subTitle: AppStrings.emailSuccesssubtitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
