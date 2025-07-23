import 'package:flutter/material.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hi, Azeem 👋",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Let’s stay on track with",
              style: TextStyle(color: Colors.white),
            ),
            Text("your health today.", style: TextStyle(color: Colors.white)),
          ],
        ),
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
      ],
    );
  }
}
