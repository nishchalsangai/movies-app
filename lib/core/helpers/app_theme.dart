import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/helpers/extensions.dart';

class AppTheme {
  AppTheme._();

  static const primaryColor = Color(0xff22e2739);
  static const nearyBlue = Color(0xFF61C3F2);
  static const primaryColor4 = Color(0xff757575);

  static const baseColor = Color(0xfF20202C);
  static const baseColor2 = Color(0xfF2F2F3C);

  static const vibrantGreen = Color(0xff15D2BC);
  static const vibrantPink = Color(0xffE26CA5);
  static const vibrantPurple = Color(0xff564CA3);
  static const vibrantMustard = Color(0xffCD9D0F);

  static const greenColor = Color(0xff78B000);

  static const chipBackground = Color(0xffF6F6FA);
  static const greyColor = Color(0xff827D88);
  static const greyColorLight = Color(0xffDBDBDF);
  static const bodyTextColor =Color(0xff8F8F8F);


  static const randomColor = [vibrantGreen,vibrantPink,vibrantPurple,vibrantMustard];

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    // fontFamily: 'Metropolis',

    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: baseColor,
      displayColor: baseColor,
    ),
    scaffoldBackgroundColor: chipBackground,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white, surfaceTintColor: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
    ),
    datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white, surfaceTintColor: Colors.white),
    dialogTheme: const DialogTheme(
        backgroundColor: Colors.white, surfaceTintColor: Colors.white),
    dialogBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: baseColor, //<-- SEE HERE
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //     side: MaterialStateProperty.all(
    //       BorderSide(color: Colors.black.withOpacity(0.5), width: 0.5),
    //     ),
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //     ),
    //   ),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //     ),
    //     textStyle: MaterialStateProperty.all(
    //       const TextStyle(
    //         fontSize: 16,
    //         color: Colors.white,
    //         fontWeight: FontWeight.w500,
    //       ),
    //     ),
    //   ),
    // ),
    primarySwatch: 0xff00000.toMaterialColor(),
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    // fontFamily: 'Metropolis',
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: Colors.white, displayColor: Colors.white),
    scaffoldBackgroundColor: baseColor,
    hintColor: primaryColor,
    primaryColorDark: baseColor,

    appBarTheme: const AppBarTheme(
        // centerTitle: false,
        backgroundColor: Colors.black),
    //  appBarTheme: const AppBarTheme(backgroundColor: Colors.white, scrolledUnderElevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: baseColor2,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xffcccccc),
        height: 24 / 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
  );

  static var styleFrom = OutlinedButton.styleFrom(
      side: const BorderSide(
        color: AppTheme.nearyBlue,
      ),
      padding: const EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  static var styleFrom2 = ElevatedButton.styleFrom(
      backgroundColor: AppTheme.nearyBlue,
      padding: const EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

  static var btnTxtStyle = const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);

  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const title2 = TextStyle(
    fontSize: 18,
    // fontFamily: 'Metropolis',
  );

  static const label = TextStyle(
    // fontFamily: "Metropolis",
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xffcccccc),
    height: 24 / 16,
  );

  static const InputBorder border = UnderlineInputBorder(
    borderSide: BorderSide(width: 1, color: Color(0xffCCCCCC)),
  );

  static const InputBorder border2 = UnderlineInputBorder(
    borderSide: BorderSide.none,
  );

  static final interHeadlineLargeBold = GoogleFonts.inter(
      fontWeight: FontWeight.w700, color: Colors.black, fontSize: 28);
  static final interHeadlineMediumBold = GoogleFonts.inter(
      fontWeight: FontWeight.w700, color: Colors.black, fontSize: 24);

  // static final oleoHeadingFont = GoogleFonts.oleoScript(textStyle: TextStyle());

  static final inputDecorationBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.circular(20));

  static const defaultIconSize = 18;
}
