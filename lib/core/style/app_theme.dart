import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/style/app_color.dart';

import '../config/dimen.dart';

@injectable
class AppTheme {
  bool isDark = false;

  AppTheme({required this.appColors});

  final AppColorsBase appColors;

  appThemeLight(BuildContext context) {
    final defaultTheme = Theme.of(context).copyWith(
        brightness: Brightness.light);

    final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: appColors.primary.light,
      scaffoldBackgroundColor: appColors.mainBackground.light,
      fontFamily: AssetsBase.fontFamily,
      colorScheme: defaultTheme.colorScheme.copyWith(
          primary: appColors.primary.light,
          secondary: appColors.primariesShade01.light,
          error: appColors.error.light),
      dividerTheme: defaultTheme.dividerTheme.copyWith(
        space: Dimen.dividerThickness,
        thickness: Dimen.dividerThickness,
        color: appColors.neutralsBorderDivider.light,
      ),
      textTheme: defaultTheme.textTheme.copyWith(
        headlineLarge: context.titleLargeTitle,
        headlineMedium: context.titleTitle1,
        headlineSmall: context.titleTitle3,
        bodyLarge: context.bodyBodyMedium,
        bodyMedium: context.bodyBody,

      ),
      radioTheme: defaultTheme.radioTheme.copyWith(
          fillColor: WidgetStateProperty.all(appColors.primary.light)),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
                (states) =>
            states.contains(WidgetState.selected)
                ? appColors.primary.light
                : null),
      ),
      inputDecorationTheme: defaultTheme.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.neutralsBorderDivider.light,
                width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimen.inputRadius))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.neutralsBorderDivider.light,
                width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimen.inputRadius))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: appColors.primary.light, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimen.inputRadius))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: appColors.primary.light, width: Dimen.borderWidth),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimen.inputRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.light),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimen.inputRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.light),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimen.inputRadius)),
        ),
        hintStyle: context.bodyBody,
        errorStyle: context.captionCaption.copyWith(
            color: appColors.error.light),
        errorMaxLines: 2,
        alignLabelWithHint: true,
      ),
    );

    return theme;
  }

  ThemeData appThemeDark(BuildContext context) {
    final defaultTheme = Theme.of(context).copyWith(
        brightness: Brightness.dark);

    final theme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: appColors.primary.dark,
      scaffoldBackgroundColor: appColors.mainBackground.dark,
      fontFamily: AssetsBase.fontFamily,
      colorScheme: defaultTheme.colorScheme
          .copyWith(primary: appColors.primary.dark,
          secondary: appColors.primariesShade01.dark,
          error: appColors.error.dark),
      dividerTheme: defaultTheme.dividerTheme.copyWith(
        space: Dimen.dividerThickness,
        thickness: Dimen.dividerThickness,
        color: appColors.neutralsBorderDivider.dark,
      ),
      textTheme: defaultTheme.textTheme.copyWith(
        headlineLarge: context.titleLargeTitle,
        headlineMedium: context.titleTitle1,
        headlineSmall: context.titleTitle3,
        bodyLarge: context.bodyBodyMedium,
        bodyMedium: context.bodyBody,
      ),
      radioTheme: defaultTheme.radioTheme.copyWith(
          fillColor: MaterialStateProperty.all(appColors.primary.dark)),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
                (states) =>
            states.contains(WidgetState.selected)
                ? appColors.primary.dark
                : null),
      ),
      inputDecorationTheme: defaultTheme.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.neutralsBorderDivider.dark,
                width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimen.inputRadius))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.neutralsBorderDivider.dark,
                width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimen.inputRadius))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: appColors.primary.dark, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimen.inputRadius))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: appColors.primary.dark, width: Dimen.borderWidth),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimen.inputRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.dark),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimen.inputRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.dark),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimen.inputRadius)),
        ),
        hintStyle: context.bodyBody,
        errorStyle: context.captionCaption.copyWith(
            color: appColors.error.light),
        errorMaxLines: 2,
        alignLabelWithHint: true,
      ),
    );

    return theme;
  }
}

extension TextThemeSchemeExtension on BuildContext {

