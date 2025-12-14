import 'package:flutter/material.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/dimens.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final double iconSize;
  final double padding;
  final String? tooltip;
  final bool isLoading;
  final bool disabled;
  final Color? labelColor;
  final Color? iconColor;
  final double? width;
  final double? height;
  final bool showLabel;
  final bool hasShadow;
  final BorderRadius? borderRadius;
  final bool isCircular;
  final double elevation;
  final Color? borderColor;
  final double borderWidth;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
    this.iconSize = AppDimens.iconSizeL,
    this.padding = AppDimens.paddingL,
    this.tooltip,
    this.isLoading = false,
    this.disabled = false,
    this.labelColor,
    this.iconColor,
    this.width,
    this.height,
    this.showLabel = true,
    this.hasShadow = true,
    this.borderRadius,
    this.isCircular = true,
    this.elevation = 0,
    this.borderColor,
    this.borderWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveLabelColor = labelColor ?? AppColors.getTextPrimary(context);
    final effectiveIconColor = iconColor ?? AppColors.white;
    final effectiveBorderColor = borderColor ?? color.withOpacity(0.5);
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(
      isCircular ? 100 : AppDimens.borderRadiusL,
    );

    Widget buttonContent = Container(
      width: width ?? (isCircular ? null : 120),
      height: height ?? (isCircular ? null : 48),
      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : effectiveBorderRadius,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: disabled || isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: effectiveIconColor,
          shape: isCircular
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: effectiveBorderRadius,
                  side: BorderSide(
                    color: effectiveBorderColor,
                    width: borderWidth,
                  ),
                ),
          padding: EdgeInsets.all(padding),
          elevation: elevation,
          minimumSize: isCircular
              ? Size.zero
              : Size(width ?? 120, height ?? 48),
        ),
        child: isLoading
            ? SizedBox(
                width: iconSize,
                height: iconSize,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveIconColor),
                ),
              )
            : Icon(icon, size: iconSize, color: effectiveIconColor),
      ),
    );

    // Wrap with tooltip if provided
    if (tooltip != null) {
      buttonContent = Tooltip(
        message: tooltip!,
        child: buttonContent,
      );
    }

    // Return with label or without
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buttonContent,
        if (showLabel && label.isNotEmpty) ...[
          SizedBox(height: AppDimens.spaceS),
          Container(
            constraints: BoxConstraints(maxWidth: width ?? 120),
            child: Text(
              label,
              style: TextStyle(
                fontSize: AppDimens.textSizeS,
                fontWeight: FontWeight.w500,
                color: disabled ? AppColors.gray400 : effectiveLabelColor,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}

// ===== SPECIALIZED ACTION BUTTONS =====

class IncrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final bool disabled;
  final String label;
  final double size;

  const IncrementButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
    this.disabled = false,
    this.label = 'Increment',
    this.size = AppDimens.iconSizeXL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.add,
      label: label,
      color: AppColors.incrementButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Increase counter value',
    );
  }
}

class DecrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final bool disabled;
  final String label;
  final double size;

  const DecrementButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
    this.disabled = false,
    this.label = 'Decrement',
    this.size = AppDimens.iconSizeXL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.remove,
      label: label,
      color: AppColors.decrementButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Decrease counter value',
    );
  }
}

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final bool disabled;
  final String label;
  final double size;

  const ResetButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
    this.disabled = false,
    this.label = 'Reset',
    this.size = AppDimens.iconSizeXL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.refresh,
      label: label,
      color: AppColors.resetButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Reset counter to zero',
    );
  }
}

class ApiButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final bool disabled;
  final String label;
  final double size;

  const ApiButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
    this.disabled = false,
    this.label = 'API',
    this.size = AppDimens.iconSizeXL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.api,
      label: label,
      color: AppColors.apiButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Fetch random number from API',
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onPressed;
  final double size;

  const QuickActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onPressed,
    this.size = AppDimens.iconSizeL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: size,
                    color: color,
                  ),
                  SizedBox(height: AppDimens.spaceXXS),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: AppDimens.textSizeS,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: AppDimens.spaceS),
        Text(
          label,
          style: TextStyle(
            fontSize: AppDimens.textSizeS,
            fontWeight: FontWeight.w500,
            color: AppColors.getTextSecondary(context),
          ),
        ),
      ],
    );
  }
}

class TextActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool disabled;
  final double height;
  final double borderRadius;

  const TextActionButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.isLoading = false,
    this.disabled = false,
    this.height = AppDimens.buttonHeight,
    this.borderRadius = AppDimens.buttonRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: disabled || isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          minimumSize: Size.fromHeight(height),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: AppDimens.textSizeM,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}

// Factory method for creating themed action buttons
class ActionButtonFactory {
  static ActionButton createIncrement({
    required VoidCallback onPressed,
    bool isLoading = false,
    bool disabled = false,
    String label = 'Increment',
    double size = AppDimens.iconSizeXL,
  }) {
    return ActionButton(
      icon: Icons.add,
      label: label,
      color: AppColors.incrementButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Increase counter value',
    );
  }

  static ActionButton createDecrement({
    required VoidCallback onPressed,
    bool isLoading = false,
    bool disabled = false,
    String label = 'Decrement',
    double size = AppDimens.iconSizeXL,
  }) {
    return ActionButton(
      icon: Icons.remove,
      label: label,
      color: AppColors.decrementButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Decrease counter value',
    );
  }

  static ActionButton createReset({
    required VoidCallback onPressed,
    bool isLoading = false,
    bool disabled = false,
    String label = 'Reset',
    double size = AppDimens.iconSizeXL,
  }) {
    return ActionButton(
      icon: Icons.refresh,
      label: label,
      color: AppColors.resetButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Reset counter to zero',
    );
  }

  static ActionButton createApi({
    required VoidCallback onPressed,
    bool isLoading = false,
    bool disabled = false,
    String label = 'API',
    double size = AppDimens.iconSizeXL,
  }) {
    return ActionButton(
      icon: Icons.api,
      label: label,
      color: AppColors.apiButton,
      onPressed: onPressed,
      iconSize: size,
      isLoading: isLoading,
      disabled: disabled,
      tooltip: 'Fetch random number from API',
    );
  }
}