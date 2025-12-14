import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF007AFF);
  static const Color primaryLight = Color(0xFF66B2FF);
  static const Color primaryDark = Color(0xFF0056CC);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF6C757D);
  static const Color secondaryLight = Color(0xFF8A8D91);
  static const Color secondaryDark = Color(0xFF495057);
  
  // Status Colors
  static const Color success = Color(0xFF28A745);
  static const Color successLight = Color(0xFFD4EDDA);
  static const Color successDark = Color(0xFF155724);
  static const Color successContainer = Color(0xFFD4EDDA);
  
  static const Color error = Color(0xFFDC3545);
  static const Color errorLight = Color(0xFFF8D7DA);
  static const Color errorDark = Color(0xFF721C24);
  static const Color errorContainer = Color(0xFFF8D7DA);
  
  static const Color warning = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFF3CD);
  static const Color warningDark = Color(0xFF856404);
  static const Color warningContainer = Color(0xFFFFF3CD);
  
  static const Color info = Color(0xFF17A2B8);
  static const Color infoLight = Color(0xFFD1ECF1);
  static const Color infoDark = Color(0xFF0C5460);
  static const Color infoContainer = Color(0xFFD1ECF1);
  
  // Button Colors
  static const Color incrementButton = Color(0xFF28A745);
  static const Color decrementButton = Color(0xFFDC3545);
  
  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF8F9FA);
  static const Color grey = Color(0xFF6C757D);
  static const Color darkGrey = Color(0xFF343A40);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);
  
  // Text Colors
  static const Color textPrimaryLight = Color(0xFF212529);
  static const Color textSecondaryLight = Color(0xFF6C757D);
  
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  
  // Button Text Colors - NEW
  static const Color textOnPrimary = white; // Text on primary colored buttons
  static const Color textOnSecondary = white; // Text on secondary colored buttons
  static const Color textOnSuccess = white; // Text on success buttons
  static const Color textOnError = white; // Text on error/danger buttons
  static const Color textOnWarning = black; // Text on warning buttons
  static const Color textOnInfo = white; // Text on info buttons
  
  // Card Colors
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);
  
  // Surface Colors
  static const Color surfaceLight = Color(0xFFF8F9FA);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  
  // Border Colors
  static const Color borderLight = Color(0xFFDEE2E6);
  static const Color borderDark = Color(0xFF424242);
  
  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x4D000000);
  
  // Gradient Colors
  static const Color gradientStart = Color(0xFF007AFF);
  static const Color gradientEnd = Color(0xFF00B2FF);
  static const Color gradientSuccessStart = Color(0xFF28A745);
  static const Color gradientSuccessEnd = Color(0xFF20C997);
  static const Color gradientErrorStart = Color(0xFFDC3545);
  static const Color gradientErrorEnd = Color(0xFFFD7E14);
  
  // Disabled Colors
  static const Color disabledLight = Color(0xFFE9ECEF);
  static const Color disabledDark = Color(0xFF424242);
  static const Color disabledTextLight = Color(0xFFADB5BD);
  static const Color disabledTextDark = Color(0xFF6C757D);
  
  // Overlay Colors
  static const Color overlayLight = Color(0x33000000);
  static const Color overlayDark = Color(0x80FFFFFF);
  
  // Helper methods for theme-aware colors
  static Color getBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? backgroundDark
        : backgroundLight;
  }
  
  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? cardDark
        : cardLight;
  }
  
  static Color getTextPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? textPrimaryDark
        : textPrimaryLight;
  }
  
  static Color getTextSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? textSecondaryDark
        : textSecondaryLight;
  }
  
  static Color getSurface(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? surfaceDark
        : surfaceLight;
  }
  
  static Color getBorder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? borderDark
        : borderLight;
  }
  
  static Color getDisabled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? disabledDark
        : disabledLight;
  }
  
  static Color getDisabledText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? disabledTextDark
        : disabledTextLight;
  }
  
  // Theme Colors
  static ColorScheme getColorScheme(BuildContext context) {
    return ColorScheme(
      primary: primary,
      primaryContainer: primaryLight,
      secondary: secondary,
      secondaryContainer: secondaryLight,
      surface: getCardColor(context),
      background: getBackground(context),
      error: error,
      onPrimary: textOnPrimary,
      onSecondary: textOnSecondary,
      onSurface: getTextPrimary(context),
      onBackground: getTextPrimary(context),
      onError: textOnError,
      brightness: Theme.of(context).brightness,
    );
  }
  
  // Button color based on type
  static Color getButtonColor(BuildContext context, ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return primary;
      case ButtonType.secondary:
        return secondary;
      case ButtonType.success:
        return success;
      case ButtonType.error:
      case ButtonType.danger:
        return error;
      case ButtonType.warning:
        return warning;
      case ButtonType.info:
        return info;
      default:
        return primary;
    }
  }
  
  // Text color for button based on type
  static Color getButtonTextColor(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return textOnPrimary;
      case ButtonType.secondary:
        return textOnSecondary;
      case ButtonType.success:
        return textOnSuccess;
      case ButtonType.error:
      case ButtonType.danger:
        return textOnError;
      case ButtonType.warning:
        return textOnWarning;
      case ButtonType.info:
        return textOnInfo;
      default:
        return textOnPrimary;
    }
  }
}

enum ButtonType {
  primary,
  secondary,
  success,
  error,
  danger,
  warning,
  info,
}