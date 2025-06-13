import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

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

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5c2709),
      surfaceTint: Color(0xff8e4d2d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9f5b3a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a3024),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff866657),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3c370c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff756e3e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff170f0c),
      onSurfaceVariant: Color(0xff41332d),
      outline: Color(0xff5f4f49),
      outlineVariant: Color(0xff7b6962),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb694),
      primaryFixed: Color(0xff9f5b3a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff824425),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff866657),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c4e40),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff756e3e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5c5628),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3bd),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfff6e5de),
      surfaceContainerHigh: Color(0xffebd9d3),
      surfaceContainerHighest: Color(0xffdfcec8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f1d02),
      surfaceTint: Color(0xff8e4d2d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff73391b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f261b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5f4336),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff322d03),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff504a1e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362924),
      outlineVariant: Color(0xff554640),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb694),
      primaryFixed: Color(0xff73391b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff572306),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5f4336),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff462d21),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff504a1e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff383309),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6b5af),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede6),
      surfaceContainer: Color(0xfff1dfd8),
      surfaceContainerHigh: Color(0xffe2d1ca),
      surfaceContainerHighest: Color(0xffd4c3bd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
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

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3c0),
      surfaceTint: Color(0xffffb694),
      onPrimary: Color(0xff451700),
      primaryContainer: Color(0xffc97e5a),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdd4c2),
      onSecondary: Color(0xff372015),
      secondaryContainer: Color(0xffad8979),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe7dea3),
      onTertiary: Color(0xff2b2600),
      tertiaryContainer: Color(0xff9a925e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a120e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed8cf),
      outline: Color(0xffc2aea5),
      outlineVariant: Color(0xff9f8c85),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd8),
      inversePrimary: Color(0xff723819),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff240900),
      primaryFixedDim: Color(0xffffb694),
      onPrimaryFixedVariant: Color(0xff5c2709),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff1f0c04),
      secondaryFixedDim: Color(0xffe6bead),
      onSecondaryFixedVariant: Color(0xff4a3024),
      tertiaryFixed: Color(0xffeee4a9),
      onTertiaryFixed: Color(0xff141100),
      tertiaryFixedDim: Color(0xffd1c88f),
      onTertiaryFixedVariant: Color(0xff3c370c),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff4d423d),
      surfaceContainerLowest: Color(0xff0d0604),
      surfaceContainerLow: Color(0xff251c18),
      surfaceContainer: Color(0xff2f2622),
      surfaceContainerHigh: Color(0xff3b302c),
      surfaceContainerHighest: Color(0xff463b37),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece5),
      surfaceTint: Color(0xffffb694),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb08c),
      onPrimaryContainer: Color(0xff1b0500),
      secondary: Color(0xffffece5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe2baa9),
      onSecondaryContainer: Color(0xff180601),
      tertiary: Color(0xfffbf1b6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcdc48c),
      onTertiaryContainer: Color(0xff0e0b00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a120e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece5),
      outlineVariant: Color(0xffd3beb6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd8),
      inversePrimary: Color(0xff723819),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb694),
      onPrimaryFixedVariant: Color(0xff240900),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe6bead),
      onSecondaryFixedVariant: Color(0xff1f0c04),
      tertiaryFixed: Color(0xffeee4a9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd1c88f),
      onTertiaryFixedVariant: Color(0xff141100),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff594e49),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271e1a),
      surfaceContainer: Color(0xff382e2a),
      surfaceContainerHigh: Color(0xff443935),
      surfaceContainerHighest: Color(0xff504440),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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


  List<ExtendedColor> get extendedColors => [
  ];
}

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
