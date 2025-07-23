import 'package:flutter/material.dart';

class HealthSummaryCard extends StatelessWidget {
  const HealthSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Health Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("✅ 3/5 medicines taken today\n🔴 2 missed"),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text("View Calendar Tracker"),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF4461F2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
