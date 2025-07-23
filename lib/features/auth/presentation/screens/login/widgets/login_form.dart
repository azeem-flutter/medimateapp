import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/utils/validator/validation.dart';
import 'package:medimate_app/features/auth/controller/login/login_controller.dart';
import 'package:medimate_app/features/auth/presentation/password_configuration/forget_password.dart';
import 'package:medimate_app/features/auth/presentation/screens/signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            //Email Field
            TextFormField(
              controller: controller.email,
              validator: (value) => MValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "Email",
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwitems),
            //Password Field
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    MValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: "Password",
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
            SizedBox(height: AppSizes.spaceBtwitems / 2),
            //Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememmberMe.value,
                        onChanged: (value) => controller.rememmberMe.value =
                            !controller.rememmberMe.value,
                      ),
                    ),
                    Text("remember Me"),
                  ],
                ),

                //Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => ForgetPassword()),
                  child: Text("Forget password"),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            //Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text("Sign in"),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwitems),
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: Text("Create Account"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
