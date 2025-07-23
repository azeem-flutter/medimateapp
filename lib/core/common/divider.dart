import 'package:flutter/material.dart';

class MDivider extends StatelessWidget {
  final String mDivider;
  const MDivider({super.key, required this.mDivider});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: Colors.black,
            indent: 60,
            endIndent: 5,
            thickness: 0.5,
          ),
        ),
        Text(mDivider, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: Colors.black,
            indent: 5,
            endIndent: 60,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
