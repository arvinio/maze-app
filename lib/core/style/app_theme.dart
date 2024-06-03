import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/style/app_color.dart';

import '../config/assets.dart';
import '../config/dimen.dart';

@injectable
class AppTheme{
  bool isDark=false;
  AppTheme({required this.appColors});
  final AppColorsBase   appColors;

  appThemeLight(BuildContext context) {
    final defaultTheme = Theme.of(context).copyWith(brightness: Brightness.light);

    final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: appColors.primary.light,
      scaffoldBackgroundColor: appColors.mainBackground1.light,
      //backgroundColor: appColors.mainBackground1.light,
     // errorColor: appColors.error.light,
      fontFamily: AssetsBase.fontFamily,
      colorScheme: defaultTheme.colorScheme.copyWith(
          primary: appColors.primary.light, secondary: appColors.secondary.light, error: appColors.error.light),
      bottomSheetTheme: defaultTheme.bottomSheetTheme.copyWith(backgroundColor: appColors.dialogBackground.light),
      floatingActionButtonTheme: defaultTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: appColors.floatButtonBackground.light,
      ),
      dividerTheme: defaultTheme.dividerTheme.copyWith(
        space: Dimen.dividerThickness,
        thickness: Dimen.dividerThickness,
        color: appColors.divider.light,
      ),
      textTheme: defaultTheme.textTheme.copyWith(
        headlineLarge: context.headline4Bold,
        headlineMedium: context.headline5Bold,
        headlineSmall: context.title2Bold,
        bodyLarge: context.body1Medium,
        bodyMedium: context.body2Medium,
      ),
      radioTheme: defaultTheme.radioTheme.copyWith(fillColor: MaterialStateProperty.all(appColors.primary.light)),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.selected) ? appColors.primary.light : null),
          trackColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.selected) ? appColors.primary.light.withOpacity(0.2) : null)),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.selected) ? appColors.primary.light : null),
      ),
      inputDecorationTheme: defaultTheme.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.inputBorder.light, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.inputBorder.light, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.primary.light, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.primary.light, width: Dimen.borderWidth),
          borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.light),
          borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.light),
          borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius)),
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          color: appColors.hint.light,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: appColors.hint.light,
          fontWeight: FontWeight.w500,
        ),
        //errorStyle: defaultTheme.textTheme.caption?.copyWith(color: appColors.error.light),
        errorMaxLines: 2,
        alignLabelWithHint: true,
      ),
    );

    return theme;
  }

  ThemeData appThemeDark(BuildContext context) {
    final defaultTheme = Theme.of(context).copyWith(brightness: Brightness.dark);

    final theme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: appColors.primary.dark,
      scaffoldBackgroundColor: appColors.mainBackground1.dark,
     // backgroundColor: appColors.mainBackground1.dark,
      //errorColor: appColors.error.dark,
      fontFamily: AssetsBase.fontFamily,
      colorScheme: defaultTheme.colorScheme
          .copyWith(primary: appColors.primary.dark, secondary: appColors.secondary.dark, error: appColors.error.dark),
      bottomSheetTheme: defaultTheme.bottomSheetTheme.copyWith(backgroundColor: appColors.dialogBackground.dark),
      floatingActionButtonTheme: defaultTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: appColors.floatButtonBackground.dark,
      ),
      dividerTheme: defaultTheme.dividerTheme.copyWith(
        space: Dimen.dividerThickness,
        thickness: Dimen.dividerThickness,
        color: appColors.divider.dark,
      ),
      textTheme: defaultTheme.textTheme.copyWith(
        headlineLarge: context.headline4Bold,
        headlineMedium: context.headline5Bold,
        headlineSmall: context.title2Bold,
        bodyLarge: context.body1Medium,
        bodyMedium: context.body2Medium,
      ),
      radioTheme: defaultTheme.radioTheme.copyWith(fillColor: MaterialStateProperty.all(appColors.primary.dark)),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.selected) ? appColors.primary.dark : null),
          trackColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.selected) ? appColors.primary.dark.withOpacity(0.2) : null)),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.selected) ? appColors.primary.dark : null),
      ),
      inputDecorationTheme: defaultTheme.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.inputBorder.dark, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.inputBorder.dark, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.primary.dark, width: Dimen.borderWidth),
            borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.primary.dark, width: Dimen.borderWidth),
          borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.dark),
          borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appColors.error.dark),
          borderRadius: const BorderRadius.all(Radius.circular(Dimen.inputRadius)),
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          color: appColors.hint.dark,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: appColors.hint.dark,
          fontWeight: FontWeight.w500,
        ),
      //  errorStyle: defaultTheme.textTheme.caption?.copyWith(color: appColors.error.dark),
        errorMaxLines: 2,
        alignLabelWithHint: true,
      ),
    );

    return theme;
  }


}


