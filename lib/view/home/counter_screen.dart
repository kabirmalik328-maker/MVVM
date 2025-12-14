// import 'package:counter_app/component/counter_display.dart';
// import 'package:counter_app/component/counter_buttons.dart';
// import 'package:counter_app/component/error_banner.dart';
// import 'package:counter_app/component/loading_overlay.dart';
// import 'package:counter_app/component/note_section.dart';
// import 'package:counter_app/component/weather_card.dart';
// import 'package:counter_app/util/app_texts.dart';
// import 'package:counter_app/util/text_styles.dart';
// import 'package:counter_app/util/colors.dart';
// import 'package:counter_app/util/dimens.dart';
// import 'package:counter_app/util/button_styles.dart';
// import 'package:counter_app/viewmodel/counter_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({Key? key}) : super(key: key);

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = context.watch<CounterViewModel>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppTexts.appName,
//           style: AppTextStyles.appBarTitle.copyWith(
//             color: AppColors.getTextPrimary(context),
//           ),
//         ),
//         centerTitle: true,
//         elevation: AppDimens.appBarElevation,
//         backgroundColor: AppColors.getSurface(context),
//         foregroundColor: AppColors.getTextPrimary(context),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             tooltip: AppTexts.search,
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text(AppTexts.search),
//                   content: TextField(
//                     controller: _searchController,
//                     autofocus: true,
//                     decoration: InputDecoration(
//                       hintText: AppTexts.searchHint,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(AppDimens.borderRadiusM),
//                       ),
//                       prefixIcon: const Icon(Icons.search),
//                     ),
//                     onChanged: (value) {
//                       viewModel.updateSearchQuery(value);
//                     },
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         viewModel.clearSearch();
//                         _searchController.clear();
//                         Navigator.pop(context);
//                       },
//                       child: Text(AppTexts.clearSearch),
//                     ),
//                     ElevatedButton(
//                       style: ButtonStyles.primaryButton,
//                       onPressed: () => Navigator.pop(context),
//                       child: Text(AppTexts.close),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
          
//           IconButton(
//             icon: Icon(
//               viewModel.isDarkMode ? Icons.light_mode : Icons.dark_mode,
//             ),
//             tooltip: viewModel.isDarkMode 
//                 ? AppTexts.switchToLightMode 
//                 : AppTexts.switchToDarkMode,
//             onPressed: viewModel.toggleTheme,
//           ),
          
//           PopupMenuButton<String>(
//             icon: const Icon(Icons.more_vert),
//             onSelected: (value) {
//               if (value == 'info') {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text(AppTexts.appInfoTitle),
//                     content: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             AppTexts.architectureDescription,
//                             style: AppTextStyles.dialogContent(context),
//                           ),
                          
//                           SizedBox(height: AppDimens.spaceL),
                          
//                           Text(
//                             AppTexts.features,
//                             style: AppTextStyles.sectionHeaderSmall(context),
//                           ),
                          
//                           SizedBox(height: AppDimens.spaceM),
                          
//                           ...AppTexts.featureList.map((feature) => Padding(
//                             padding: EdgeInsets.only(bottom: AppDimens.spaceS),
//                             child: Text(feature, style: AppTextStyles.featureItem),
//                           )),
                          
//                           SizedBox(height: AppDimens.spaceL),
                          
