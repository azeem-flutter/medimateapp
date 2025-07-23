import 'package:flutter/material.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/features/home/presentation/widgets/alert_banner.dart';
import 'package:medimate_app/features/home/presentation/widgets/greeting_card.dart';
import 'package:medimate_app/features/home/presentation/widgets/quick_access.dart';
import 'package:medimate_app/features/home/presentation/widgets/reminder_card.dart';
import 'package:medimate_app/features/home/presentation/widgets/summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF2F6FF),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 1, 66, 66),
                  Color.fromARGB(255, 49, 145, 129),
                  Color.fromARGB(255, 158, 233, 220),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spaceBtwitems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  GreetingCard(),
                  SizedBox(height: AppSizes.spaceBtwitems),
                  ReminderCard(),
                  SizedBox(height: AppSizes.spaceBtwitems),
                  AlertBanner(),
                  SizedBox(height: AppSizes.spaceBtwitems),
                  QuickActions(),
                  SizedBox(height: AppSizes.spaceBtwitems),
                  HealthSummaryCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
