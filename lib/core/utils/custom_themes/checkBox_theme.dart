import 'package:flutter/material.dart';

/// Custom class for light and dark Checkbox Themes
class TCheckboxTheme {
  TCheckboxTheme._();

  static final CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : Colors.black;
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      return states.contains(WidgetState.selected)
          ? Colors.blue
          : Colors.transparent;
    }),
  );

  static final CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : Colors.black;
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      return states.contains(WidgetState.selected)
          ? Colors.blue
          : Colors.transparent;
    }),
  );
}
