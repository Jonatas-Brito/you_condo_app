import 'package:YouCondo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String? label;
  final bool isGrey;
  final Widget? child;
  final EdgeInsets padding;
  final double? elevation;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  const ElevatedButtonComponent(
      {Key? key,
      this.elevation,
      this.child,
      this.isGrey = false,
      this.backgroundColor,
      this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 10),
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brown,
                    ),
              ),
      ),
    );
  }
}
