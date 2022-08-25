import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the28awg/components/components.dart';

class ThemeBuilder {
  final ThemeController _controller;

  ThemeBuilder(ThemeController controller) : _controller = controller;

  static String? get font => GoogleFonts.notoSans().fontFamily;

  ThemeData get light => theme(
        brightness: Brightness.light,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        fontFamily: font,
      );

  ThemeData get dark => theme(
        brightness: Brightness.dark,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        fontFamily: font,
      );

  ThemeData theme({
    required Brightness brightness,
    required SystemUiOverlayStyle systemOverlayStyle,
    String? fontFamily,
  }) {
    final MaterialColor primarySwatch = createPrimarySwatch(_controller.color);
    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: _controller.color,
      brightness: brightness,
    );
    final bool isDark = colorScheme.brightness == Brightness.dark;
    final Typography effectiveTypography = Typography.material2018(
      platform: _controller.platform,
    );
    TextTheme defTextTheme =
        isDark ? effectiveTypography.white : effectiveTypography.black;

    final bool primaryIsDark =
        ThemeData.estimateBrightnessForColor(colorScheme.primary) ==
            Brightness.dark;
    TextTheme defPrimaryTextTheme =
        primaryIsDark ? effectiveTypography.white : effectiveTypography.black;
    if (fontFamily != null) {
      defTextTheme = defTextTheme.apply(
        fontFamily: fontFamily,
      );
      defPrimaryTextTheme = defPrimaryTextTheme.apply(
        fontFamily: fontFamily,
      );
    }
    final Brightness appBarBrightness =
        ThemeData.estimateBrightnessForColor(colorScheme.surface);
    return ThemeData(
      extensions: [
        _Timestamp(DateTime.now().millisecond),
      ],
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: brightness,
      toggleableActiveColor: primarySwatch,
      primarySwatch: primarySwatch,
      scaffoldBackgroundColor: colorScheme.surface,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surface,
        selectedItemColor: primarySwatch,
      ),
      appBarTheme: AppBarTheme(
        color: colorScheme.surface,
        foregroundColor: colorScheme.surface,
        iconTheme: IconThemeData(color: colorScheme.primary),
        actionsIconTheme: IconThemeData(color: colorScheme.primary),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: appBarBrightness,
          statusBarIconBrightness: appBarBrightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          systemNavigationBarColor: const Color(0xFF000000),
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: null,
        ),
        toolbarTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
      ),
      typography: Typography.material2021(
        platform: _controller.platform,
      ),
      colorScheme: colorScheme,
      inputDecorationTheme: inputDecorationTheme(
        colorScheme: colorScheme,
      ),
      chipTheme: chipTheme(
        colorScheme: colorScheme,
        labelStyle: defTextTheme.button!,
      ),
      cardTheme: cardTheme(),
      popupMenuTheme: popupMenuTheme(),
      dialogTheme: dialogTheme(),
      bottomSheetTheme: bottomSheetTheme(),
      toggleButtonsTheme: toggleButtonsTheme(
        colorScheme: colorScheme,
      ),
      textButtonTheme: textButtonTheme(
        colorScheme: colorScheme,
      ),
      elevatedButtonTheme: elevatedButtonTheme(
        colorScheme: colorScheme,
      ),
      outlinedButtonTheme: outlinedButtonTheme(
        colorScheme: colorScheme,
      ),
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ),
      primaryIconTheme: IconThemeData(
        color: blendAlpha(
          colorScheme.primary,
          colorScheme.onPrimary,
          0x87,
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final bool filled = true,
    Color? fillColor,
    final double focusedBorderWidth = 1,
    final double unfocusedBorderWidth = 0.5,
    final double gapPadding = 4,
    final bool unfocusedHasBorder = true,
  }) {
    final Color baseColor = colorScheme.primary;

    fillColor = fillColor ??
        (colorScheme.brightness == Brightness.dark
            ? baseColor.withAlpha(0x14)
            : baseColor.withAlpha(0x0D));

    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      hoverColor: baseColor.withAlpha(0x0D),
      focusColor: baseColor.withAlpha(0x26),
      focusedBorder: OutlineInputBorder(
        gapPadding: gapPadding,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
        borderSide: BorderSide(
          color: baseColor,
          width: focusedBorderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        gapPadding: gapPadding,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
        borderSide: unfocusedHasBorder
            ? BorderSide(
                color: baseColor.withAlpha(0xA7),
                width: unfocusedBorderWidth,
              )
            : BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        gapPadding: gapPadding,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
        borderSide: unfocusedHasBorder
            ? BorderSide(
                color: blendAlpha(baseColor, colorScheme.onSurface, 0x66)
                    .withAlpha(0x31),
                width: unfocusedBorderWidth,
              )
            : BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        gapPadding: gapPadding,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
        borderSide: BorderSide(
          color: colorScheme.error,
          width: focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        gapPadding: gapPadding,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
        borderSide: BorderSide(
          color: colorScheme.error.withAlpha(0xA7),
          width: unfocusedBorderWidth,
        ),
      ),
    );
  }

  static ChipThemeData chipTheme({
    required final ColorScheme colorScheme,
    required TextStyle labelStyle,
    final double? radius,
  }) {
    final Color baseColor = colorScheme.primary;
    final Color foreground = blendAlpha(
      baseColor,
      colorScheme.onSurface,
      0x7F,
    );
    final Color selectedBackgroundColor = blendAlpha(
      baseColor,
      colorScheme.surface,
      0x96,
    );
    final TextStyle effectiveLabelStyle = labelStyle.copyWith(
      color: foreground,
    );
    return ChipThemeData(
      brightness: ThemeData.estimateBrightnessForColor(colorScheme.primary),
      padding: const EdgeInsets.all(4),
      backgroundColor: blendAlpha(
        baseColor,
        colorScheme.surface,
        0xCC,
      ),
      selectedColor: selectedBackgroundColor,
      secondarySelectedColor: selectedBackgroundColor,
      checkmarkColor: foreground,
      deleteIconColor: baseColor,
      disabledColor: blendAlpha(
        baseColor,
        colorScheme.onSurface,
        0x66,
      ).withAlpha(0x31),
      labelStyle: effectiveLabelStyle,
      secondaryLabelStyle: effectiveLabelStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 8),
        ),
      ),
    );
  }

  static CardTheme cardTheme({
    final double? radius,
    final double elevation = 0,
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      CardTheme(
        clipBehavior: clipBehavior,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 12),
          ),
        ),
      );

  static PopupMenuThemeData popupMenuTheme({
    final double? radius,
    final double elevation = 3,

    /// The background color of the popup menu.
    final Color? color,
  }) =>
      PopupMenuThemeData(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 10),
          ),
        ),
      );

  static DialogTheme dialogTheme({
    final double? radius,
    final double? elevation = 10,
    final Color? backgroundColor,
  }) =>
      DialogTheme(
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 28),
          ),
        ),
      );

  static BottomSheetThemeData bottomSheetTheme({
    final double elevation = 4,
    final double modalElevation = 8,
    final Clip clipBehavior = Clip.antiAlias,
  }) =>
      BottomSheetThemeData(
        clipBehavior: clipBehavior,
        elevation: elevation,
        modalElevation: modalElevation,
      );

  static ToggleButtonsThemeData toggleButtonsTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final double borderWidth = 0.5,
    final Size minButtonSize = const Size(40, 40),
    VisualDensity? visualDensity,
  }) {
    visualDensity = visualDensity ?? VisualDensity.adaptivePlatformDensity;
    return ToggleButtonsThemeData(
      borderWidth: borderWidth,
      selectedColor: blendAlpha(
        colorScheme.primary,
        colorScheme.onPrimary,
        0x87,
      ),
      color: colorScheme.primary,
      fillColor: blendAlpha(
        colorScheme.primary,
        Colors.white,
        0x19,
      ),
      borderColor: colorScheme.primary.withAlpha(
        0xA7,
      ),
      selectedBorderColor: blendAlpha(
        colorScheme.primary,
        Colors.white,
        0x19,
      ),
      hoverColor: blendAlpha(
        colorScheme.primary,
        Colors.white,
        0x40 + 0x19,
      ).withAlpha(0x19),
      focusColor: blendAlpha(
        colorScheme.primary,
        Colors.white,
        0x4C + 0x19,
      ).withAlpha(0x4C),
      highlightColor: blendAlpha(
        colorScheme.primary,
        Colors.white,
        0x40 + 0x19,
      ).withAlpha(0x19),
      splashColor: blendAlpha(
        colorScheme.primary,
        Colors.white,
        0x1F + 0x19,
      ).withAlpha(0x33),
      disabledColor: blendAlpha(
        colorScheme.primary,
        colorScheme.onSurface,
        0x66,
      ).withAlpha(0x5E),
      disabledBorderColor: blendAlpha(
        colorScheme.primary,
        colorScheme.onSurface,
        0x66,
      ).withAlpha(0x31),
      borderRadius: BorderRadius.circular(radius ?? 20),
      constraints: BoxConstraints(
        minWidth: minButtonSize.width -
            borderWidth * 2 +
            visualDensity.baseSizeAdjustment.dx,
        minHeight: minButtonSize.height -
            borderWidth * 2 +
            visualDensity.baseSizeAdjustment.dy,
      ),
    );
  }

  static TextButtonThemeData textButtonTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final EdgeInsetsGeometry? padding,
    final Size minButtonSize = const Size(40, 40),
  }) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 20),
            ),
          ), // buttonShape,
          padding: padding,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return blendAlpha(
                  colorScheme.primary,
                  colorScheme.onSurface,
                  0x66,
                ).withAlpha(0x5E);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(0x0D);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(0x26);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(0x33);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

  /// An opinionated [ElevatedButtonThemeData] theme.
  ///
  /// Requires a [ColorScheme] in [colorscheme]. The color scheme would
  /// typically be equal the color scheme also used to define the color scheme
  /// for your app theme.
  ///
  /// The button [elevation] defaults to 1 [kElevatedButtonElevation], making
  /// the elevated button a bit more flat. Flutter SDK ElevatedButton
  /// defaults to elevation 2.
  ///
  /// The adjustable button corner [radius] defaults to 20. This is the new
  /// default in M3, Flutter SDK M2 defaults to 4.
  static ElevatedButtonThemeData elevatedButtonTheme({
    /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
    required final ColorScheme colorScheme,
    final double? radius,
    final double elevation = 1,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` constructors default padding.
    ///
    /// M3 has more horizontal padding 24dp, but the tighter default padding
    /// in M2 that is 16dp looks fine as well when using stadium borders
    /// as in M3.
    /// Making the custom scalable padding and separate one for icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,
    final Size minButtonSize = const Size(40, 40),
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: minButtonSize,
          padding: padding,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 20),
            ),
          ), //buttonShape,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return blendAlpha(
                  colorScheme.primary,
                  colorScheme.onSurface,
                  0x66,
                ).withAlpha(0x5E);
              }
              return colorScheme.onPrimary;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return blendAlpha(
                  colorScheme.primary,
                  colorScheme.onSurface,
                  0x66,
                ).withAlpha(0x31);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.onPrimary.withAlpha(0x0D);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.onPrimary.withAlpha(0x26);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.onPrimary.withAlpha(0x33);
              }
              return Colors.transparent;
            },
          ),
        ),
      );

  static OutlinedButtonThemeData outlinedButtonTheme({
    required final ColorScheme colorScheme,
    final double? radius,
    final double pressedOutlineWidth = 1.0,
    final double outlineWidth = 0.5,

    /// Padding for the button theme.
    ///
    /// Defaults to null and uses `styleFrom` constructors default padding.
    ///
    /// M3 has more horizontal padding 24dp, but the tighter default padding
    /// in M2 that is 16dp looks fine as well when using stadium borders
    /// as in M3.
    /// Making the custom scalable padding and separate one for icon
    /// versions is rather involved, so sticking to defaults, but exposing the
    /// padding property for future or external use.
    final EdgeInsetsGeometry? padding,
    final Size minButtonSize = const Size(40, 40),
  }) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: minButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 20),
            ),
          ), //buttonShape,
          padding: padding,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return blendAlpha(
                  colorScheme.primary,
                  colorScheme.onSurface,
                  0x66,
                ).withAlpha(0x5E);
              }
              return colorScheme.primary;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return colorScheme.primary.withAlpha(0x0D);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary.withAlpha(0x26);
              }
              if (states.contains(MaterialState.pressed)) {
                return colorScheme.primary.withAlpha(0x33);
              }
              return Colors.transparent;
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide?>(
            (final Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: blendAlpha(
                    colorScheme.primary,
                    colorScheme.onSurface,
                    0x66,
                  ).withAlpha(0x31),
                  width: outlineWidth,
                );
              }
              if (states.contains(MaterialState.error)) {
                return BorderSide(
                  color: colorScheme.error,
                  width: pressedOutlineWidth,
                );
              }
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(
                  color: colorScheme.primary,
                  width: pressedOutlineWidth,
                );
              }
              return BorderSide(
                color: colorScheme.primary.withAlpha(0xA7),
                width: outlineWidth,
              );
            },
          ),
        ),
      );

  static Color blendAlpha(
    final Color base,
    final Color input, [
    final int alpha = 0x0A,
  ]) {
    if (alpha <= 0) return base;
    if (alpha >= 255) return input;
    return Color.alphaBlend(input.withAlpha(alpha), base);
  }

  static MaterialColor createPrimarySwatch(final Color color) {
    const List<double> strengths = [
      0.05,
      0.1,
      0.2,
      0.3,
      0.4,
      0.5,
      0.6,
      0.7,
      0.8,
      0.9,
    ];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red;
    final int g = color.green;
    final int b = color.blue;
    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

class _Timestamp extends ThemeExtension<_Timestamp> {
  final int now;

  _Timestamp(this.now);

  @override
  ThemeExtension<_Timestamp> copyWith({
    int? now,
  }) {
    return _Timestamp(now ?? this.now);
  }

  @override
  ThemeExtension<_Timestamp> lerp(ThemeExtension<_Timestamp>? other, double t) {
    if (other is! _Timestamp) {
      return this;
    }
    return this;
  }
}
