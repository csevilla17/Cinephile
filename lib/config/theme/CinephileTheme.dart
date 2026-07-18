import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF020617);
  static const Color accent = Color(0xFFE11D48);
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
}

class CinephileTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.accent,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.accent,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: GoogleFonts.poppins(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.inter(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: GoogleFonts.inter(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: GoogleFonts.inter(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
