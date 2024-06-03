import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../di/injection_container.dart';

class AppColor{

  const AppColor({required this.light, required this.dark});

  final Color light;
  final Color dark;

}


///======================= Base =======================
abstract class AppColorsBase {
  /// Main ///

  AppColor get primary;

  AppColor get secondary;

  AppColor get success => const AppColor(light:  Color(0xFF00A56E), dark: Color(0xFF5CCCAB));

  AppColor get warning => const AppColor(light: Color(0xFFF86F03), dark: Color(0xFFFFA761));

  AppColor get link => const AppColor(light: Color(0xff0084FF), dark: Color(0xff83BCF1));

  AppColor get error => const AppColor(light: Color(0xffFF0000), dark: Color(0xffFA8378));

  /// Background ///
  AppColor get mainBackground1 => const AppColor(light: Color(0xffFFFFFF), dark: Color(0xff202123));

  AppColor get dialogBackground => const AppColor(light: Color(0xffFFFFFF), dark: Color(0xff28292D));

  AppColor get backAndCancelButtonBackground => const AppColor(light: Color(0xffF1F1F1), dark: Color(0xff38393C));

  AppColor get disableButtonBackground => const AppColor(light: Color(0xffF2F2F2), dark: Color(0xff303134));

  AppColor get floatButtonBackground;

  AppColor get errorBackground => const AppColor(light: Color(0xffFFEBEB), dark: Color(0xff31292A));

  AppColor get linkBackground => const AppColor(light: Color(0xffEBF5FF), dark: Color(0xff282D33));

  AppColor get warningBackground => const AppColor(light: Color(0xffFEF3EB), dark: Color(0xff402D1E));

  AppColor get successBackground => const AppColor(light: Color(0xffE0F4EE), dark: Color(0xff252F2E));

  /// Text ///
  AppColor get mainText => const AppColor(light: Color(0xff464646), dark: Color(0xffCCCCCC));

  AppColor get subText => const AppColor(light: Color(0xff757575), dark: Color(0xff979797));

  AppColor get titleText => const AppColor(light: Color(0xff1C1C1E), dark: Color(0xffF0F0F0));

  AppColor get inputText => const AppColor(light: Color(0xff1C1C1E), dark: Color(0xffF0F0F0));

  AppColor get mainButtonText => const AppColor(light: Color(0xffFFFFFF), dark: Color(0xff202123));

  AppColor get disableButtonText => const AppColor(light: Color(0xff979797), dark: Color(0xff979797));

  AppColor get backAndCancelButtonText => const AppColor(light: Color(0xff1C1C1E), dark: Color(0xffF0F0F0));

  AppColor get floatButtonText => const AppColor(light: Color(0xff1C1C1E), dark: Color(0xff202123));

  /// Border ///
  AppColor get buttonBorder1 => const AppColor(light: Color(0xff979797), dark: Color(0xff979797));

  AppColor get buttonBorder2 => const AppColor(light: Color(0xffCDCDCD), dark: Color(0xff5E5F60));

  AppColor get inputBorder => const AppColor(light: Color(0xffBEBEBE), dark: Color(0xff979797));

  AppColor get boxBorder => const AppColor(light: Color(0xff757575), dark: Color(0xff757575));

  /// Other ///
  AppColor get divider => const AppColor(light: Color(0xffD8D8D8), dark: Color(0xff4C4C4C));

  AppColor get hint => const AppColor(light: Color(0xff878787), dark: Color(0xffAFAFAF));

  AppColor get radioButton => const AppColor(light: Color(0xff979797), dark: Color(0xff979797));

  AppColor get dialogShadow => AppColor(light: Colors.black.withOpacity(0.4), dark: Colors.black.withOpacity(0.72));

  AppColor get dialogIcon => const AppColor(light: Color(0xff4c4c4c), dark: Color(0xff979797));

  AppColor get selectIcon => const AppColor(light: Color(0xff979797), dark: Color(0xff979797));

  AppColor get actionBarIcon => const AppColor(light: Color(0xFF1C1C1E), dark: Color(0xFFDFDFDF));

  AppColor get darkBlue => const AppColor(light: Color(0xFF1A65C9), dark: Color(0xFF1A65C9));

  AppColor get plaqueBg => const AppColor(light: Color(0xFFDCFAE2), dark: Color(0xFFAACDB4));
}

///======================= Dev =======================
@LazySingleton(as: AppColorsBase, env: ['dev'])
class AppColors extends AppColorsBase {
  @override
  AppColor get primary => const AppColor(light: Color(0xff84BD00), dark: Color(0xffBCD67F));

  @override
  AppColor get secondary => const AppColor(light: Color(0xffF5AF00), dark: Color(0xffEBC870));

  @override
  AppColor get floatButtonBackground => const AppColor(light: Color(0xffDFFC9C), dark: Color(0xffCCDF9F));

  @override
  AppColor get success => primary;

  @override
  AppColor get successBackground => const AppColor(light: Color(0xffF5FAEB), dark: Color(0xff2E312B));
}

/// acs = App color s
AppColorsBase acs = inject<AppColorsBase>();