  TextStyle get titleLargeTitle =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w700, fontSize: 34);

  TextStyle get titleTitle1 =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w700, fontSize: 28);


  TextStyle get titleTitle2 =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w700, fontSize: 22);



  TextStyle get titleTitle3 =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w700, fontSize: 20);

  TextStyle get titleHeadline =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w600, fontSize: 17);


  TextStyle get bodyBodyMedium =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w500, fontSize: 17);

  TextStyle get bodyBody =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w400, fontSize: 17);

  TextStyle get bodyCallout =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w400, fontSize: 16);



  TextStyle get subheadlineSubheadlineMedium =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w500, fontSize: 15);

  TextStyle get subheadlineSubheadline =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w400, fontSize: 15);

  TextStyle get subheadlineSubheadlineSemibold =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w600, fontSize: 15);

  TextStyle get footnoteFootnoteBold =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w600, fontSize: 13);

  TextStyle get footnoteFootnote =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w400, fontSize: 13);


  TextStyle get captionCaptionSemibold =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w600, fontSize: 11);

  TextStyle get captionCaption =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w400, fontSize: 11);

  TextStyle get otherNavigationLabel =>
      TextStyle(color: Theme.of(this).colorScheme.primaryText, fontWeight: FontWeight.w400, fontSize: 10,letterSpacing: -0.24);

}

extension ColorSchemeExtension on ColorScheme {

  Color get primary =>
      brightness == Brightness.light ? appColors.primary.light : appColors
          .primary.dark;

  Color get primariesShade01 =>
      brightness == Brightness.light
          ? appColors.primariesShade01.light
          : appColors.primariesShade01.dark;

  Color get primariesShade02 =>
      brightness == Brightness.light
          ? appColors.primariesShade02.light
          : appColors.primariesShade02.dark;

  Color get primariesShade03 =>
      brightness == Brightness.light
          ? appColors.primariesShade03.light
          : appColors.primariesShade03.dark;


  Color get primaryText =>
      brightness == Brightness.light ? appColors.primaryText.light : appColors
          .primaryText.dark;

  Color get secondaryText =>
      brightness == Brightness.light ? appColors.secondaryText.light : appColors
          .secondaryText.dark;

  Color get tertiaryText =>
      brightness == Brightness.light ? appColors.tertiaryText.light : appColors
          .tertiaryText.dark;

  Color get disabledText =>
      brightness == Brightness.light ? appColors.disabledText.light : appColors
          .disabledText.dark;

  Color get whiteText =>
      brightness == Brightness.light ? appColors.whiteText.light : appColors
          .whiteText.dark;

  Color get neutralsBackground =>
      brightness == Brightness.light
          ? appColors.neutralsBackground.light
          : appColors.neutralsBackground.dark;

  Color get neutralsCards =>
      brightness == Brightness.light ? appColors.neutralsCards.light : appColors
          .neutralsCards.dark;

  Color get neutralsFieldsTags =>
      brightness == Brightness.light
          ? appColors.neutralsFieldsTags.light
          : appColors.neutralsFieldsTags.dark;

  Color get neutralsBorderDivider =>
      brightness == Brightness.light ? appColors.neutralsBorderDivider.light
          .withOpacity(0.08) : appColors.neutralsBorderDivider.dark.withOpacity(
          0.08);


  Color get success =>
      brightness == Brightness.light ? appColors.success.light : appColors
          .success.dark;

  Color get warning =>
      brightness == Brightness.light ? appColors.warning.light : appColors
          .warning.dark;

  Color get info =>
      brightness == Brightness.light ? appColors.info.light : appColors.info
          .dark;


  Color get error =>
      brightness == Brightness.light ? appColors.error.light : appColors.error
          .dark;

  Color get mainBackground =>
      brightness == Brightness.light
          ? appColors.mainBackground.light
          : appColors.mainBackground.dark;

  Color get disableButtonBackground =>
      brightness == Brightness.light ? appColors.disabledText.light : appColors
          .disabledText.dark;

  Color get errorBackground =>
      brightness == Brightness.light ? appColors.error.light : appColors.error
          .dark;


  Color get warningBackground =>
      brightness == Brightness.light ? appColors.warning.light : appColors
          .warning.dark;

  Color get successBackground =>
      brightness == Brightness.light ? appColors.success.light : appColors
          .success.dark;

  Color get highContrast =>
      brightness == Brightness.light ? Colors.black : Colors.white;

  Color get expandMoreDropDown =>
      brightness == Brightness.light
          ? appColors.expandMoreDropDown.light
          : appColors.expandMoreDropDown.dark;

  Color get selectIconDropDown =>
      brightness == Brightness.light
          ? appColors.selectIconDropDown.light
          : appColors.selectIconDropDown.dark;
  Color get progress =>
      brightness == Brightness.light
          ? appColors.progress.light
          : appColors.progress.dark;

  Color get tabBorder =>
      brightness == Brightness.light
          ? appColors.tabBorder.light.withOpacity(0.36)
          : appColors.tabBorder.dark;


}