import 'package:flutter/material.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/dimens.dart';

class AppTextStyles {
  // App Bar
  static const TextStyle appBarTitle = TextStyle(
    fontSize: AppDimens.textSizeXL,
    fontWeight: FontWeight.w600,
  );

  // Counter Display
  static TextStyle counterDisplayLarge(int count) {
    final digitCount = count.abs().toString().length;
    double fontSize = AppDimens.textSizeXXXXL;
    
    if (digitCount >= 6) fontSize = AppDimens.textSizeXXL * 1.5;
    else if (digitCount >= 5) fontSize = AppDimens.textSizeXXXL;
    else if (digitCount >= 4) fontSize = AppDimens.textSizeXXL * 1.8;
    
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: count >= 0 ? AppColors.primary : AppColors.decrementButton,
      fontFamily: 'Monospace',
    );
  }
  
  static const TextStyle counterLabel = TextStyle(
    fontSize: AppDimens.textSizeL,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  );

  // Headers
  static TextStyle sectionHeaderLarge(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeXXL,
    fontWeight: FontWeight.w700,
    color: AppColors.getTextPrimary(context),
  );

  static TextStyle sectionHeaderMedium(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeXL,
    fontWeight: FontWeight.w600,
    color: AppColors.getTextPrimary(context),
  );

  static TextStyle sectionHeaderSmall(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeL,
    fontWeight: FontWeight.w600,
    color: AppColors.getTextPrimary(context),
  );

  // Card Titles
  static const TextStyle cardTitleLarge = TextStyle(
    fontSize: AppDimens.textSizeXL,
    fontWeight: FontWeight.w700,
  );
  
  static const TextStyle cardTitleMedium = TextStyle(
    fontSize: AppDimens.textSizeL,
    fontWeight: FontWeight.w600,
  );
  
  static const TextStyle cardTitleSmall = TextStyle(
    fontSize: AppDimens.textSizeM,
    fontWeight: FontWeight.w600,
  );

  // Body Text
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeL,
    color: AppColors.getTextPrimary(context),
  );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeM,
    color: AppColors.getTextPrimary(context),
  );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeS,
    color: AppColors.getTextSecondary(context),
  );

  // Input Styles
  static TextStyle inputText(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeM,
    color: AppColors.getTextPrimary(context),
  );
  
  static TextStyle inputLabel(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeM,
    fontWeight: FontWeight.w500,
    color: AppColors.getTextPrimary(context),
  );
  
  static TextStyle inputHint(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeM,
    color: AppColors.getTextSecondary(context),
  );
  
  static TextStyle inputError(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeS,
    color: AppColors.error,
  );

  // Label Styles
  static TextStyle labelLarge(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeL,
    fontWeight: FontWeight.w500,
    color: AppColors.getTextPrimary(context),
  );
  
  static TextStyle labelMedium(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeM,
    fontWeight: FontWeight.w500,
    color: AppColors.getTextPrimary(context),
  );
  
  static TextStyle labelSmall(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeS,
    fontWeight: FontWeight.w500,
    color: AppColors.getTextSecondary(context),
  );

  // Weather Styles
  static TextStyle weatherLocation(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeS,
    color: AppColors.getTextSecondary(context),
    fontStyle: FontStyle.italic,
  );

  // Caption
  static TextStyle caption(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeXS,
    color: AppColors.getTextSecondary(context),
  );

  // Dialog
  static TextStyle dialogTitle(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeXL,
    fontWeight: FontWeight.w600,
    color: AppColors.getTextPrimary(context),
  );

  static TextStyle dialogContent(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeM,
    color: AppColors.getTextPrimary(context),
  );

  // Stats
  static const TextStyle statValueLarge = TextStyle(
    fontSize: AppDimens.textSizeXXXXL,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle statValueMedium = TextStyle(
    fontSize: AppDimens.textSizeXXXL,
    fontWeight: FontWeight.w700,
  );

  static TextStyle statLabel(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeS,
    color: AppColors.getTextSecondary(context),
  );

  // Feature Items
  static TextStyle featureItem = TextStyle(
    fontSize: AppDimens.textSizeM,
    color: AppColors.gray700,
  );

  // Info Items
  static const TextStyle infoItemLabel = TextStyle(
    fontSize: AppDimens.textSizeS,
    fontWeight: FontWeight.w500,
  );

  // Empty States
  static TextStyle emptyStateTitle(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeXL,
    fontWeight: FontWeight.w600,
    color: AppColors.getTextPrimary(context),
  );

  static TextStyle emptyStateDescription(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeM,
    color: AppColors.getTextSecondary(context),
  );

  // SnackBar
  static const TextStyle snackBarContent = TextStyle(
    fontSize: AppDimens.textSizeM,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Button Text
  static const TextStyle buttonTextLarge = TextStyle(
    fontSize: AppDimens.textSizeL,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonTextMedium = TextStyle(
    fontSize: AppDimens.textSizeM,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle buttonTextSmall = TextStyle(
    fontSize: AppDimens.textSizeS,
    fontWeight: FontWeight.w500,
  );

  // Error Text
  static TextStyle errorText(BuildContext context) => TextStyle(
    fontSize: AppDimens.textSizeS,
    color: AppColors.error,
  );
}