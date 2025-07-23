import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medimate_app/core/constants/custom_strings.dart';
import 'package:medimate_app/core/constants/image_string.dart';
import 'package:medimate_app/core/services/firebase_service.dart';
import 'package:medimate_app/features/auth/presentation/screens/login/login.dart';
import 'package:medimate_app/features/auth/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:medimate_app/features/home/presentation/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkNavigation(); // ✅ this was missing
  }

  Future<void> _checkNavigation() async {
    await Future.delayed(const Duration(seconds: 5));
    final prefs = await SharedPreferences.getInstance();
    final bool isOnboardingSeen = prefs.getBool('onboarding_done') ?? false;
    final isLoggedIn = FirebaseService.currentUser != null;

    if (!isOnboardingSeen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    } else if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 174, 226, 190),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Make sure this path is correct & JSON file exists
            Lottie.asset(
              MImages.applogo,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(221, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
