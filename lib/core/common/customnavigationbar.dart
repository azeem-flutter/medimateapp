import 'package:flutter/material.dart';

class Customnavigationbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const Customnavigationbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Color(0xFFEEF2FF),
      selectedItemColor: Color(0xFF4461F2),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services),
          label: "Medicines",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Reminders"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
