import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
class TextFieldBottomSheet extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final Color? fillColor;
  final Color? textColor;
  final bool enabled;
  final bool isInputValid;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final int? maxLength;
  final double fontSize;
  final double? lineHeight;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextDirection textDirection;
  final bool hasBorder;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool setLeftPaddingMatchToRequiredField;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final EdgeInsets? padding;

  const TextFieldBottomSheet(
      {super.key, this.label,
        this.hint,
        this.errorText,
        this.fillColor,
        this.textColor,
        this.focusNode,
        this.enabled = true,
        this.isInputValid = true,
        this.textEditingController,
        this.keyboardType = TextInputType.text,
        this.maxLength,
        this.suffixIcon,
        this.prefixIcon,
        this.fontSize = Dimen.textBottomSheetContent,
        this.textDirection = TextDirection.rtl,
        this.hasBorder = false,
        this.setLeftPaddingMatchToRequiredField = false,
        this.padding,
        this.lineHeight,
        this.textAlign,
        this.textAlignVertical,
        this.inputFormatters,
        this.onChanged});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.bodyCallout.copyWith(color: context.scheme().disabledText);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Directionality(
              textDirection: textDirection,
              child: TextField(
                  controller: textEditingController,
                  enabled: enabled,
                  focusNode: focusNode,
                  keyboardAppearance: Theme.of(context).brightness,
                  maxLines: keyboardType == TextInputType.multiline ? 3 : 1,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  style:  context.bodyBodyMedium.copyWith(color: context.scheme().neutralsBorderDivider),
                  scrollPadding: const EdgeInsets.all(80.0),
                  maxLength: maxLength,
                  onChanged: onChanged,
                  textAlign: textAlign ?? TextAlign.start,
                  textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
                  decoration: InputDecoration(
                      fillColor: fillColor ?? context.scheme().neutralsFieldsTags,
                      isDense: true,
                      prefixIconConstraints: const BoxConstraints(minHeight: 8, minWidth: 8),
                      contentPadding: padding,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hasBorder ? context.scheme().neutralsBorderDivider : Colors.transparent,
                              width: Dimen.borderWidth),
                          borderRadius: BorderRadius.circular(100.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hasBorder ? context.scheme().neutralsBorderDivider : Colors.transparent,
                              width: Dimen.borderWidth),
                          borderRadius: BorderRadius.circular(100.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hasBorder ? Theme.of(context).primaryColor : Colors.transparent,
                              width: Dimen.borderWidth),
                          borderRadius: BorderRadius.circular(100.0)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hasBorder ? context.scheme().neutralsBorderDivider : Colors.transparent, width: Dimen.borderWidth),
                          borderRadius: BorderRadius.circular(100.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: hasBorder ?Colors.red : Colors.transparent, width: Dimen.borderWidth),
                          borderRadius: BorderRadius.circular(100.0)),
                      suffixIcon: suffixIcon,
                      prefixIcon: prefixIcon,
                      labelText: label,
                      labelStyle: textStyle,
                      hintText: hint,
                      hintStyle: textStyle.copyWith(color: context.scheme().secondaryText),
                      errorText: isInputValid ? null : errorText,
                      errorStyle:context.bodyCallout.copyWith(
                        color: context.scheme().error,
                        height: 1.6,
                      ),
                      errorMaxLines: 2,
                      counterText: '',
                      alignLabelWithHint: true))),
        ),
      ],
    );
  }
}
