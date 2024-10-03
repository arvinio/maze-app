import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/di/injection_container.dart';

class AppColor {
  const AppColor({required this.light, required this.dark});

  final Color light;
  final Color dark;
}

@LazySingleton()
class AppColorsBase {
//main
  AppColor get primary =>
      const AppColor(light: Color(0xff5AA700), dark: Color(0xff5AA700));

  AppColor get primariesShade01 =>
      const AppColor(light: Color(0xff3F7500), dark: Color(0xff3F7500));

  AppColor get primariesShade02 =>
      const AppColor(light: Color(0xffEEF6E5), dark: Color(0xffEEF6E5));

  AppColor get primariesShade03 =>
      const AppColor(light: Color(0xffF7FBF2), dark: Color(0xffF7FBF2));

//sementics
  AppColor get success =>
      const AppColor(light: Color(0xFF45D35F), dark: Color(0xFF45D35F));

  AppColor get info =>
      const AppColor(light: Color(0xff2179FF), dark: Color(0xff2179FF));

  AppColor get warning =>
      const AppColor(light: Color(0xFFFFC507), dark: Color(0xFFFFC507));

  AppColor get error =>
      const AppColor(light: Color(0xffDD2541), dark: Color(0xffDD2541));

  // text
  AppColor get primaryText =>
      const AppColor(light: Color(0xff001543), dark: Color(0xff001543));

  AppColor get secondaryText =>
      const AppColor(light: Color(0xff405072), dark: Color(0xff405072));

  AppColor get tertiaryText =>
      const AppColor(light: Color(0xff7F8AA1), dark: Color(0xff7F8AA1));

  AppColor get disabledText =>
      const AppColor(light: Color(0xffCCD0D9), dark: Color(0xffCCD0D9));

  AppColor get whiteText =>
      const AppColor(light: Color(0xffFFFFFF), dark: Color(0xffFFFFFF));

  // Neutrals
  AppColor get neutralsBackground =>
      const AppColor(light: Color(0xffFFFFFF), dark: Color(0xffFFFFFF));

  AppColor get neutralsCards =>
      const AppColor(light: Color(0xffFFFFFF), dark: Color(0xffFFFFFF));

  AppColor get neutralsFieldsTags =>
      const AppColor(light: Color(0xffF2F3F5), dark: Color(0xffF2F3F5));

  AppColor get neutralsBorderDivider =>
      const AppColor(light: Color(0xff000000), dark: Color(0xff000000));

  AppColor get dividerColor =>
      const AppColor(light: Color(0x14000000), dark: Color(0x14ffffff));

  AppColor get mainBackground =>
      const AppColor(light: Color(0xffFFFFFF), dark: Color(0xff202123));

  //DropDown

  AppColor get expandMoreDropDown =>
      const AppColor(light: Color(0xff252729), dark: Color(0xff252729));

  AppColor get selectIconDropDown =>
      const AppColor(light: Color(0xFFB4B4B4), dark: Color(0xFF8C8C8C));

  //progressbar
  AppColor get progress =>
      const AppColor(light: Color(0xFFF18A00), dark: Color(0xFFF18A00));
}

AppColorsBase appColors = inject<AppColorsBase>();
