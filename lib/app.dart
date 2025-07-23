import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medimate_app/binding/general_binding.dart';
import 'package:medimate_app/core/constants/custom_colors.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';
import 'package:medimate_app/core/utils/theme.dart';
import 'package:medimate_app/features/auth/presentation/screens/login/login.dart';
import 'package:medimate_app/features/auth/presentation/screens/signup/verify_email.dart';

class MediMateApp extends StatelessWidget {
  const MediMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      home: Scaffold(
        backgroundColor: AppColors.lightPrimary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
