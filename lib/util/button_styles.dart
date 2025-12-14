import 'package:flutter/material.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/dimens.dart';

class ButtonStyles {
  // FAB Theme
  static final FloatingActionButtonThemeData fabTheme = FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: AppDimens.cardElevationLarge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
    ),
    extendedSizeConstraints: BoxConstraints.tightFor(
      height: AppDimens.buttonHeightL,
    ),
  );

  // Primary Button
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(
      horizontal: AppDimens.paddingL,
      vertical: AppDimens.paddingM,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
    ),
    elevation: AppDimens.cardElevationMedium,
  );

  // Secondary Button
  static final ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondary,
    foregroundColor: AppColors.textOnSecondary,
    padding: EdgeInsets.symmetric(
      horizontal: AppDimens.paddingL,
      vertical: AppDimens.paddingM,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
    ),
    elevation: AppDimens.cardElevationMedium,
  );

  // Outlined Button
  static final ButtonStyle outlinedButton = OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    side: BorderSide(color: AppColors.primary, width: 1),
    padding: EdgeInsets.symmetric(
      horizontal: AppDimens.paddingL,
      vertical: AppDimens.paddingM,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
    ),
  );

  // Text Button
  static final ButtonStyle textButton = TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: EdgeInsets.symmetric(
      horizontal: AppDimens.paddingM,
      vertical: AppDimens.paddingS,
    ),
  );

  // Danger Button
  static final ButtonStyle dangerButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.error,
    foregroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(
      horizontal: AppDimens.paddingL,
      vertical: AppDimens.paddingM,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
    ),
    elevation: AppDimens.cardElevationMedium,
  );

  // Success Button
  static final ButtonStyle successButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.success,
    foregroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(
      horizontal: AppDimens.paddingL,
      vertical: AppDimens.paddingM,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
    ),
    elevation: AppDimens.cardElevationMedium,
  );

  // Small Button
  static final ButtonStyle smallButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(
      horizontal: AppDimens.paddingM,
      vertical: AppDimens.paddingS,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusM),
    ),
    elevation: AppDimens.cardElevationSmall,
  );

  // Icon Button
  static final ButtonStyle iconButton = IconButton.styleFrom(
    backgroundColor: AppColors.primary.withOpacity(0.1),
    foregroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusM),
    ),
  );
}