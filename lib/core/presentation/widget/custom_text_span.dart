import 'package:flutter/material.dart';

class CustomTextSpan extends TextSpan {
  final String textData;

  CustomTextSpan({
    required this.textData,
    super.children,
    super.style,
    super.recognizer,
    super.mouseCursor,
    super.onEnter,
    super.onExit,
    super.semanticsLabel,
    super.locale,
    super.spellOut,
  }) : super(text: textData);
}
