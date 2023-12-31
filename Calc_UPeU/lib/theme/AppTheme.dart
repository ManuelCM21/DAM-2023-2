import 'package:flutter/material.dart';
class AppTheme {
  static Color colorX = Color(0xff99ff05);
  static List<Color> colorOptions = [
    Colors.purple,
    Colors.green,
    Colors.teal,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    colorX
  ];

  static List<String> colorText = <String>[
  "Purple",
  "Green",
  "Teal",
  "Yellow",
  "Orange",
  "Pink",
  "Personalizado",
  ];

  static List<Color> colorOptionsLD = [
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.green,
  ];

  static List<String> colorTextLD = <String>[
    "Blue",
    "Brown",
    "Purple",
    "Green",
  ];

  AppTheme._();
  static List<ColorScheme> colorOptionsShemeL = [
    lightColorSchemeBlue,
    lightColorSchemeBrown,
    lightColorSchemePurple,
    lightColorSchemeGreen
  ];
  static List<ColorScheme> colorOptionsShemeD = [
    darkColorSchemeBlue,
    darkColorSchemeBrown,
    darkColorSchemePurple,
    darkColorSchemeGreen
  ];

  static bool useMaterial3 = false;
  static bool useLightMode = true;
  static int colorSelected = 1;
  static ThemeData themeData = ThemeData(
      colorSchemeSeed: AppTheme.colorOptions[AppTheme.colorSelected],
      useMaterial3: AppTheme.useMaterial3,
      brightness: AppTheme.useLightMode ? Brightness.light : Brightness.dark);

  static ThemeData themeDataLight=ThemeData(useMaterial3: useMaterial3,
      colorScheme: AppTheme.colorOptionsShemeL[AppTheme.colorSelected]);
  static ThemeData themeDataDark=ThemeData(useMaterial3: useMaterial3,
      colorScheme: AppTheme.colorOptionsShemeD[AppTheme.colorSelected]);

