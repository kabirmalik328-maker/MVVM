// // lib/utils/animations.dart
// import 'package:flutter/material.dart';
// import 'package:counter_app/util/dimens.dart';

// class AppAnimations {
//   // Animation Durations
//   static final Duration fast = Duration(milliseconds: AppDimens.animationDurationFast);
//   static  Duration medium = Duration(milliseconds: AppDimens.animationDurationMedium);
//   static  Duration slow = Duration(milliseconds: AppDimens.animationDurationSlow);
  
//   // Animation Curves
//   static const Curve easeInOut = Curves.easeInOut;
//   static const Curve bounce = Curves.bounceOut;
//   static const Curve elastic = Curves.elasticOut;
  
//   // Counter Animation
//   static const Duration counterAnimationDuration = Duration(milliseconds: 300);
//   static const Curve counterAnimationCurve = Curves.easeOutBack;
  
//   // Button Animation
//   static const Duration buttonAnimationDuration = Duration(milliseconds: 200);
//   static const Curve buttonAnimationCurve = Curves.easeInOut;
  
//   // Fade Animation
//   static const Duration fadeAnimationDuration = Duration(milliseconds: 300);
//   static const Curve fadeAnimationCurve = Curves.easeInOut;
  
//   // Slide Animation
//   static const Duration slideAnimationDuration = Duration(milliseconds: 400);
//   static const Curve slideAnimationCurve = Curves.easeOutCubic;
  
//   // Scale Animation
//   static const Duration scaleAnimationDuration = Duration(milliseconds: 250);
//   static const Curve scaleAnimationCurve = Curves.easeOutBack;
  
//   // Rotation Animation
//   static const Duration rotationAnimationDuration = Duration(milliseconds: 500);
//   static const Curve rotationAnimationCurve = Curves.easeInOut;
  
//   // Page Transitions
//   static const Duration pageTransitionDuration = Duration(milliseconds: 300);
//   static const Curve pageTransitionCurve = Curves.easeInOut;
  
//   // Snackbar Animation
//   static const Duration snackbarAnimationDuration = Duration(milliseconds: 300);
//   static const Curve snackbarAnimationCurve = Curves.easeInOut;
  
//   // Loading Animation
//   static const Duration loadingAnimationDuration = Duration(milliseconds: 800);
//   static const Curve loadingAnimationCurve = Curves.linear;
  
//   // Theme Animation
//   static const Duration themeAnimationDuration = Duration(milliseconds: 300);
//   static const Curve themeAnimationCurve = Curves.easeInOut;
  
//   // Helper Methods
//   static Animation<double> counterAnimation(AnimationController controller) {
//     return Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: counterAnimationCurve,
//       ),
//     );
//   }
  
//   static Animation<Color?> colorAnimation(
//     AnimationController controller,
//     Color beginColor,
//     Color endColor,
//   ) {
//     return ColorTween(begin: beginColor, end: endColor).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: fadeAnimationCurve,
//       ),
//     );
//   }
// }