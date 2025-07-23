import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';
import 'package:medimate_app/features/auth/presentation/password_configuration/reset_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultspace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              AppStrings.forgetPasswordtitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwitems),
            Text(
              AppStrings.forgetPasswordsubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwSections * 2),
            // Text Field
            TextFormField(
              decoration: InputDecoration(
                labelText: AppStrings.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),

            // Submit Button
            SizedBox(height: AppSizes.spaceBtwitems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => ResetPassword()),
                child: Text(AppStrings.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