extension TextThemeSchemeExtension on BuildContext {
  TextStyle get headline1Bold =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w700, fontSize: 28);

  TextStyle get headline1Medium =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w500, fontSize: 28);

  TextStyle get headline1Regular =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w400, fontSize: 28);

  TextStyle get headline2Bold =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w700, fontSize: 26);

  TextStyle get headline2Medium =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w500, fontSize: 26);

  TextStyle get headline2Regular =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w400, fontSize: 26);

  TextStyle get headline3ExtraBold =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w800, fontSize: 24);

  TextStyle get headline3Bold =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w700, fontSize: 24);

  TextStyle get headline3Medium =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w500, fontSize: 24);

  TextStyle get headline3Regular =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w400, fontSize: 24);

  TextStyle get headline4ExtraBold =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w800, fontSize: 22);

  TextStyle get headline4Bold =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w700, fontSize: 22);

  TextStyle get headline4Medium =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w500, fontSize: 22);

  TextStyle get headline4Regular =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w400, fontSize: 22);

  TextStyle get headline5Bold =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w700, fontSize: 20);

  TextStyle get headline5Medium =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w500, fontSize: 20);

  TextStyle get headline5Regular =>
      TextStyle(color: Theme.of(this).colorScheme.titleText, fontWeight: FontWeight.w400, fontSize: 20);

  TextStyle get title1Bold =>
      TextStyle(color: Theme.of(this).colorScheme.mainText, fontWeight: FontWeight.w700, fontSize: 18);

  TextStyle get title1Medium =>
      TextStyle(color: Theme.of(this).colorScheme.mainText, fontWeight: FontWeight.w500, fontSize: 18);

  TextStyle get title1Regular =>
      TextStyle(color: Theme.of(this).colorScheme.mainText, fontWeight: FontWeight.w400, fontSize: 18);

  TextStyle get title2Bold =>
      TextStyle(color: Theme.of(this).colorScheme.mainText, fontWeight: FontWeight.w700, fontSize: 17);

  TextStyle get title2Medium =>
      TextStyle(color: Theme.of(this).colorScheme.mainText, fontWeight: FontWeight.w500, fontSize: 17);

  TextStyle get title2Regular =>
      TextStyle(color: Theme.of(this).colorScheme.mainText, fontWeight: FontWeight.w400, fontSize: 17);

  TextStyle get body1Bold =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w700, fontSize: 16);

  TextStyle get body1Medium =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w500, fontSize: 16);

  TextStyle get body1Regular =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w400, fontSize: 16);

  TextStyle get body2Bold =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w700, fontSize: 15);

  TextStyle get body2Medium =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w500, fontSize: 15);

  TextStyle get body2Regular =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w400, fontSize: 15);

  TextStyle get body3Bold =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w700, fontSize: 14);

  TextStyle get body3Medium =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w500, fontSize: 14);

  TextStyle get body3Regular =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w400, fontSize: 14);

  TextStyle get body4Bold =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w700, fontSize: 13);

  TextStyle get body4Medium =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w500, fontSize: 13);

  TextStyle get body4Regular =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w400, fontSize: 13);

  TextStyle get body5Bold =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w700, fontSize: 12);

  TextStyle get body5Medium =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w500, fontSize: 12);

  TextStyle get body5Regular =>
      TextStyle(color: Theme.of(this).colorScheme.subText, fontWeight: FontWeight.w400, fontSize: 12);
}

extension ColorSchemeExtension on ColorScheme {
  Color get primary => brightness == Brightness.light ? acs.primary.light : acs.primary.dark;


