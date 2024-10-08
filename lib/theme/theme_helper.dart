import 'package:flutter/material.dart';
import '../core/app_export.dart';

class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.whiteA700,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.white; // Color when unchecked or unfocused
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black90001.withOpacity(0.53),
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w300,
        ),
        displayMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 47.fSize,
          fontFamily: 'Kaushan Script',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray80001,
          fontSize: 30.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 28.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray600,
          fontSize: 13.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.black90001.withOpacity(0.53),
          fontSize: 11.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black90001,
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.yellow80001,
          fontSize: 19.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF7A62A3),
    secondaryContainer: Color(0XFF626262),

    // On colors(text colors)
    onPrimary: Color(0XFF151516),
    onPrimaryContainer: Color(0XFF858585),
    onSecondaryContainer: Color(0XFF080808),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color  black900() {
    return Color(0XFF070505);
  }

  Color get primary => Color(0XFF7A62A3);
  // Color get black9001 => Colors.red;

  Color get black90001 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFD5D5D5);
  Color get blueGray50 => Color(0XFFF1F1F1);
  Color get blueGray800 => Color(0XFF48346A);

  // DeepPurple
  Color get deepPurple200 => Color(0XFFAB8CE0);
  Color get deepPurple500 => Color(0XFF663CAD);
  Color get deepPurple600 => Color(0XFF633CA4);

  // DeepPurpleF
  Color get deepPurple200F4 => Color(0XF4A892CE);

  // Gray
  Color get gray100 => Color(0XFFF4F4F4);
  Color get gray10001 => Color(0XFFF5F4F4);
  Color get gray200 => Color(0XFFEDEDED);
  Color get gray20001 => Color(0XFFECECEC);
  Color get gray20002 => Color(0XFFF0F0F0);
  Color get gray300 => Color(0XFFDEDEDE);
  Color get gray400 => Color(0XFFBFBFBF);
  Color get gray500 => Color(0XFF9C9B9B);
  Color get gray600 => Color(0XFF7B7B7B);
  Color get gray60001 => Color(0XFF7F7F7F);
  Color get gray60002 => Color(0XFF7C7C7C);
  Color get gray60003 => Color(0XFF6B6B6B);
  Color get gray800 => Color(0XFF4E4E4E);
  Color get gray80001 => Color(0XFF383838);

  // Indigo
  Color get indigo900 => Color(0XFF16255C);

  // Orange
  Color get orangeA100 => Color(0XFFFDD089);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
  Color get whiteA702 => Colors.red;

  // Yellow
  Color get yellow800 => Color(0XFFE9B522);
  Color get yellow80001 => Color(0XFFF49C19);
  Color get yellowA200 => Color(0XFF2FB600);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
