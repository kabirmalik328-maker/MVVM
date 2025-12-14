import 'package:flutter/material.dart';
import 'package:counter_app/util/colors.dart';
import 'package:counter_app/util/dimens.dart';
import 'package:counter_app/util/text_styles.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.paddingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.weatherCloudy.withOpacity(0.2),
            AppColors.weatherRainy.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(AppDimens.cardRadiusLarge),
        border: Border.all(color: AppColors.weatherCloudy.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weather Information',
                style: AppTextStyles.sectionHeaderMedium(context),
              ),
              Icon(
                Icons.cloud,
                size: AppDimens.iconSizeL,
                color: AppColors.weatherCloudy,
              ),
            ],
          ),
          
          SizedBox(height: AppDimens.spaceL),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '25°C',
                    style: TextStyle(
                      fontSize: AppDimens.textSizeXXL * 1.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.weatherCloudy,
                    ),
                  ),
                  SizedBox(height: AppDimens.spaceXS),
                  Text(
                    'Temperature',
                    style: TextStyle(
                      fontSize: AppDimens.textSizeS,
                      color: AppColors.getTextSecondary(context),
                    ),
                  ),
                ],
              ),
              
              Column(
                children: [
                  Text(
                    '65%',
                    style: TextStyle(
                      fontSize: AppDimens.textSizeXXL * 1.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.weatherRainy,
                    ),
                  ),
                  SizedBox(height: AppDimens.spaceXS),
                  Text(
                    'Humidity',
                    style: TextStyle(
                      fontSize: AppDimens.textSizeS,
                      color: AppColors.getTextSecondary(context),
                    ),
                  ),
                ],
              ),
              
              Column(
                children: [
                  Text(
                    '12 km/h',
                    style: TextStyle(
                      fontSize: AppDimens.textSizeXXL,
                      fontWeight: FontWeight.bold,
                      color: AppColors.weatherSunny,
                    ),
                  ),
                  SizedBox(height: AppDimens.spaceXS),
                  Text(
                    'Wind Speed',
                    style: TextStyle(
                      fontSize: AppDimens.textSizeS,
                      color: AppColors.getTextSecondary(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          SizedBox(height: AppDimens.spaceL),
          
          Container(
            padding: EdgeInsets.all(AppDimens.paddingM),
            decoration: BoxDecoration(
              color: AppColors.getCardBackground(context).withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusM),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: AppDimens.iconSizeM,
                  color: AppColors.primary,
                ),
                SizedBox(width: AppDimens.spaceS),
                Text(
                  'New York, USA',
                  style: TextStyle(
                    fontSize: AppDimens.textSizeM,
                    color: AppColors.getTextPrimary(context),
                  ),
                ),
                const Spacer(),
                Text(
                  'Partly Cloudy',
                  style: TextStyle(
                    fontSize: AppDimens.textSizeS,
                    color: AppColors.getTextSecondary(context),
                    fontStyle: FontStyle.italic,
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