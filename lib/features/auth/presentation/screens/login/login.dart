import 'package:flutter/material.dart';
import 'package:medimate_app/core/common/divider.dart';
import 'package:medimate_app/core/common/social_button.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/features/auth/presentation/screens/login/widgets/login_form.dart';
import 'package:medimate_app/features/auth/presentation/screens/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.sm,
            left: AppSizes.defaultspace,
            bottom: AppSizes.defaultspace,
            right: AppSizes.defaultspace,
          ),
          child: Column(
            children: [
              //Logo,Title & subtitle
              LoginHeader(),

              //Form
              LoginForm(),
              //Divider Text
              MDivider(mDivider: "Or Sign in with".toUpperCase()),
              SizedBox(height: AppSizes.sm),
              //Footer
              SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
