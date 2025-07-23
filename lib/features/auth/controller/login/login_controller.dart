import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medimate_app/core/constants/image_string.dart';
import 'package:medimate_app/core/utils/Loader/loader.dart';
import 'package:medimate_app/core/utils/helperfunction/full_screen_loader.dart';
import 'package:medimate_app/core/utils/network/network_manager.dart';
import 'package:medimate_app/data/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  //variables
  final rememmberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email and Password Signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading
      MFullScreenLoader.openLoadingDialog(
        'Logging you in... ',
        MImages.infinityLoader,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememmberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredential = await AuthenticationRepository.instance
          .loginwithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      MFullScreenLoader.stopLoading();

      // Redriect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MFullScreenLoader.stopLoading();
      MLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
