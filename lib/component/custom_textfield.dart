// import 'package:counter_app/util/icons.dart';
// import 'package:counter_app/util/app_texts.dart';
// import 'package:counter_app/util/text_styles.dart';
// import 'package:counter_app/util/colors.dart';
// import 'package:counter_app/util/dimens.dart';
// import 'package:flutter/material.dart';

// class CustomTextfield extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hintText;
//   final String? errorText;
//   final TextInputType keyboardType;
//   final bool obscureText;
//   final bool enabled;
//   final bool readOnly;
//   final bool autofocus;
//   final int maxLines;
//   final int? maxLength;
//   final int minLines;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final Function(String)? onChanged;
//   final Function(String)? onSubmitted;
//   final Function()? onEditingComplete;
//   final Function()? onTap;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//   final TextStyle? textStyle;
//   final TextStyle? hintStyle;
//   final TextStyle? labelStyle;
//   final TextStyle? errorStyle;
//   final Color? fillColor;
//   final Color? borderColor;
//   final Color? focusedBorderColor;
//   final Color? errorBorderColor;
//   final double borderRadius;
//   final EdgeInsetsGeometry? contentPadding;
//   final bool expands;
//   final bool showClearButton;
//   final bool showCounter;
//   final String? helperText;
//   final TextStyle? helperStyle;
//   final bool showLabel;
//   final bool showBorder;
//   final BoxConstraints? prefixIconConstraints;
//   final BoxConstraints? suffixIconConstraints;
//   final InputDecoration? decoration;
//   final TextCapitalization textCapitalization;
//   final List<String>? autofillHints;
//   final bool autocorrect;
//   final SmartDashesType? smartDashesType;
//   final SmartQuotesType? smartQuotesType;
//   final bool enableSuggestions;
//   final TextAlign textAlign;
//   final TextAlignVertical? textAlignVertical;
//   final TextDirection? textDirection;
//   final bool showCursor;
//   final String obscuringCharacter;
//   final bool enableInteractiveSelection;
//   final ScrollPhysics? scrollPhysics;
//   final ScrollController? scrollController;
//   final bool enableIMEPersonalizedLearning;

//   const CustomTextfield({
//     Key? key,
//     required this.controller,
//     this.label = '',
//     this.hintText = '',
//     this.errorText,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//     this.enabled = true,
//     this.readOnly = false,
//     this.autofocus = false,
//     this.maxLines = 1,
//     this.maxLength,
//     this.minLines = 1,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.onChanged,
//     this.onSubmitted,
//     this.onEditingComplete,
//     this.onTap,
//     this.textInputAction,
//     this.focusNode,
//     this.textStyle,
//     this.hintStyle,
//     this.labelStyle,
//     this.errorStyle,
//     this.fillColor,
//     this.borderColor,
//     this.focusedBorderColor,
//     this.errorBorderColor,
//     this.borderRadius = AppDimens.borderRadiusM,
//     this.contentPadding,
//     this.expands = false,
//     this.showClearButton = false,
//     this.showCounter = false,
//     this.helperText,
//     this.helperStyle,
//     this.showLabel = true,
//     this.showBorder = true,
//     this.prefixIconConstraints,
//     this.suffixIconConstraints,
//     this.decoration,
//     this.textCapitalization = TextCapitalization.none,
//     this.autofillHints,
//     this.autocorrect = true,
//     this.smartDashesType,
//     this.smartQuotesType,
//     this.enableSuggestions = true,
//     this.textAlign = TextAlign.start,
//     this.textAlignVertical,
//     this.textDirection,
//     this.showCursor = true,
//     this.obscuringCharacter = '•',
//     this.enableInteractiveSelection = true,
//     this.scrollPhysics,
//     this.scrollController,
//     this.enableIMEPersonalizedLearning = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final isDarkMode = theme.brightness == Brightness.dark;
    
