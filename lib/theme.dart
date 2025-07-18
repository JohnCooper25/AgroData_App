import 'package:flutter/material.dart';

class MaterialTheme {
  // Aquí definimos un textTheme que aplica tu fuente MerriweatherItalic
  final TextTheme textTheme = ThemeData.dark().textTheme.apply(
    fontFamily: 'MerriweatherItalic',
  );

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8e4d2d),
      surfaceTint: Color(0xff8e4d2d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdbcc),
      onPrimaryContainer: Color(0xff713718),
      secondary: Color(0xff765749),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbcc),
      onSecondaryContainer: Color(0xff5c4033),
      tertiary: Color(0xff665f31),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffeee4a9),
      onTertiaryContainer: Color(0xff4d471b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff221a16),
      onSurfaceVariant: Color(0xff52443d),
      outline: Color(0xff85736c),
      outlineVariant: Color(0xffd7c2ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb694),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb694),
      onPrimaryFixedVariant: Color(0xff713718),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff2c160b),
      secondaryFixedDim: Color(0xffe6bead),
      onSecondaryFixedVariant: Color(0xff5c4033),
      tertiaryFixed: Color(0xffeee4a9),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd1c88f),
      onTertiaryFixedVariant: Color(0xff4d471b),
      surfaceDim: Color(0xffe8d6d0),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffceae3),
      surfaceContainerHigh: Color(0xfff6e5de),
      surfaceContainerHighest: Color(0xfff1dfd8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb694),
      surfaceTint: Color(0xffffb694),
      onPrimary: Color(0xff542104),
      primaryContainer: Color(0xff713718),
      onPrimaryContainer: Color(0xffffdbcc),
      secondary: Color(0xffe6bead),
      onSecondary: Color(0xff442a1f),
      secondaryContainer: Color(0xff5c4033),
      onSecondaryContainer: Color(0xffffdbcc),
      tertiary: Color(0xffd1c88f),
      onTertiary: Color(0xff363107),
      tertiaryContainer: Color(0xff4d471b),
      onTertiaryContainer: Color(0xffeee4a9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a120e),
      onSurface: Color(0xfff1dfd8),
      onSurfaceVariant: Color(0xffd7c2ba),
      outline: Color(0xffa08d85),
      outlineVariant: Color(0xff52443d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd8),
      inversePrimary: Color(0xff8e4d2d),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb694),
      onPrimaryFixedVariant: Color(0xff713718),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff2c160b),
      secondaryFixedDim: Color(0xffe6bead),
      onSecondaryFixedVariant: Color(0xff5c4033),
      tertiaryFixed: Color(0xffeee4a9),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd1c88f),
      onTertiaryFixedVariant: Color(0xff4d471b),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff423732),
      surfaceContainerLowest: Color(0xff140c09),
      surfaceContainerLow: Color(0xff221a16),
      surfaceContainer: Color(0xff271e1a),
      surfaceContainerHigh: Color(0xff322824),
      surfaceContainerHighest: Color(0xff3d332e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

// Resto de clases sin cambios...
class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
