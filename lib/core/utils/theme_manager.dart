import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/font_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/styles_manager.dart';
import 'color_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    dialogBackgroundColor: ColorManager.primary,
    // main colors
    scaffoldBackgroundColor: ColorManager.backGround,
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightGreen,
    // primaryColorDark: ColorManager.darkGreen,
    // disabledColor: ColorManager.grey,
    // splashColor: ColorManager.lightGreen,
    // // ripple effect color
    // cardview theme
    // cardTheme: CardTheme(
    //     color: ColorManager.primary,
    //     shadowColor: ColorManager.grey,
    //     elevation: AppSize.s0),
    // // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.backGround,
      elevation: AppSize.s0,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
    ),
    // // button theme
    // buttonTheme: ButtonThemeData(
    //     shape: const StadiumBorder(),
    //     disabledColor: ColorManager.grey,
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.lightGreen),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(

          // textStyle: getRegularStyle(
          //     color: ColorManager.white, fontSize: FontSize.s17),
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          )),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        ColorManager.grey,
      ),
    )),

    textTheme: TextTheme(
      displayLarge:
          getBoldStyle(color: ColorManager.white, fontSize: FontSize.s26),
      displayMedium:
          getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
      displaySmall:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      headlineLarge:
          getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
      headlineMedium:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s14),
      headlineSmall:
          getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
      titleMedium:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      bodyLarge: getRegularStyle(color: ColorManager.white),
      bodyMedium: getRegularStyle(color: ColorManager.white),
      bodySmall: getRegularStyle(color: ColorManager.white),
    ),

    // // input decoration theme (text form field)
    // inputDecorationTheme: InputDecorationTheme(

    //     // content padding
    //     contentPadding: const EdgeInsets.all(AppPadding.p8),
    //     // hint style
    //     hintStyle: getRegularStyle(
    //         color: ColorManager.lightGrey, fontSize: FontSize.s14),
    //     labelStyle:
    //         getRegularStyle(color: ColorManager.red, fontSize: FontSize.s14),
    //     errorStyle: getRegularStyle(color: ColorManager.error),

    //     // enabled border style
    //     enabledBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.darkGrey, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //     // focused border style
    //     focusedBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //     // error border style
    //     errorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //     // focused border style
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.secondry,
      unselectedItemColor: ColorManager.grey,
      showUnselectedLabels: true,
      selectedItemColor: ColorManager.primary,
      selectedIconTheme: IconThemeData(size: AppSize.s30),
    ),

    // // label style
  );
}