//     // Default colors
//     final defaultFillColor = fillColor ?? 
//         (isDarkMode ? AppColors.darkSurfaceVariant : AppColors.gray50);
//     final defaultBorderColor = borderColor ?? AppColors.getBorder(context);
//     final defaultFocusedBorderColor = focusedBorderColor ?? AppColors.primary;
//     final defaultErrorBorderColor = errorBorderColor ?? AppColors.error;
//     final defaultTextStyle = textStyle ?? AppTextStyles.inputText(context);
//     final defaultHintStyle = hintStyle ?? AppTextStyles.inputHint(context);
//     final defaultLabelStyle = labelStyle ?? AppTextStyles.inputLabel(context);
//     final defaultErrorStyle = errorStyle ?? AppTextStyles.inputError(context);
//     final defaultHelperStyle = helperStyle ?? AppTextStyles.labelSmall(context);
//     final defaultContentPadding = contentPadding ?? EdgeInsets.all(AppDimens.paddingM);

//     // Clear button
//     final clearButton = showClearButton && controller.text.isNotEmpty
//         ? IconButton(
//             icon: Icon(
//               AppIcons.clearSearch,
//               size: AppDimens.iconSizeM,
//               color: AppColors.getTextSecondary(context),
//             ),
//             onPressed: () {
//               controller.clear();
//               onChanged?.call('');
//             },
//             padding: EdgeInsets.zero,
//             constraints: BoxConstraints(
//               minWidth: AppDimens.iconSizeM,
//               minHeight: AppDimens.iconSizeM,
//             ),
//           )
//         : null;

//     // Character counter
//     final counterWidget = showCounter && maxLength != null
//         ? Text(
//             '${controller.text.length}/$maxLength',
//             style: defaultHelperStyle,
//           )
//         : null;

//     // Build input decoration
//     InputDecoration buildDecoration() {
//       if (decoration != null) return decoration!;

//       return InputDecoration(
//         labelText: showLabel ? label : null,
//         hintText: hintText.isNotEmpty ? hintText : AppTexts.searchHint,
//         hintStyle: defaultHintStyle,
//         labelStyle: defaultLabelStyle,
//         errorText: errorText,
//         errorStyle: defaultErrorStyle,
//         helperText: helperText,
//         helperStyle: defaultHelperStyle,
//         prefixIcon: prefixIcon,
//         suffixIcon: suffixIcon ?? clearButton,
//         prefixIconConstraints: prefixIconConstraints ?? BoxConstraints(
//           minWidth: AppDimens.iconSizeL + AppDimens.paddingM,
//           minHeight: AppDimens.iconSizeL,
//         ),
//         suffixIconConstraints: suffixIconConstraints ?? BoxConstraints(
//           minWidth: AppDimens.iconSizeL + AppDimens.paddingM,
//           minHeight: AppDimens.iconSizeL,
//         ),
//         filled: true,
//         fillColor: defaultFillColor,
//         contentPadding: defaultContentPadding,
//         border: showBorder
//             ? OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 borderSide: BorderSide(
//                   color: defaultBorderColor,
//                   width: 1,
//                 ),
//               )
//             : InputBorder.none,
//         enabledBorder: showBorder
//             ? OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 borderSide: BorderSide(
//                   color: defaultBorderColor,
//                   width: 1,
//                 ),
//               )
//             : InputBorder.none,
//         focusedBorder: showBorder
//             ? OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 borderSide: BorderSide(
//                   color: defaultFocusedBorderColor,
//                   width: 2,
//                 ),
//               )
//             : InputBorder.none,
//         errorBorder: showBorder
//             ? OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 borderSide: BorderSide(
//                   color: defaultErrorBorderColor,
//                   width: 2,
//                 ),
//               )
//             : InputBorder.none,
//         focusedErrorBorder: showBorder
//             ? OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 borderSide: BorderSide(
//                   color: defaultErrorBorderColor,
//                   width: 2,
//                 ),
//               )
//             : InputBorder.none,
//         disabledBorder: showBorder
//             ? OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 borderSide: BorderSide(
//                   color: defaultBorderColor.withOpacity(0.5),
//                   width: 1,
//                 ),
//               )
//             : InputBorder.none,
//         counter: counterWidget,
//         counterText: '',
//       );
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (label.isNotEmpty && showLabel)
//           Padding(
//             padding: EdgeInsets.only(bottom: AppDimens.spaceS),
//             child: Text(
//               label,
//               style: defaultLabelStyle,
//             ),
//           ),
        
