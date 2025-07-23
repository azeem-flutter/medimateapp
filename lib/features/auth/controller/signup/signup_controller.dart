import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medimate_app/core/constants/image_string.dart';
import 'package:medimate_app/core/utils/Loader/loader.dart';
import 'package:medimate_app/core/utils/helperfunction/full_screen_loader.dart';
import 'package:medimate_app/core/utils/network/network_manager.dart';
import 'package:medimate_app/data/repositories/authentication/authentication_repository.dart';
import 'package:medimate_app/data/repositories/user/user_repository.dart';
import 'package:medimate_app/features/auth/domain/user/user_model.dart';
import 'package:medimate_app/features/auth/presentation/screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  //Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  //--SIGNUP
  void siguup() async {
    try {
      // Start Loading
      MFullScreenLoader.openLoadingDialog(
        'We are Processing your information...',
        MImages.infinityLoader,
      );
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        //Remove Loader
        MFullScreenLoader.stopLoading();
        return;
      }
      //Privacy Policy Check
      if (!privacyPolicy.value) {
        MLoader.waringSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy policy & Terms of Use.',
        );
        return;
      }

      //Register user in the Firebase Authentication & Save user date in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      //Save Authenticated user date in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: userName.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // Store Success Message
      MLoader.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );
      //Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //Remove loader
      MFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      MLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
