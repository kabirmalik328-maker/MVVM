// import 'package:counter_app/model/weather_model.dart';
// import 'package:counter_app/util/app_texts.dart';
// import 'package:counter_app/util/text_styles.dart';
// import 'package:counter_app/util/colors.dart';
// import 'package:counter_app/util/dimens.dart';
// import 'package:counter_app/util/icons.dart';
// import 'package:flutter/material.dart';

// class WeatherDisplay extends StatelessWidget {
//   final WeatherModel weather;
//   final VoidCallback onRefresh;
//   final bool showRefreshButton;
//   final bool showMockIndicator;
//   final bool showLocation;
//   final Color? backgroundColor;
//   final BorderRadius? borderRadius;
//   final EdgeInsetsGeometry? padding;
//   final double? elevation;

//   const WeatherDisplay({
//     Key? key,
//     required this.weather,
//     required this.onRefresh,
//     this.showRefreshButton = true,
//     this.showMockIndicator = true,
//     this.showLocation = true,
//     this.backgroundColor,
//     this.borderRadius,
//     this.padding,
//     this.elevation,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(AppDimens.marginM),
//       decoration: BoxDecoration(
//         color: backgroundColor ?? AppColors.getCardBackground(context),
//         borderRadius: borderRadius ?? BorderRadius.circular(AppDimens.cardRadiusLarge),
//         border: Border.all(
//           color: AppColors.getBorder(context).withOpacity(0.2),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.shadow.withOpacity(0.1),
//             blurRadius: AppDimens.shadowBlurM,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: padding ?? EdgeInsets.all(AppDimens.paddingL),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       AppIcons.cloud,
//                       color: AppColors.primary,
//                       size: AppDimens.iconSizeL,
//                     ),
//                     SizedBox(width: AppDimens.spaceM),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           AppTexts.weather,
//                           style: AppTextStyles.sectionHeaderMedium(context),
//                         ),
//                         if (showLocation && weather.location.isNotEmpty)
//                           SizedBox(height: AppDimens.spaceXXS),
//                         if (showLocation && weather.location.isNotEmpty)
//                           Text(
//                             weather.location,
//                             style: AppTextStyles.weatherLocation(context),
//                           ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 if (showRefreshButton)
//                   IconButton(
//                     icon: Icon(
//                       AppIcons.refresh,
//                       size: AppDimens.iconSizeM,
//                       color: AppColors.primary,
//                     ),
//                     onPressed: onRefresh,
//                     tooltip: AppTexts.refreshWeather,
//                   ),
//               ],
//             ),

//             SizedBox(height: AppDimens.spaceL),