//                           Text(
//                             '${AppTexts.version}: ${AppTexts.appVersion}',
//                             style: AppTextStyles.infoItemLabel.copyWith(
//                               color: AppColors.getTextSecondary(context),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text(AppTexts.gotIt),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//             },
//             itemBuilder: (context) => [
//               PopupMenuItem(
//                 value: 'info',
//                 child: Row(
//                   children: [
//                     const Icon(Icons.info_outline, size: 20),
//                     const SizedBox(width: 12),
//                     Text(AppTexts.appInfo),
//                   ],
//                 ),
//               ),
//               PopupMenuItem(
//                 value: 'settings',
//                 child: Row(
//                   children: [
//                     const Icon(Icons.settings, size: 20),
//                     const SizedBox(width: 12),
//                     Text(AppTexts.settingsTitle),
//                   ],
//                 ),
//               ),
//               PopupMenuItem(
//                 value: 'help',
//                 child: Row(
//                   children: [
//                     const Icon(Icons.help_outline, size: 20),
//                     const SizedBox(width: 12),
//                     Text(AppTexts.helpTitle),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: viewModel.isLoading
//           ? LoadingOverlay(
//               message: AppTexts.loading,
//               backgroundColor: AppColors.black.withOpacity(0.7),
//             )
//           : viewModel.searchQuery != null && !viewModel.matchesSearch
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.search_off,
//                         size: AppDimens.iconSizeXXXL,
//                         color: AppColors.gray400,
//                       ),
//                       const SizedBox(height: AppDimens.spaceL),
//                       Text(
//                         '${AppTexts.noResultsFound} "${viewModel.searchQuery}"',
//                         style: AppTextStyles.emptyStateTitle(context),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: AppDimens.spaceS),
//                       Text(
//                         AppTexts.emptySearch,
//                         style: AppTextStyles.emptyStateDescription(context),
//                       ),
//                       const SizedBox(height: AppDimens.spaceL),
//                       ElevatedButton(
//                         style: ButtonStyles.primaryButton,
//                         onPressed: viewModel.clearSearch,
//                         child: Text(AppTexts.clearSearch),
//                       ),
//                     ],
//                   ),
//                 )
//               : Stack(
//                   children: [
//                     SingleChildScrollView(
//                       controller: _scrollController,
//                       physics: const BouncingScrollPhysics(),
//                       padding: EdgeInsets.all(AppDimens.paddingL),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           if (viewModel.errorMessage != null)
//                             Padding(
//                               padding: EdgeInsets.only(bottom: AppDimens.marginM),
//                               child: ErrorBanner(
//                                 message: viewModel.errorMessage!,
//                                 onDismiss: viewModel.clearError,
//                                 backgroundColor: AppColors.errorContainer,
//                                 textColor: AppColors.error,
//                               ),
//                             ),

//                           Container(
//                             padding: EdgeInsets.all(AppDimens.paddingXL),
//                             decoration: BoxDecoration(
//                               color: AppColors.getCardBackground(context),
//                               borderRadius: BorderRadius.circular(AppDimens.cardRadiusLarge),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: AppColors.shadow,
//                                   blurRadius: AppDimens.shadowBlurM,
//                                   offset: const Offset(0, 4),
//                                 ),
//                               ],
//                               border: Border.all(
//                                 color: AppColors.getBorder(context).withOpacity(0.1),
//                               ),
//                             ),
//                             child: Column(
//                               children: [
//                                 Text(
//                                   AppTexts.currentCount.toUpperCase(),
//                                   style: AppTextStyles.sectionHeaderMedium(context).copyWith(
//                                     letterSpacing: 2,
//                                     color: AppColors.getTextSecondary(context),
//                                   ),
//                                 ),
                                
//                                 SizedBox(height: AppDimens.spaceXL),
                                
//                                 CounterDisplay(counter: viewModel.counter),
                                
//                                 SizedBox(height: AppDimens.spaceXL),
                                
//                                 const CounterButtons(),
                                
//                                 SizedBox(height: AppDimens.spaceL),
                                
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: AppDimens.paddingM,
//                                     vertical: AppDimens.paddingS,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: viewModel.counter.count >= 0 
//                                         ? AppColors.success.withOpacity(0.1)
//                                         : AppColors.error.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                     border: Border.all(color: viewModel.counter.count >= 0 
//                                         ? AppColors.success.withOpacity(0.3)
//                                         : AppColors.error.withOpacity(0.3)),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Icon(
//                                         viewModel.counter.count >= 0 
//                                             ? Icons.trending_up 
//                                             : Icons.trending_down,
//                                         size: AppDimens.iconSizeM,
//                                         color: viewModel.counter.count >= 0 
//                                             ? AppColors.success 
//                                             : AppColors.error,
//                                       ),
//                                       SizedBox(width: AppDimens.spaceS),
//                                       Text(
//                                         viewModel.counter.count >= 0 
//                                             ? AppTexts.positive 
//                                             : AppTexts.negative,
//                                         style: TextStyle(
//                                           fontSize: AppDimens.textSizeM,
//                                           fontWeight: FontWeight.w600,
//                                           color: viewModel.counter.count >= 0 
//                                               ? AppColors.success 
//                                               : AppColors.error,
//                                         ),
//                                       ),
//                                       SizedBox(width: AppDimens.spaceM),
//                                       Container(
//                                         width: 1,
//                                         height: 20,
//                                         color: (viewModel.counter.count >= 0 
//                                             ? AppColors.success 
//                                             : AppColors.error).withOpacity(0.3),
//                                       ),
//                                       SizedBox(width: AppDimens.spaceM),
//                                       Text(
//                                         '${viewModel.counter.count.abs().toString().length} ${AppTexts.digits}',
//                                         style: TextStyle(
//                                           fontSize: AppDimens.textSizeS,
//                                           color: AppColors.getTextSecondary(context),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           SizedBox(height: AppDimens.spaceXXL),

