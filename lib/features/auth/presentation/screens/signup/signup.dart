import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medimate_app/core/common/divider.dart';
import 'package:medimate_app/core/common/social_button.dart';
import 'package:medimate_app/core/constants/custom_colors.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';
import 'package:medimate_app/core/utils/validator/validation.dart';
import 'package:medimate_app/features/auth/controller/signup/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final controller1 = SignupController.instance;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultspace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              //Form
              Form(
                key: controller.signupFormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.firstName,
                            validator: (value) => MValidator.validateEmptyText(
                              'First name',
                              value,
                            ),
                            expands: false,
                            decoration: InputDecoration(
                              labelText: AppStrings.firstName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSizes.spaceBtwitems),
                        Expanded(
                          child: TextFormField(
                            controller: controller.lastName,
                            validator: (value) => MValidator.validateEmptyText(
                              'last name',
                              value,
                            ),
                            expands: false,
                            decoration: InputDecoration(
                              labelText: AppStrings.lastName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),

                    // User name
                    TextFormField(
                      controller: controller.userName,
                      validator: (value) =>
                          MValidator.validateEmptyText('User name', value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: AppStrings.userName,
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),
                    //Email
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => MValidator.validateEmail(value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),
                    //Phone Number
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          MValidator.validatePhoneNumber(value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: AppStrings.phoneNumber,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),
                    //Password
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        validator: (value) =>
                            MValidator.validatePassword(value),
                        obscureText: controller.hidePassword.value,
                        expands: false,
                        decoration: InputDecoration(
                          labelText: AppStrings.password,
                          prefixIcon: Icon(Iconsax.user),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(
                              controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    // Term&Conditions CheckBox
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Obx(
                            () => Checkbox(
                              value: controller1.privacyPolicy.value,
                              onChanged: (value) =>
                                  controller1.privacyPolicy.value =
                                      !controller1.privacyPolicy.value,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.spaceBtwitems),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),

                              TextSpan(
                                text: " Privacy Policy",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.apply(
                                      color: AppColors.lightPrimary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.lightPrimary,
                                    ),
                              ),
                              TextSpan(
                                text: " and",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: " Term of use",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.apply(
                                      color: AppColors.lightPrimary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.lightPrimary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    //Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.siguup(),
                        child: Text("Create Account"),
                      ),
                    ),
                  ],
                ),
              ),
              //Divider
              SizedBox(height: AppSizes.spaceBtwSections),
              MDivider(mDivider: "Or Sign Up with "),
              SizedBox(height: AppSizes.spaceBtwitems),
              //Social button
              SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
