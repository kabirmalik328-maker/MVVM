import 'package:counter_app/model/counter_model.dart';
import 'package:counter_app/util/app_texts.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/text_styles.dart';
import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final CounterModel counter;
  final bool showLabel;

  const CounterDisplay({
    Key? key,
    required this.counter,
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositive = counter.count >= 0;
    final digitCount = counter.count.abs().toString().length;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isPositive ? AppColors.success.withOpacity(0.3) : AppColors.error.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLabel)
            Text(
              AppTexts.currentCount,
              style: AppTextStyles.counterLabel.copyWith(
                color: AppColors.getTextSecondary(context),
              ),
            ),
          
          if (showLabel) const SizedBox(height: 8),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              // Sign indicator
              if (!isPositive)
                Text(
                  '-',
                  style: TextStyle(
                    fontSize: digitCount >= 6 ? 48 : 64,
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                  ),
                ),
              
              // Counter value
              Text(
                counter.count.abs().toString(),
                style: AppTextStyles.counterDisplayLarge(counter.count),
              ),
              
              // Digit count badge
              if (digitCount > 3)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: digitCount >= 6
                          ? AppColors.warningContainer
                          : AppColors.infoContainer,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: digitCount >= 6
                            ? AppColors.warning.withOpacity(0.2)
                            : AppColors.info.withOpacity(0.2),
                      ),
                    ),
                    child: Text(
                      '$digitCount ${AppTexts.digits.toLowerCase()}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: digitCount >= 6 ? AppColors.warningDark : AppColors.infoDark,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Status indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isPositive ? AppColors.successContainer : AppColors.errorContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isPositive ? AppColors.success.withOpacity(0.2) : AppColors.error.withOpacity(0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  size: 16,
                  color: isPositive ? AppColors.success : AppColors.error,
                ),
                const SizedBox(width: 4),
                Text(
                  isPositive ? AppTexts.positive : AppTexts.negative,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isPositive ? AppColors.success : AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}