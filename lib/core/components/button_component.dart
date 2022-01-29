import 'package:youcondo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String? label;
  final bool isWhite;
  final Widget? child;
  final EdgeInsets padding;
  final double? elevation;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? fontColor;
  final VoidCallback? onPressed;
  const ElevatedButtonComponent(
      {Key? key,
      this.elevation,
      this.child,
      this.isWhite = false,
      this.backgroundColor,
      this.borderColor,
      this.fontColor,
      this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 8),
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          side: MaterialStateProperty.all(BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 0.3,
          )),
          backgroundColor: MaterialStateProperty.all(
              backgroundColor != null ? backgroundColor : AppColors.caramel)),
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: child != null
            ? child
            : Text(
                label!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: fontColor ?? AppColors.brown,
                    ),
              ),
      ),
    );
  }
}
