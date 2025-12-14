import 'package:flutter/material.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/dimens.dart';
import 'package:counter_app/util/app_texts.dart';
import 'package:counter_app/viewmodel/counter_viewmodel.dart';
import 'package:provider/provider.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CounterViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Decrement Button
        ElevatedButton(
          onPressed: viewModel.decrement,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.decrementButton,
            foregroundColor: AppColors.white,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.paddingXL,
              vertical: AppDimens.paddingL,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
            ),
            elevation: AppDimens.cardElevationMedium,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.remove),
              SizedBox(width: AppDimens.spaceS),
              Text(
                AppTexts.decrementButton,
                style: TextStyle(
                  fontSize: AppDimens.textSizeL,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        
        SizedBox(width: AppDimens.spaceXL),
        
        // Increment Button
        ElevatedButton(
          onPressed: viewModel.increment,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.incrementButton,
            foregroundColor: AppColors.white,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.paddingXL,
              vertical: AppDimens.paddingL,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
            ),
            elevation: AppDimens.cardElevationMedium,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.add),
              SizedBox(width: AppDimens.spaceS),
              Text(
                AppTexts.incrementButton,
                style: TextStyle(
                  fontSize: AppDimens.textSizeL,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}