//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 AppTexts.quickActions,
//                                 style: AppTextStyles.sectionHeaderMedium(context),
//                               ),
                              
//                               SizedBox(height: AppDimens.spaceM),
                              
//                               Wrap(
//                                 spacing: AppDimens.spaceM,
//                                 runSpacing: AppDimens.spaceM,
//                                 children: [
//                                   Material(
//                                     borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                     color: AppColors.incrementButton.withOpacity(0.1),
//                                     child: InkWell(
//                                       onTap: () {
//                                         for (int i = 0; i < 5; i++) viewModel.increment();
//                                       },
//                                       borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                       child: Container(
//                                         padding: EdgeInsets.all(AppDimens.paddingM),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: AppColors.incrementButton.withOpacity(0.3)),
//                                           borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Icon(Icons.add_circle_outline, size: AppDimens.iconSizeM, color: AppColors.incrementButton),
//                                             SizedBox(width: AppDimens.spaceS),
//                                             Text(
//                                               AppTexts.plusFive,
//                                               style: TextStyle(
//                                                 fontSize: AppDimens.textSizeS,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: AppColors.incrementButton,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                     color: AppColors.decrementButton.withOpacity(0.1),
//                                     child: InkWell(
//                                       onTap: () {
//                                         for (int i = 0; i < 5; i++) viewModel.decrement();
//                                       },
//                                       borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                       child: Container(
//                                         padding: EdgeInsets.all(AppDimens.paddingM),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: AppColors.decrementButton.withOpacity(0.3)),
//                                           borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Icon(Icons.remove_circle_outline, size: AppDimens.iconSizeM, color: AppColors.decrementButton),
//                                             SizedBox(width: AppDimens.spaceS),
//                                             Text(
//                                               AppTexts.minusFive,
//                                               style: TextStyle(
//                                                 fontSize: AppDimens.textSizeS,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: AppColors.decrementButton,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                     color: AppColors.incrementButtonLight.withOpacity(0.1),
//                                     child: InkWell(
//                                       onTap: () {
//                                         for (int i = 0; i < 10; i++) viewModel.increment();
//                                       },
//                                       borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                       child: Container(
//                                         padding: EdgeInsets.all(AppDimens.paddingM),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: AppColors.incrementButtonLight.withOpacity(0.3)),
//                                           borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Icon(Icons.add, size: AppDimens.iconSizeM, color: AppColors.incrementButtonLight),
//                                             SizedBox(width: AppDimens.spaceS),
//                                             Text(
//                                               AppTexts.plusTen,
//                                               style: TextStyle(
//                                                 fontSize: AppDimens.textSizeS,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: AppColors.incrementButtonLight,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                     color: AppColors.decrementButtonLight.withOpacity(0.1),
//                                     child: InkWell(
//                                       onTap: () {
//                                         for (int i = 0; i < 10; i++) viewModel.decrement();
//                                       },
//                                       borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                       child: Container(
//                                         padding: EdgeInsets.all(AppDimens.paddingM),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: AppColors.decrementButtonLight.withOpacity(0.3)),
//                                           borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Icon(Icons.remove, size: AppDimens.iconSizeM, color: AppColors.decrementButtonLight),
//                                             SizedBox(width: AppDimens.spaceS),
//                                             Text(
//                                               AppTexts.minusTen,
//                                               style: TextStyle(
//                                                 fontSize: AppDimens.textSizeS,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: AppColors.decrementButtonLight,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                     color: AppColors.apiButton.withOpacity(0.1),
//                                     child: InkWell(
//                                       onTap: viewModel.fetchRandomCount,
//                                       borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                       child: Container(
//                                         padding: EdgeInsets.all(AppDimens.paddingM),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: AppColors.apiButton.withOpacity(0.3)),
//                                           borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Icon(Icons.api, size: AppDimens.iconSizeM, color: AppColors.apiButton),
//                                             SizedBox(width: AppDimens.spaceS),
//                                             Text(
//                                               AppTexts.fetchRandom,
//                                               style: TextStyle(
//                                                 fontSize: AppDimens.textSizeS,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: AppColors.apiButton,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Material(
//                                     borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                     color: AppColors.weatherCloudy.withOpacity(0.1),
//                                     child: InkWell(
//                                       onTap: viewModel.refreshWeather,
//                                       borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                       child: Container(
//                                         padding: EdgeInsets.all(AppDimens.paddingM),
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: AppColors.weatherCloudy.withOpacity(0.3)),
//                                           borderRadius: BorderRadius.circular(AppDimens.borderRadiusL),
//                                         ),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Icon(Icons.cloud, size: AppDimens.iconSizeM, color: AppColors.weatherCloudy),
//                                             SizedBox(width: AppDimens.spaceS),
//                                             Text(
//                                               AppTexts.refreshWeather,
//                                               style: TextStyle(
//                                                 fontSize: AppDimens.textSizeS,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: AppColors.weatherCloudy,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),

