import 'package:YouCondo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final bool register;
  final int? maxLenght;
  final bool? isPassword;
  final double radius;
  final TextInputType textInputType;
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  const AppTextField({
    Key? key,
    this.hintText,
    this.radius = 18,
    this.hintStyle,
    this.maxLenght,
    this.register = false,
    this.onChanged,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.onSaved,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      maxLength: widget.maxLenght,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      style: TextStyle(color: AppColors.brown),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle == null
            ? Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12,
                  color: AppColors.brown,
                )
            : widget.hintStyle,
        suffixIcon: widget.suffixIcon,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide.none),
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: widget.isPassword!,
      keyboardType: widget.textInputType,
    );
  }
}
