import 'package:flutter/material.dart';

class AlertBanner extends StatelessWidget {
  const AlertBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE4E4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text("⚠️ You missed 2 doses today"),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7DB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text("🟡 3 medicines are running low on stock"),
          ),
        ),
      ],
    );
  }
}