//             // Weather Items
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 WeatherItem(
//                   icon: AppIcons.thermostat,
//                   label: AppTexts.temperature,
//                   value: weather.temperature,
//                   color: AppColors.weatherSunny,
//                 ),
//                 WeatherItem(
//                   icon: AppIcons.waterDrop,
//                   label: AppTexts.humidity,
//                   value: weather.humidity,
//                   color: AppColors.weatherRainy,
//                 ),
//                 WeatherItem(
//                   icon: _getWeatherIcon(weather.condition),
//                   label: AppTexts.condition,
//                   value: weather.condition,
//                   color: _getWeatherColor(weather.condition),
//                 ),
//               ],
//             ),

//             // Additional Info
//             SizedBox(height: AppDimens.spaceM),
            
//             if (weather.isMock && showMockIndicator)
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: AppDimens.paddingM,
//                   vertical: AppDimens.paddingS,
//                 ),
//                 decoration: BoxDecoration(
//                   color: AppColors.warning.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(AppDimens.borderRadiusS),
//                   border: Border.all(
//                     color: AppColors.warning.withOpacity(0.3),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.info_outline,
//                       size: AppDimens.iconSizeS,
//                       color: AppColors.warning,
//                     ),
//                     SizedBox(width: AppDimens.spaceS),
//                     Text(
//                       AppTexts.mockData,
//                       style: TextStyle(
//                         fontSize: AppDimens.textSizeXS,
//                         color: AppColors.warning,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//             // Last Updated
//             SizedBox(height: AppDimens.spaceM),
//             Text(
//               AppTexts.apiDataSource,
//               style: AppTextStyles.caption(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   IconData _getWeatherIcon(String condition) {
//     final cond = condition.toLowerCase();
//     if (cond.contains('sunny') || cond.contains('clear')) {
//       return AppIcons.wbSunny;
//     } else if (cond.contains('cloudy')) {
//       return AppIcons.cloud;
//     } else if (cond.contains('rain')) {
//       return AppIcons.beachAccess;
//     } else if (cond.contains('snow')) {
//       return AppIcons.acUnit;
//     } else if (cond.contains('storm')) {
//       return AppIcons.flashOn;
//     } else if (cond.contains('wind')) {
//       return AppIcons.air;
//     } else if (cond.contains('fog')) {
//       return AppIcons.filterDrama;
//     }
//     return AppIcons.wbSunny;
//   }

//   Color _getWeatherColor(String condition) {
//     final cond = condition.toLowerCase();
//     if (cond.contains('sunny') || cond.contains('clear')) {
//       return AppColors.weatherSunny;
//     } else if (cond.contains('cloudy') || cond.contains('overcast')) {
//       return AppColors.weatherCloudy;
//     } else if (cond.contains('rain') || cond.contains('drizzle')) {
//       return AppColors.weatherRainy;
//     } else if (cond.contains('snow') || cond.contains('frost')) {
//       return AppColors.weatherSnowy;
//     } else if (cond.contains('storm') || cond.contains('thunder')) {
//       return AppColors.weatherStormy;
//     } else if (cond.contains('wind')) {
//       return AppColors.weatherWindy;
//     } else if (cond.contains('fog') || cond.contains('mist')) {
//       return AppColors.weatherFoggy;
//     }
//     return AppColors.primary;
//   }
// }

// class WeatherItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   final Color? color;
//   final double iconSize;
//   final double spacing;

//   const WeatherItem({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.value,
//     this.color,
//     this.iconSize = AppDimens.iconSizeL,
//     this.spacing = AppDimens.spaceXS,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final itemColor = color ?? AppColors.primary;

//     return Container(
//       constraints: BoxConstraints(minWidth: 80, maxWidth: 100),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: EdgeInsets.all(AppDimens.paddingS),
//             decoration: BoxDecoration(
//               color: itemColor.withOpacity(0.1),
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: itemColor.withOpacity(0.3),
//               ),
//             ),
//             child: Icon(
//               icon,
//               size: iconSize,
//               color: itemColor,
//             ),
//           ),
//           SizedBox(height: spacing),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: AppDimens.textSizeL,
//               fontWeight: FontWeight.bold,
//               color: itemColor,
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: AppDimens.textSizeS,
//               color: AppColors.getTextSecondary(context),
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Simple Weather Display (Minimalist)
// class SimpleWeatherDisplay extends StatelessWidget {
//   final WeatherModel weather;
//   final VoidCallback onRefresh;
//   final bool showRefreshButton;

//   const SimpleWeatherDisplay({
//     Key? key,
//     required this.weather,
//     required this.onRefresh,
//     this.showRefreshButton = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       margin: EdgeInsets.all(AppDimens.marginS),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppDimens.cardRadius),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(AppDimens.paddingL),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   AppTexts.weather,
//                   style: AppTextStyles.cardTitleMedium,
//                 ),
//                 if (showRefreshButton)
//                   IconButton(
//                     icon: Icon(
//                       AppIcons.refresh,
//                       size: AppDimens.iconSizeM,
//                     ),
//                     onPressed: onRefresh,
//                     padding: EdgeInsets.zero,
//                     constraints: const BoxConstraints(),
//                   ),
//               ],
//             ),
//             SizedBox(height: AppDimens.spaceM),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 WeatherItem(
//                   icon: AppIcons.thermostat,
//                   label: AppTexts.temperature,
//                   value: weather.temperature,
//                   color: AppColors.weatherSunny,
//                   iconSize: AppDimens.iconSizeM,
//                 ),
//                 WeatherItem(
//                   icon: AppIcons.waterDrop,
//                   label: AppTexts.humidity,
//                   value: weather.humidity,
//                   color: AppColors.weatherRainy,
//                   iconSize: AppDimens.iconSizeM,
//                 ),
//                 WeatherItem(
//                   icon: _getWeatherIcon(weather.condition),
//                   label: AppTexts.condition,
//                   value: weather.condition,
//                   color: _getWeatherColor(weather.condition),
//                   iconSize: AppDimens.iconSizeM,
//                 ),
//               ],
//             ),
//             if (weather.isMock)
//               Padding(
//                 padding: EdgeInsets.only(top: AppDimens.spaceM),
//                 child: Text(
//                   AppTexts.mockData,
//                   style: TextStyle(
//                     fontSize: AppDimens.textSizeXS,
//                     color: AppColors.gray500,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   IconData _getWeatherIcon(String condition) {
//     final cond = condition.toLowerCase();
//     if (cond.contains('sunny') || cond.contains('clear')) {
//       return AppIcons.wbSunny;
//     } else if (cond.contains('cloudy')) {
//       return AppIcons.cloud;
//     }
//     return AppIcons.wbSunny;
//   }

//   Color _getWeatherColor(String condition) {
//     final cond = condition.toLowerCase();
//     if (cond.contains('sunny') || cond.contains('clear')) {
//       return AppColors.weatherSunny;
//     } else if (cond.contains('cloudy')) {
//       return AppColors.weatherCloudy;
//     } else if (cond.contains('rain')) {
//       return AppColors.weatherRainy;
//     }
//     return AppColors.primary;
//   }
// }

// // Weather Display Factory (Fixed)
// class WeatherDisplayFactory {
//   static Widget createDefault({
//     required BuildContext context,
//     required WeatherModel weather,
//     required VoidCallback onRefresh,
//     bool showRefreshButton = true,
//   }) {
//     return WeatherDisplay(
//       weather: weather,
//       onRefresh: onRefresh,
//       showRefreshButton: showRefreshButton,
//     );
//   }

//   static Widget createSimple({
//     required BuildContext context,
//     required WeatherModel weather,
//     required VoidCallback onRefresh,
//     bool showRefreshButton = true,
//   }) {
//     return SimpleWeatherDisplay(
//       weather: weather,
//       onRefresh: onRefresh,
//       showRefreshButton: showRefreshButton,
//     );
//   }

//   static Widget createCompact({
//     required BuildContext context,
//     required WeatherModel weather,
//     required VoidCallback onRefresh,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(AppDimens.paddingM),
//       decoration: BoxDecoration(
//         color: AppColors.getCardBackground(context),
//         borderRadius: BorderRadius.circular(AppDimens.cardRadius),
//         border: Border.all(
//           color: AppColors.getBorder(context).withOpacity(0.2),
//         ),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             AppIcons.cloud,
//             color: AppColors.primary,
//             size: AppDimens.iconSizeM,
//           ),
//           SizedBox(width: AppDimens.spaceM),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   weather.temperature,
//                   style: TextStyle(
//                     fontSize: AppDimens.textSizeL,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.getTextPrimary(context),
//                   ),
//                 ),
//                 Text(
//                   weather.condition,
//                   style: TextStyle(
//                     fontSize: AppDimens.textSizeS,
//                     color: AppColors.getTextSecondary(context),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: Icon(
//               AppIcons.refresh,
//               size: AppDimens.iconSizeS,
//               color: AppColors.primary,
//             ),
//             onPressed: onRefresh,
//             padding: EdgeInsets.zero,
//             constraints: const BoxConstraints(),
//           ),
//         ],
//       ),
//     );
//   }
// }