  Color get secondary => brightness == Brightness.light ? acs.secondary.light : acs.secondary.dark;

  Color get success => brightness == Brightness.light ? acs.success.light : acs.success.dark;

  Color get warning => brightness == Brightness.light ? acs.warning.light : acs.warning.dark;

  Color get link => brightness == Brightness.light ? acs.link.light : acs.link.dark;

  Color get error => brightness == Brightness.light ? acs.error.light : acs.error.dark;

  Color get mainBackground1 => brightness == Brightness.light ? acs.mainBackground1.light : acs.mainBackground1.dark;


  Color get dialogBackground => brightness == Brightness.light ? acs.dialogBackground.light : acs.dialogBackground.dark;

  Color get backAndCancelButtonBackground =>
      brightness == Brightness.light ? acs.backAndCancelButtonBackground.light : acs.backAndCancelButtonBackground.dark;

  Color get disableButtonBackground =>
      brightness == Brightness.light ? acs.disableButtonBackground.light : acs.disableButtonBackground.dark;

  Color get floatButtonBackground =>
      brightness == Brightness.light ? acs.floatButtonBackground.light : acs.floatButtonBackground.dark;

  Color get errorBackground => brightness == Brightness.light ? acs.errorBackground.light : acs.errorBackground.dark;

  Color get linkBackground => brightness == Brightness.light ? acs.linkBackground.light : acs.linkBackground.dark;

  Color get warningBackground =>
      brightness == Brightness.light ? acs.warningBackground.light : acs.warningBackground.dark;

  Color get successBackground =>
      brightness == Brightness.light ? acs.successBackground.light : acs.successBackground.dark;

  Color get mainText => brightness == Brightness.light ? acs.mainText.light : acs.mainText.dark;

  Color get subText => brightness == Brightness.light ? acs.subText.light : acs.subText.dark;

  Color get titleText => brightness == Brightness.light ? acs.titleText.light : acs.titleText.dark;

  Color get inputText => brightness == Brightness.light ? acs.inputText.light : acs.inputText.dark;

  Color get mainButtonText => brightness == Brightness.light ? acs.mainButtonText.light : acs.mainButtonText.dark;

  Color get disableButtonText =>
      brightness == Brightness.light ? acs.disableButtonText.light : acs.disableButtonText.dark;

  Color get backAndCancelButtonText =>
      brightness == Brightness.light ? acs.backAndCancelButtonText.light : acs.backAndCancelButtonText.dark;

  Color get floatButtonText => brightness == Brightness.light ? acs.floatButtonText.light : acs.floatButtonText.dark;

  Color get buttonBorder1 => brightness == Brightness.light ? acs.buttonBorder1.light : acs.buttonBorder1.dark;

  Color get buttonBorder2 => brightness == Brightness.light ? acs.buttonBorder2.light : acs.buttonBorder2.dark;

  Color get inputBorder => brightness == Brightness.light ? acs.inputBorder.light : acs.inputBorder.dark;

  Color get boxBorder => brightness == Brightness.light ? acs.boxBorder.light : acs.boxBorder.dark;

  Color get divider => brightness == Brightness.light ? acs.divider.light : acs.divider.dark;

  Color get hint => brightness == Brightness.light ? acs.hint.light : acs.hint.dark;

  Color get radioButton => brightness == Brightness.light ? acs.radioButton.light : acs.radioButton.dark;

  Color get dialogShadow => brightness == Brightness.light ? acs.dialogShadow.light : acs.dialogShadow.dark;

  Color get dialogIcon => brightness == Brightness.light ? acs.dialogIcon.light : acs.dialogIcon.dark;

  Color get selectIcon => brightness == Brightness.light ? acs.selectIcon.light : acs.selectIcon.dark;

  Color get actionBarIcon => brightness == Brightness.light ? acs.actionBarIcon.light : acs.actionBarIcon.dark;

  Color get darkBlue => brightness == Brightness.light ? acs.darkBlue.light : acs.darkBlue.dark;

  Color get plaqueBg => brightness == Brightness.light ? acs.plaqueBg.light : acs.plaqueBg.dark;

  Color get highContrast => brightness == Brightness.light ? Colors.black : Colors.white;
}