import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:medimate_app/core/constants/image_string.dart';
import 'package:medimate_app/core/constants/onboarding_title.dart';
import 'package:medimate_app/features/auth/presentation/screens/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': MImages.onboardingImage1,
      'title': Mtitles.onBoardingTitle1,
      'subtitle': Mtitles.onBoardingsubtitle1,
    },
    {
      'image': MImages.onboardingImage2,
      'title': Mtitles.onBoardingTitle2,
      'subtitle': Mtitles.onBoardingsubtitle2,
    },
    {
      'image': MImages.onboardingImage3,
      'title': Mtitles.onBoardingTitle3,
      'subtitle': Mtitles.onBoardingsubtitle3,
    },
  ];

  void nextPage() {
    if (currentPage == onboardingData.length - 1) {
      final storage = GetStorage();

      if (kDebugMode) {
        print('=============Get storage=============');
        print(storage.read('isFirstTime'));
      }
      storage.write('isFirstTime', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    _pageController.jumpToPage(onboardingData.length - 1);
  }

  void onDotClicked(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() => currentPage = index);
                print('Current page: ' + currentPage.toString());
              },
              itemBuilder: (_, index) {
                final data = onboardingData[index];
                return OnboardingPage(
                  image: data['image']!,
                  title: data['title']!,
                  subtitle: data['subtitle']!,
                );
              },
            ),

            // Skip Button (top right)
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),

            // Page Indicator and Forward Button (bottom center)
            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: onboardingData.length,
                    onDotClicked: onDotClicked,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.black,
                      dotWidth: 6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: nextPage,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.black,
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Lottie.asset(image, fit: BoxFit.contain)),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