  static const lightColorSchemeBrown = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF705D00),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFE16F),
    onPrimaryContainer: Color(0xFF221B00),
    secondary: Color(0xFF675E40),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFEFE2BC),
    onSecondaryContainer: Color(0xFF211B04),
    tertiary: Color(0xFF44664D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC6ECCD),
    onTertiaryContainer: Color(0xFF00210E),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1D1B16),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1D1B16),
    surfaceVariant: Color(0xFFEAE2CF),
    onSurfaceVariant: Color(0xFF4B4639),
    outline: Color(0xFF7C7767),
    onInverseSurface: Color(0xFFF6F0E7),
    inverseSurface: Color(0xFF33302A),
    inversePrimary: Color(0xFFE3C54A),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF705D00),
    outlineVariant: Color(0xFFCDC6B4),
    scrim: Color(0xFF000000),
  );

  static const darkColorSchemeBrown = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFE3C54A),
    onPrimary: Color(0xFF3A3000),
    primaryContainer: Color(0xFF544600),
    onPrimaryContainer: Color(0xFFFFE16F),
    secondary: Color(0xFFD2C6A1),
    onSecondary: Color(0xFF373016),
    secondaryContainer: Color(0xFF4E462A),
    onSecondaryContainer: Color(0xFFEFE2BC),
    tertiary: Color(0xFFAAD0B1),
    onTertiary: Color(0xFF163722),
    tertiaryContainer: Color(0xFF2D4E37),
    onTertiaryContainer: Color(0xFFC6ECCD),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1D1B16),
    onBackground: Color(0xFFE8E2D9),
    surface: Color(0xFF1D1B16),
    onSurface: Color(0xFFE8E2D9),
    surfaceVariant: Color(0xFF4B4639),
    onSurfaceVariant: Color(0xFFCDC6B4),
    outline: Color(0xFF979080),
    onInverseSurface: Color(0xFF1D1B16),
    inverseSurface: Color(0xFFE8E2D9),
    inversePrimary: Color(0xFF705D00),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFE3C54A),
    outlineVariant: Color(0xFF4B4639),
    scrim: Color(0xFF000000),
  );

  static const lightColorSchemeBlue = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006590),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFC8E6FF),
    onPrimaryContainer: Color(0xFF001E2E),
    secondary: Color(0xFF4F606E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD2E5F5),
    onSecondaryContainer: Color(0xFF0B1D29),
    tertiary: Color(0xFF63597C),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE9DDFF),
    onTertiaryContainer: Color(0xFF1F1635),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFCFCFF),
    onBackground: Color(0xFF191C1E),
    surface: Color(0xFFFCFCFF),
    onSurface: Color(0xFF191C1E),
    surfaceVariant: Color(0xFFDDE3EA),
    onSurfaceVariant: Color(0xFF41484D),
    outline: Color(0xFF71787E),
    onInverseSurface: Color(0xFFF0F0F3),
    inverseSurface: Color(0xFF2E3133),
    inversePrimary: Color(0xFF87CEFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006590),
    outlineVariant: Color(0xFFC1C7CE),
    scrim: Color(0xFF000000),
  );

  static const darkColorSchemeBlue = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF87CEFF),
    onPrimary: Color(0xFF00344D),
    primaryContainer: Color(0xFF004C6D),
    onPrimaryContainer: Color(0xFFC8E6FF),
    secondary: Color(0xFFB7C9D8),
    onSecondary: Color(0xFF21323E),
    secondaryContainer: Color(0xFF384956),
    onSecondaryContainer: Color(0xFFD2E5F5),
    tertiary: Color(0xFFCDC0E9),
    onTertiary: Color(0xFF342B4B),
    tertiaryContainer: Color(0xFF4B4163),
    onTertiaryContainer: Color(0xFFE9DDFF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1E),
    onBackground: Color(0xFFE2E2E5),
    surface: Color(0xFF191C1E),
    onSurface: Color(0xFFE2E2E5),
    surfaceVariant: Color(0xFF41484D),
    onSurfaceVariant: Color(0xFFC1C7CE),
    outline: Color(0xFF8B9198),
    onInverseSurface: Color(0xFF191C1E),
    inverseSurface: Color(0xFFE2E2E5),
    inversePrimary: Color(0xFF006590),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF87CEFF),
    outlineVariant: Color(0xFF41484D),
    scrim: Color(0xFF000000),
  );

  static const lightColorSchemePurple = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6C4EA2),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEBDCFF),
    onPrimaryContainer: Color(0xFF260058),
    secondary: Color(0xFF635B70),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFEADEF7),
    onSecondaryContainer: Color(0xFF1F182A),
    tertiary: Color(0xFF7F525D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD9E0),
    onTertiaryContainer: Color(0xFF32101B),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1D1B1E),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1D1B1E),
    surfaceVariant: Color(0xFFE7E0EB),
    onSurfaceVariant: Color(0xFF49454E),
    outline: Color(0xFF7A757F),
    onInverseSurface: Color(0xFFF5EFF4),
    inverseSurface: Color(0xFF323033),
    inversePrimary: Color(0xFFD4BBFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF6C4EA2),
    outlineVariant: Color(0xFFCBC4CF),
    scrim: Color(0xFF000000),
  );

  static const darkColorSchemePurple = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD4BBFF),
    onPrimary: Color(0xFF3C1C70),
    primaryContainer: Color(0xFF543588),
    onPrimaryContainer: Color(0xFFEBDCFF),
    secondary: Color(0xFFCDC2DB),
    onSecondary: Color(0xFF342D40),
    secondaryContainer: Color(0xFF4B4358),
    onSecondaryContainer: Color(0xFFEADEF7),
    tertiary: Color(0xFFF1B7C4),
    onTertiary: Color(0xFF4A252F),
    tertiaryContainer: Color(0xFF643B45),
    onTertiaryContainer: Color(0xFFFFD9E0),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1D1B1E),
    onBackground: Color(0xFFE6E1E6),
    surface: Color(0xFF1D1B1E),
    onSurface: Color(0xFFE6E1E6),
    surfaceVariant: Color(0xFF49454E),
    onSurfaceVariant: Color(0xFFCBC4CF),
    outline: Color(0xFF948F99),
    onInverseSurface: Color(0xFF1D1B1E),
    inverseSurface: Color(0xFFE6E1E6),
    inversePrimary: Color(0xFF6C4EA2),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFD4BBFF),
    outlineVariant: Color(0xFF49454E),
    scrim: Color(0xFF000000),
  );

  static const lightColorSchemeGreen = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF2D6C06),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFADF684),
    onPrimaryContainer: Color(0xFF082100),
    secondary: Color(0xFF55624C),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD9E7CA),
    onSecondaryContainer: Color(0xFF131F0D),
    tertiary: Color(0xFF386666),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBBEBEB),
    onTertiaryContainer: Color(0xFF002020),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFDFDF5),
    onBackground: Color(0xFF1A1C18),
    surface: Color(0xFFFDFDF5),
    onSurface: Color(0xFF1A1C18),
    surfaceVariant: Color(0xFFE0E4D6),
    onSurfaceVariant: Color(0xFF43483E),
    outline: Color(0xFF74796D),
    onInverseSurface: Color(0xFFF1F1EA),
    inverseSurface: Color(0xFF2F312D),
    inversePrimary: Color(0xFF92D96B),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF2D6C06),
    outlineVariant: Color(0xFFC3C8BB),
    scrim: Color(0xFF000000),
  );

  static const darkColorSchemeGreen = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF92D96B),
    onPrimary: Color(0xFF123800),
    primaryContainer: Color(0xFF1E5200),
    onPrimaryContainer: Color(0xFFADF684),
    secondary: Color(0xFFBDCBAF),
    onSecondary: Color(0xFF283420),
    secondaryContainer: Color(0xFF3E4A35),
    onSecondaryContainer: Color(0xFFD9E7CA),
    tertiary: Color(0xFFA0CFCF),
    onTertiary: Color(0xFF003737),
    tertiaryContainer: Color(0xFF1E4E4E),
    onTertiaryContainer: Color(0xFFBBEBEB),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1C18),
    onBackground: Color(0xFFE3E3DC),
    surface: Color(0xFF1A1C18),
    onSurface: Color(0xFFE3E3DC),
    surfaceVariant: Color(0xFF43483E),
    onSurfaceVariant: Color(0xFFC3C8BB),
    outline: Color(0xFF8D9286),
    onInverseSurface: Color(0xFF1A1C18),
    inverseSurface: Color(0xFFE3E3DC),
    inversePrimary: Color(0xFF2D6C06),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF92D96B),
    outlineVariant: Color(0xFF43483E),
    scrim: Color(0xFF000000),
  );

}//Comentar