//         TextField(
//           controller: controller,
//           focusNode: focusNode,
//           keyboardType: keyboardType,
//           obscureText: obscureText,
//           enabled: enabled,
//           readOnly: readOnly,
//           autofocus: autofocus,
//           maxLines: expands ? null : maxLines,
//           minLines: expands ? null : minLines,
//           maxLength: maxLength,
//           onChanged: onChanged,
//           onSubmitted: onSubmitted,
//           onEditingComplete: onEditingComplete,
//           onTap: onTap,
//           textInputAction: textInputAction,
//           style: defaultTextStyle.copyWith(
//             color: enabled
//                 ? defaultTextStyle.color
//                 : AppColors.getTextSecondary(context),
//           ),
//           decoration: buildDecoration(),
//           textCapitalization: textCapitalization,
//           autofillHints: autofillHints,
//           autocorrect: autocorrect,
//           smartDashesType: smartDashesType,
//           smartQuotesType: smartQuotesType,
//           enableSuggestions: enableSuggestions,
//           textAlign: textAlign,
//           textAlignVertical: textAlignVertical,
//           textDirection: textDirection,
//           showCursor: showCursor,
//           obscuringCharacter: obscuringCharacter,
//           enableInteractiveSelection: enableInteractiveSelection,
//           expands: expands,
//           scrollPhysics: scrollPhysics,
//           scrollController: scrollController,
//           enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
//         ),
//       ],
//     );
//   }
// }

// // ===== SPECIALIZED TEXTFIELD CLASSES =====

// class SearchTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final Function(String) onSearch;
//   final Function()? onClear;
//   final String hintText;
//   final bool autofocus;
//   final bool showClearButton;

//   const SearchTextField({
//     Key? key,
//     required this.controller,
//     required this.onSearch,
//     this.onClear,
//     this.hintText = AppTexts.searchHint,
//     this.autofocus = true,
//     this.showClearButton = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomTextfield(
//       controller: controller,
//       hintText: hintText,
//       autofocus: autofocus,
//       prefixIcon: Icon(
//         AppIcons.search,
//         size: AppDimens.iconSizeM,
//         color: AppColors.getTextSecondary(context),
//       ),
//       suffixIcon: showClearButton && controller.text.isNotEmpty
//           ? IconButton(
//               icon: Icon(
//                 AppIcons.clearSearch,
//                 size: AppDimens.iconSizeM,
//                 color: AppColors.getTextSecondary(context),
//               ),
//               onPressed: () {
//                 controller.clear();
//                 onClear?.call();
//                 onSearch('');
//               },
//             )
//           : null,
//       onChanged: onSearch,
//       onSubmitted: onSearch,
//       showBorder: true,
//       borderRadius: AppDimens.borderRadiusL,
//       fillColor: AppColors.getSurface(context),
//     );
//   }
// }

// class NoteTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final int maxLength;
//   final Function(String)? onChanged;
//   final bool showCounter;

//   const NoteTextField({
//     Key? key,
//     required this.controller,
//     this.hintText = AppTexts.addNoteHint,
//     this.maxLength = 200,
//     this.onChanged,
//     this.showCounter = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomTextfield(
//       controller: controller,
//       hintText: hintText,
//       maxLines: 4,
//       minLines: 3,
//       maxLength: maxLength,
//       onChanged: onChanged,
//       showCounter: showCounter,
//       prefixIcon: Icon(
//         AppIcons.note,
//         size: AppDimens.iconSizeM,
//         color: AppColors.getTextSecondary(context),
//       ),
//       showBorder: true,
//       borderRadius: AppDimens.borderRadiusM,
//     );
//   }
// }

// class NumberTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hintText;
//   final Function(String)? onChanged;
//   final Function(String)? onSubmitted;
//   final int? minValue;
//   final int? maxValue;
//   final bool allowDecimals;
//   final bool allowNegative;

//   const NumberTextField({
//     Key? key,
//     required this.controller,
//     this.label = '',
//     this.hintText = '',
//     this.onChanged,
//     this.onSubmitted,
//     this.minValue,
//     this.maxValue,
//     this.allowDecimals = false,
//     this.allowNegative = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomTextfield(
//       controller: controller,
//       label: label,
//       hintText: hintText,
//       keyboardType: TextInputType.numberWithOptions(
//         decimal: allowDecimals,
//         signed: allowNegative,
//       ),
//       onChanged: (value) {
//         // Validate number
//         final numValue = allowDecimals
//             ? double.tryParse(value)
//             : int.tryParse(value);
        
