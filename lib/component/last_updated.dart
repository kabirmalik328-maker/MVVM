import 'package:flutter/material.dart';
import 'package:counter_app/util/app_texts.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/dimens.dart';

class LastUpdated extends StatelessWidget {
  final DateTime dateTime;

  const LastUpdated({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimens.cardElevationSmall,
      child: Padding(
        padding: EdgeInsets.all(AppDimens.paddingM),
        child: Row(
          children: [
            Icon(Icons.access_time, color: AppColors.primary),
            SizedBox(width: AppDimens.spaceM),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.lastUpdated,
                  style: TextStyle(
                    fontSize: AppDimens.textSizeS,
                    color: AppColors.getTextSecondary(context),
                  ),
                ),
                Text(
                  '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimens.textSizeM,
                    color: AppColors.getTextPrimary(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}