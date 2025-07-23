import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();
  static ChipThemeData LightChipTheme = ChipThemeData(
    disabledColor: Color.fromRGBO(
      158,
      158,
      158,
      0.4,
    ), // same as grey with 40% opacity
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
  static ChipThemeData DarkChipTheme = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