//         if (value.isNotEmpty && numValue == null) {
//           // Invalid number
//           return;
//         }
        
//         if (minValue != null && numValue != null && numValue < minValue!) {
//           return;
//         }
        
//         if (maxValue != null && numValue != null && numValue > maxValue!) {
//           return;
//         }
        
//         onChanged?.call(value);
//       },
//       onSubmitted: onSubmitted,
//       prefixIcon: Icon(
//         Icons.numbers,
//         size: AppDimens.iconSizeM,
//         color: AppColors.getTextSecondary(context),
//       ),
//       showBorder: true,
//       borderRadius: AppDimens.borderRadiusM,
//     );
//   }
// }

// class PasswordTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hintText;
//   final Function(String)? onChanged;
//   final Function(String)? onSubmitted;
//   final bool showObscureToggle;

//   const PasswordTextField({
//     Key? key,
//     required this.controller,
//     this.label = '',
//     this.hintText = '',
//     this.onChanged,
//     this.onSubmitted,
//     this.showObscureToggle = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(
//       builder: (context, setState) {
//         bool obscureText = true;
        
//         return CustomTextfield(
//           controller: controller,
//           label: label,
//           hintText: hintText,
//           obscureText: obscureText,
//           onChanged: onChanged,
//           onSubmitted: onSubmitted,
//           prefixIcon: Icon(
//             Icons.lock,
//             size: AppDimens.iconSizeM,
//             color: AppColors.getTextSecondary(context),
//           ),
//           suffixIcon: showObscureToggle
//               ? IconButton(
//                   icon: Icon(
//                     obscureText ? Icons.visibility : Icons.visibility_off,
//                     size: AppDimens.iconSizeM,
//                     color: AppColors.getTextSecondary(context),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       obscureText = !obscureText;
//                     });
//                   },
//                 )
//               : null,
//           showBorder: true,
//           borderRadius: AppDimens.borderRadiusM,
//         );
//       },
//     );
//   }
// }

// // TextField Factory
// class TextFieldFactory {
//   static SearchTextField createSearch({
//     required TextEditingController controller,
//     required Function(String) onSearch,
//     Function()? onClear,
//     String hintText = AppTexts.searchHint,
//     bool autofocus = true,
//   }) {
//     return SearchTextField(
//       controller: controller,
//       onSearch: onSearch,
//       onClear: onClear,
//       hintText: hintText,
//       autofocus: autofocus,
//     );
//   }

//   static NoteTextField createNote({
//     required TextEditingController controller,
//     String hintText = AppTexts.addNoteHint,
//     int maxLength = 200,
//     Function(String)? onChanged,
//   }) {
//     return NoteTextField(
//       controller: controller,
//       hintText: hintText,
//       maxLength: maxLength,
//       onChanged: onChanged,
//     );
//   }

//   static NumberTextField createNumber({
//     required TextEditingController controller,
//     String label = '',
//     String hintText = '',
//     Function(String)? onChanged,
//     Function(String)? onSubmitted,
//     int? minValue,
//     int? maxValue,
//     bool allowDecimals = false,
//     bool allowNegative = true,
//   }) {
//     return NumberTextField(
//       controller: controller,
//       label: label,
//       hintText: hintText,
//       onChanged: onChanged,
//       onSubmitted: onSubmitted,
//       minValue: minValue,
//       maxValue: maxValue,
//       allowDecimals: allowDecimals,
//       allowNegative: allowNegative,
//     );
//   }

//   static PasswordTextField createPassword({
//     required TextEditingController controller,
//     String label = '',
//     String hintText = '',
//     Function(String)? onChanged,
//     Function(String)? onSubmitted,
//     bool showObscureToggle = true,
//   }) {
//     return PasswordTextField(
//       controller: controller,
//       label: label,
//       hintText: hintText,
//       onChanged: onChanged,
//       onSubmitted: onSubmitted,
//       showObscureToggle: showObscureToggle,
//     );
//   }
// }