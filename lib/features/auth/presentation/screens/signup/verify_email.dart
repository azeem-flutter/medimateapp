import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:medimate_app/core/common/success_screen.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';
import 'package:medimate_app/core/constants/image_string.dart';
import 'package:medimate_app/data/repositories/authentication/authentication_repository.dart';
import 'package:medimate_app/features/auth/controller/signup/verfiy_email_controller.dart';
import 'package:medimate_app/features/auth/presentation/screens/login/login.dart';
import 'package:medimate_app/features/auth/presentation/screens/signup/signup.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerfiyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await AuthenticationRepository.instance.delete();
              Get.offAll(() => SignupScreen());
            },
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
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
                  child: Lottie.asset(MImages.emailVerification),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              //  Example title
              Text(
                AppStrings.emailVerifytitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),
              // Email
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSizes.spaceBtwitems),
              // subtitle
              Text(
                AppStrings.emailVerifysubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSizes.spaceBtwitems),

              //   button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text(AppStrings.emailButtonname),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwitems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(
                    "Resend",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
