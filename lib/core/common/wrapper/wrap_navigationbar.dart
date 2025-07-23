import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medimate_app/core/common/customnavigationbar.dart';
import 'package:medimate_app/core/common/wrapper/controller/navigationbar_controller.dart';
import 'package:medimate_app/features/home/presentation/home_screen.dart';
import 'package:medimate_app/features/medicine/presentation/screens/medicine_screen.dart';
import 'package:medimate_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:medimate_app/features/reminder/presentation/screens/reminder_screen.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationbarController());
    final screens = [
      HomeScreen(),
      MedicineScreen(),
      ReminderScreen(),
      ProfileScreen(),
    ];
    return Obx(
      () => Scaffold(
        body: screens[navController.currentIndex.value],
        bottomNavigationBar: Customnavigationbar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.chnageIndex,
        ),
      ),
    );
  }
}
