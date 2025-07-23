import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._(); // Prevent instantiation

  /// Light Theme for Input Fields
  static final InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        errorMaxLines: 3,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black54),
        errorStyle: const TextStyle(
          fontSize: 12,
          fontStyle: FontStyle.normal,
          color: Colors.red,
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ).copyWith(color: Colors.black.withOpacity(0.8)),

        // Border when not focused
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1,
            color: Color.fromARGB(255, 31, 30, 30),
          ),
        ),

        // Enabled but not focused
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            width: 1,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),

        // Focused border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.black12),
        ),

        // Error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),

        // Focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.orange),
        ),
      );

  /// Dark Theme for Input Fields
  static final InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        errorMaxLines: 2,

        prefixIconColor: Colors.grey.shade400,
        suffixIconColor: Colors.grey.shade400,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.white),
        hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
        errorStyle: const TextStyle(
          fontSize: 12,
          fontStyle: FontStyle.normal,
          color: Colors.redAccent,
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ).copyWith(color: Colors.white.withOpacity(0.8)),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.white24),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.white30),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.white60),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.orangeAccent),
        ),
      );
}
