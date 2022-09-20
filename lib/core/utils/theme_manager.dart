
// import 'package:courses_app/app/core/utils/styles_manager.dart';
// import 'package:courses_app/app/core/utils/values_manager.dart';
// import 'package:flutter/material.dart';

// import 'color_manager.dart';
// import 'font_manager.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     // main colors
//     scaffoldBackgroundColor: ColorManager.background,
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightGreen,
//     primaryColorDark: ColorManager.darkGreen,
//     disabledColor: ColorManager.grey,
//     splashColor: ColorManager.lightGreen,
//     // ripple effect color
//     // cardview theme
//     cardTheme: CardTheme(
//         color: ColorManager.primary,
//         shadowColor: ColorManager.grey,
//         elevation: AppSize.s0),
//     // app bar theme
//     appBarTheme: AppBarTheme(
//         centerTitle: true,
//         color: ColorManager.primary,
//         elevation: AppSize.s4,
//         shadowColor: ColorManager.lightGreen,
//         titleTextStyle:
//             getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
//     // button theme
//     buttonTheme: ButtonThemeData(
//         shape: const StadiumBorder(),
//         disabledColor: ColorManager.grey,
//         buttonColor: ColorManager.primary,
//         splashColor: ColorManager.lightGreen),

//     // elevated button them
//     elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//             textStyle: getRegularStyle(
//                 color: ColorManager.white, fontSize: FontSize.s17),
//             primary: ColorManager.primary,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(AppSize.s12)))),
//     textButtonTheme: TextButtonThemeData(
//         style: ButtonStyle(
//       foregroundColor: MaterialStateProperty.all<Color>(ColorManager.lightGrey),
//     )),

//     textTheme: TextTheme(
//       displayLarge:
//           getBoldStyle(color: ColorManager.white, fontSize: FontSize.s30),
//       displayMedium:
//           getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
//       displaySmall: getRegularStyle(
//           color: ColorManager.lightGrey, fontSize: FontSize.s14),
//       headlineLarge: getSemiBoldStyle(
//           color: ColorManager.darkGrey, fontSize: FontSize.s16),
//       headlineMedium:
//           getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
//       headlineSmall:
//           getLightStyle(color: ColorManager.darkGrey, fontSize: FontSize.s22),
//       titleMedium:
//           getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
//       bodyLarge: getRegularStyle(color: ColorManager.grey),
//       bodyMedium: getRegularStyle(color: ColorManager.grey),
//       bodySmall: getRegularStyle(color: ColorManager.grey),
//     ),

//     // input decoration theme (text form field)
//     inputDecorationTheme: InputDecorationTheme(

//         // content padding
//         contentPadding: const EdgeInsets.all(AppPadding.p8),
//         // hint style
//         hintStyle: getRegularStyle(
//             color: ColorManager.lightGrey, fontSize: FontSize.s14),
//         labelStyle:
//             getRegularStyle(color: ColorManager.red, fontSize: FontSize.s14),
//         errorStyle: getRegularStyle(color: ColorManager.error),

//         // enabled border style
//         enabledBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.darkGrey, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

//         // focused border style
//         focusedBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

//         // error border style
//         errorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//         // focused border style
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: ColorManager.darkGrey,
//       unselectedItemColor: ColorManager.lightGrey,
//       showUnselectedLabels: false,
//       selectedItemColor: ColorManager.white,
//       selectedIconTheme: const IconThemeData(size: AppSize.s30),
//     ),
//     // label style
//   );
// }
