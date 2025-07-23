import 'package:flutter/material.dart';
import 'package:medimate_app/core/utils/custom_themes/appBar_theme.dart';
import 'package:medimate_app/core/utils/custom_themes/bottom_sheet_theme.dart';
import 'package:medimate_app/core/utils/custom_themes/checkBox_theme.dart';
import 'package:medimate_app/core/utils/custom_themes/chip_theme.dart';
import 'package:medimate_app/core/utils/custom_themes/elevated_button_theme.dart';
import 'package:medimate_app/core/utils/custom_themes/outlined_button_theme.dart';
import 'package:medimate_app/core/utils/custom_themes/text_field_theme.dart';
import 'package:medimate_app/core/utils/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.LightChipTheme,
    bottomSheetTheme: TBottomSheetTheme.LightBottomSheetTheme,
    appBarTheme: TAppBarTheme.LightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedbuttonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.DarkChipTheme,
    bottomSheetTheme: TBottomSheetTheme.DarkBottomSheetTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedbuttonTheme,
  );
}