//                           SizedBox(height: AppDimens.spaceXXL),

//                           const WeatherCard(),

//                           SizedBox(height: AppDimens.spaceXXL),

//                           Container(
//                             padding: EdgeInsets.all(AppDimens.paddingL),
//                             decoration: BoxDecoration(
//                               color: AppColors.getCardBackground(context),
//                               borderRadius: BorderRadius.circular(AppDimens.cardRadiusLarge),
//                               border: Border.all(color: AppColors.getBorder(context).withOpacity(0.1)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   AppTexts.stats,
//                                   style: AppTextStyles.sectionHeaderMedium(context),
//                                 ),
                                
//                                 SizedBox(height: AppDimens.spaceL),
                                
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.all(AppDimens.paddingM),
//                                           decoration: BoxDecoration(
//                                             color: AppColors.primary.withOpacity(0.1),
//                                             shape: BoxShape.circle,
//                                             border: Border.all(color: AppColors.primary.withOpacity(0.3)),
//                                           ),
//                                           child: Icon(Icons.numbers, size: AppDimens.iconSizeL, color: AppColors.primary),
//                                         ),
//                                         SizedBox(height: AppDimens.spaceS),
//                                         Text(
//                                           viewModel.counter.count.toString(),
//                                           style: AppTextStyles.statValueMedium.copyWith(color: AppColors.primary),
//                                         ),
//                                         Text(
//                                           AppTexts.currentValue,
//                                           style: AppTextStyles.statLabel(context),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.all(AppDimens.paddingM),
//                                           decoration: BoxDecoration(
//                                             color: AppColors.secondary.withOpacity(0.1),
//                                             shape: BoxShape.circle,
//                                             border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
//                                           ),
//                                           child: Icon(Icons.calendar_today, size: AppDimens.iconSizeL, color: AppColors.secondary),
//                                         ),
//                                         SizedBox(height: AppDimens.spaceS),
//                                         Text(
//                                           viewModel.counter.lastUpdated.day.toString(),
//                                           style: AppTextStyles.statValueMedium.copyWith(color: AppColors.secondary),
//                                         ),
//                                         Text(
//                                           AppTexts.lastUpdated,
//                                           style: AppTextStyles.statLabel(context),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.all(AppDimens.paddingM),
//                                           decoration: BoxDecoration(
//                                             color: AppColors.accent.withOpacity(0.1),
//                                             shape: BoxShape.circle,
//                                             border: Border.all(color: AppColors.accent.withOpacity(0.3)),
//                                           ),
//                                           child: Icon(Icons.description, size: AppDimens.iconSizeL, color: AppColors.accent),
//                                         ),
//                                         SizedBox(height: AppDimens.spaceS),
//                                         Text(
//                                           viewModel.counter.note?.length.toString() ?? '0',
//                                           style: AppTextStyles.statValueMedium.copyWith(color: AppColors.accent),
//                                         ),
//                                         Text(
//                                           AppTexts.noteLength,
//                                           style: AppTextStyles.statLabel(context),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),

//                           SizedBox(height: AppDimens.spaceXXL),

//                           NoteSection(
//                             note: viewModel.counter.note,
//                             onSave: viewModel.updateNote,
//                           ),

//                           SizedBox(height: AppDimens.spaceXXL),

//                           Container(
//                             padding: EdgeInsets.all(AppDimens.paddingL),
//                             decoration: BoxDecoration(
//                               color: AppColors.primary.withOpacity(0.05),
//                               borderRadius: BorderRadius.circular(AppDimens.cardRadiusLarge),
//                               border: Border.all(color: AppColors.primary.withOpacity(0.2)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.architecture,
//                                       color: AppColors.primary,
//                                       size: AppDimens.iconSizeL,
//                                     ),
//                                     SizedBox(width: AppDimens.spaceM),
//                                     Text(
//                                       AppTexts.architectureTitle,
//                                       style: AppTextStyles.architectureTitle,
//                                     ),
//                                   ],
//                                 ),
                                
//                                 SizedBox(height: AppDimens.spaceM),
                                
