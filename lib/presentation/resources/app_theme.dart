import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    // fontFamily: "IRANSansX",
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: AppColors.surface,
      prefixIconColor: AppColors.icon,
      hintStyle: TextStyle(fontSize: 14),
      contentPadding: padding8,
      border: OutlineInputBorder(
        borderRadius: borderRadius10,
        borderSide: BorderSide.none,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.outline,
      thickness: 0.3,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.icon,
      unselectedItemColor: AppColors.outline,
      selectedIconTheme: IconThemeData(
        color: AppColors.icon,
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(color: AppColors.outline, size: 30),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
    ),
    cardTheme: const CardTheme(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius20),
    ));
