import 'package:flutter/material.dart';
// import 'package:counter_app/utils/colors.dart';
import 'package:counter_app/util/dimens.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final double elevation;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final Border? border;

  const CustomCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(AppDimens.marginS),
    this.padding = const EdgeInsets.all(AppDimens.paddingL),
    this.color,
    this.elevation = AppDimens.cardElevation,
    this.borderRadius = const BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
    this.onTap,
    this.boxShadow,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = color ?? Theme.of(context).cardColor;
    final defaultShadow = boxShadow ?? [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8.0,
        offset: const Offset(0, 2),
      ),
    ];

    return Container(
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: borderRadius,
              boxShadow: elevation > 0 ? defaultShadow : null,
              border: border,
            ),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}