//                                 Text(
//                                   AppTexts.architectureDescription,
//                                   style: AppTextStyles.architectureDescription(context),
//                                 ),
                                
//                                 SizedBox(height: AppDimens.spaceL),
                                
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Icon(Icons.data_object, size: AppDimens.iconSizeM, color: AppColors.primary),
//                                         SizedBox(height: AppDimens.spaceXS),
//                                         Text(
//                                           AppTexts.modelTitle,
//                                           style: AppTextStyles.architectureTitle.copyWith(fontSize: AppDimens.textSizeM),
//                                         ),
//                                         Text(
//                                           AppTexts.modelSubtitle,
//                                           style: AppTextStyles.architectureSubtitle(context).copyWith(
//                                             fontSize: AppDimens.textSizeS,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(Icons.smart_toy, size: AppDimens.iconSizeM, color: AppColors.primary),
//                                         SizedBox(height: AppDimens.spaceXS),
//                                         Text(
//                                           AppTexts.viewModelTitle,
//                                           style: AppTextStyles.architectureTitle.copyWith(fontSize: AppDimens.textSizeM),
//                                         ),
//                                         Text(
//                                           AppTexts.viewModelSubtitle,
//                                           style: AppTextStyles.architectureSubtitle(context).copyWith(
//                                             fontSize: AppDimens.textSizeS,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(Icons.design_services, size: AppDimens.iconSizeM, color: AppColors.primary),
//                                         SizedBox(height: AppDimens.spaceXS),
//                                         Text(
//                                           AppTexts.viewTitle,
//                                           style: AppTextStyles.architectureTitle.copyWith(fontSize: AppDimens.textSizeM),
//                                         ),
//                                         Text(
//                                           AppTexts.viewSubtitle,
//                                           style: AppTextStyles.architectureSubtitle(context).copyWith(
//                                             fontSize: AppDimens.textSizeS,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),

//                           SizedBox(height: AppDimens.fabSizeExtended + 20),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton.extended(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text(AppTexts.resetConfirmationTitle),
//                   content: Text(AppTexts.resetConfirmationContent),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text(AppTexts.cancel),
//                     ),
//                     ElevatedButton(
//                       style: ButtonStyles.dangerButton,
//                       onPressed: () {
//                         viewModel.reset();
//                         Navigator.pop(context);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(AppTexts.counterReset, style: AppTextStyles.snackBarContent),
//                             backgroundColor: AppColors.success,
//                             duration: const Duration(seconds: 2),
//                             behavior: SnackBarBehavior.floating,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(AppDimens.borderRadiusM),
//                             ),
//                           ),
//                         );
//                       },
//                       child: Text(AppTexts.resetButton),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             icon: const Icon(Icons.refresh),
//             label: Text(AppTexts.resetButton),
//             backgroundColor: AppColors.resetButton,
//             foregroundColor: AppColors.white,
//             elevation: AppDimens.cardElevationLarge,
//             heroTag: 'reset_fab',
//           ),
          
//           SizedBox(height: AppDimens.spaceM),
          
//           FloatingActionButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text(AppTexts.quickActions),
//                   content: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         ListTile(
//                           leading: Icon(Icons.add, color: AppColors.incrementButton),
//                           title: Text(AppTexts.incrementButton),
//                           onTap: () {
//                             viewModel.increment();
//                             Navigator.pop(context);
//                           },
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.remove, color: AppColors.decrementButton),
//                           title: Text(AppTexts.decrementButton),
//                           onTap: () {
//                             viewModel.decrement();
//                             Navigator.pop(context);
//                           },
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.api, color: AppColors.apiButton),
//                           title: Text(AppTexts.fetchRandom),
//                           onTap: () {
//                             viewModel.fetchRandomCount();
//                             Navigator.pop(context);
//                           },
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.cloud, color: AppColors.weatherCloudy),
//                           title: Text(AppTexts.refreshWeather),
//                           onTap: () {
//                             viewModel.refreshWeather();
//                             Navigator.pop(context);
//                           },
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.theater_comedy, color: AppColors.secondary),
//                           title: Text(AppTexts.toggleTheme),
//                           onTap: () {
//                             viewModel.toggleTheme();
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text(AppTexts.close),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             backgroundColor: AppColors.primary,
//             foregroundColor: AppColors.white,
//             elevation: AppDimens.cardElevationLarge,
//             heroTag: 'quick_actions_fab',
//             child: const Icon(Icons.bolt),
//           ),
//         ],
//       ),
//       backgroundColor: AppColors.getBackground(context),
//     );
//   }
// }