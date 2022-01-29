import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.springWood,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.bodyText1),
            foregroundColor: MaterialStateProperty.all(AppColors.stormDust)),
      ),
      primaryColor: AppColors.stromboli,
      accentColor: AppColors.springWood,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.purple,
        foregroundColor: AppColors.white,
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.stromboli,
          selectionColor: AppColors.brown.withOpacity(0.3),
          selectionHandleColor: AppColors.stormDust),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
            primary: AppColors.sushi,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none, fillColor: AppColors.feijoa),
      textTheme: GoogleFonts.quicksandTextTheme()
          .apply(
            displayColor: AppColors.stromboli,
            bodyColor: Colors.black,
          )
          .copyWith(
              bodyText1: GoogleFonts.quicksand(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.stromboli,
              ),
              bodyText2: GoogleFonts.quicksand(
                  fontSize: 24, fontWeight: FontWeight.w400)));
}
