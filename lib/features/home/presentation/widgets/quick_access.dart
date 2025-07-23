import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medimate_app/features/home/presentation/widgets/action_button.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: const [
        ActionButton(icon: Iconsax.add_circle, label: "Add Medicine"),
        ActionButton(icon: Iconsax.alarm, label: "Set Reminder"),
        ActionButton(icon: Iconsax.scan_barcode, label: "Scan Medicine"),
        ActionButton(icon: Iconsax.clipboard_text, label: "Medicine List"),
      ],
    );
  }
}
