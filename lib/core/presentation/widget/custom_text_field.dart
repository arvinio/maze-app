import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import '../../config/dimen.dart';
import 'custom_outline_input_border.dart';
import 'custom_text.dart';

enum TextFieldType {
  borderLess,
  outline;

  bool get isBorderLess => this == TextFieldType.borderLess;

  bool get isOutline => this == TextFieldType.outline;
}

class CustomTextField extends StatefulWidget {
  const CustomTextField.borderLess(
      {super.key,
      this.textEditingController,
      this.label,
      this.labelTextColor,
      this.labelStyle,
      this.hint,
      this.bottomText,
      this.textColor,
      this.hintColor,
      this.textFontSize,
      this.textHeight,
      this.hintFontSize,
      this.textWeight,
      this.borderColor,
      this.borderWidth,
      this.bottomTextColor,
      this.enabled = true,
      this.isInputInValid = false,
      this.isInputValid = false,
      this.obscureText = false,
      this.autoFocus = false,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.maxLength,
      this.maxLines,
      this.focusNode,
      this.prefix,
      this.suffix,
      this.suffixIcon,
      this.prefixIcon,
      this.textAlign,
      this.textDirection = TextDirection.ltr,
      this.hintDirection = TextDirection.ltr,
      this.isRequired = false,
      this.setLeftPaddingMatchToRequiredField = false,
      this.inputFormatters,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.padding,
      this.mainPadding,
      this.textAlignVertical,
      this.expands,
      this.textStyle,
      this.minLines,
      this.isOnlyNumeric = false,
      this.isTextFieldPassword = false,
      this.isShowSwitchKeyboardType = true,
      this.showBiometrics = false,
      this.onBiometricsTap,
      this.toggleKeyboardModeValueNotifier,
      this.obscureState,
      this.isShowToggleObscureVisibility = false,
      this.reloadStateController,
      this.readOnly = false})
      : _textFieldType = TextFieldType.borderLess,
        borderRadius = null;

  const CustomTextField.outline({
    super.key,
    this.textEditingController,
    this.label,
    this.labelTextColor,
    this.labelStyle,
    this.hint,
    this.bottomText,
    this.textColor,
    this.hintColor,
    this.textFontSize,
    this.textHeight,
    this.hintFontSize,
    this.textWeight,
    this.borderColor,
    this.borderWidth,
    this.bottomTextColor,
    this.enabled = true,
    this.isInputInValid = false,
    this.isInputValid = false,
    this.obscureText = false,
    this.autoFocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.maxLength,
    this.maxLines,
    this.focusNode,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.prefixIcon,
    this.textAlign,
    this.textDirection = TextDirection.ltr,
    this.hintDirection = TextDirection.ltr,
    this.isRequired = false,
    this.setLeftPaddingMatchToRequiredField = false,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.padding,
    this.mainPadding,
    this.borderRadius,
    this.textAlignVertical,
    this.expands,
    this.textStyle,
    this.minLines,
    this.isOnlyNumeric = false,
    this.readOnly = false,
    this.showBiometrics = false,
    this.isTextFieldPassword = false,
    this.isShowSwitchKeyboardType = true,
    this.onBiometricsTap,
    this.toggleKeyboardModeValueNotifier,
    this.obscureState,
    this.isShowToggleObscureVisibility = false,
    this.reloadStateController,
  }) : _textFieldType = TextFieldType.outline;

  final TextFieldType _textFieldType;
  final TextEditingController? textEditingController;
  final String? label;
  final Color? labelTextColor;
  final TextStyle? labelStyle;
  final String? hint;
  final String? bottomText;
  final Color? textColor;
  final Color? hintColor;
  final double? textFontSize;
  final double? textHeight;
  final double? hintFontSize;
  final FontWeight? textWeight;
  final Color? borderColor;
  final double? borderWidth;
  final Color? bottomTextColor;
  final bool enabled;
  final bool isInputInValid;
  final bool isInputValid;
  final bool obscureText;
  final bool autoFocus;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final TextDirection textDirection;
  final TextDirection hintDirection;
  final bool isRequired;
  final bool setLeftPaddingMatchToRequiredField;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final EdgeInsets? padding;
  final EdgeInsets? mainPadding;
  final double? borderRadius;
  final bool readOnly;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final int? minLines;
  final TextStyle? textStyle;
  final bool isOnlyNumeric;
  final bool isTextFieldPassword;
  final bool isShowSwitchKeyboardType;
  final bool showBiometrics;
  final VoidCallback? onBiometricsTap;
  final ValueNotifier<bool>? toggleKeyboardModeValueNotifier;
  final ValueNotifier<bool>? obscureState;
  final bool isShowToggleObscureVisibility;

  final ReloadStateController? reloadStateController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class ReloadStateController {
  late Function(String) onChanged;
}

class _CustomTextFieldState extends State<CustomTextField> {
  String text = '';
  bool _isVisibleTextContent = false;
  int? cursorIndex;


  @override
  void initState() {
    cursorIndex = widget.textEditingController?.text.length ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.isRequired || widget.setLeftPaddingMatchToRequiredField)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 4),
                    child: CustomText(
                      widget.isRequired ? '*' : ' ',
                      style: context.subheadlineSubheadlineMedium
                          .copyWith(color: context.scheme().error, fontSize: Dimen.iconSmallSize),
                    ),
                  ),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TextField(
                            readOnly: widget.readOnly,
                            controller: widget.textEditingController,
                            enabled: widget.enabled,
                            focusNode: widget.focusNode,
                            obscureText: widget.isTextFieldPassword ? (!_isVisibleTextContent) : widget.obscureText,
                            keyboardAppearance: Theme.of(context).brightness,
                            inputFormatters: widget.inputFormatters,
                            scrollPadding: const EdgeInsets.all(0.0),
                            maxLength: widget.maxLength,
                            keyboardType:widget.keyboardType,
                            maxLines: widget.expands == true
                                ? null
                                : widget.maxLines ?? (widget.keyboardType == TextInputType.multiline ? 3 : 1),
                            minLines: widget.minLines,
                            expands: widget.expands ?? false,
                            autofocus: widget.autoFocus,
                            style: widget.textStyle ??
                                context.bodyBody.copyWith(
                                  color: widget.textColor ?? context.scheme().primaryText,
                                  height: widget.textHeight ?? 1.5,
                                ),
                            onTap: () {
                              if (widget.textEditingController != null) {
                                if (widget.textEditingController!.selection ==
                                    TextSelection.fromPosition(
                                        TextPosition(offset: widget.textEditingController!.text.length - 1))) {
                                  setState(() {
                                    widget.textEditingController!.selection = TextSelection.fromPosition(
                                        TextPosition(offset: widget.textEditingController!.text.length));
                                  });
                                }
                              }
                              widget.onTap?.call();
                            },
                            textInputAction: widget.textInputAction,
                            onEditingComplete: widget.onEditingComplete,
                            textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
                            textDirection: TextDirection.ltr,
                          //  onChanged: onChanged,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              contentPadding: widget.padding ?? const EdgeInsets.only(top: 5, bottom: 16, right: 16, left: 16),
                              border: widget._textFieldType.isBorderLess
                                  ? InputBorder.none
                                  : getBorder(BorderType.regularBorder),
                              enabledBorder: widget._textFieldType.isBorderLess
                                  ? InputBorder.none
                                  : getBorder(BorderType.enabledBorder),
                              disabledBorder: widget._textFieldType.isBorderLess
                                  ? InputBorder.none
                                  : getBorder(BorderType.disabledBorder),
                              focusedBorder: widget._textFieldType.isBorderLess
                                  ? InputBorder.none
                                  : getBorder(BorderType.focusedBorder),
                              errorBorder: widget._textFieldType.isBorderLess
                                  ? InputBorder.none
                                  : getBorder(BorderType.errorBorder),
                              focusedErrorBorder: widget._textFieldType.isBorderLess
                                  ? InputBorder.none
                                  : getBorder(BorderType.focusedErrorBorder),
                              prefix: widget.prefix,
                              suffix: widget.suffix,
                              prefixIcon: widget.prefixIcon,
                              labelText: widget.label,
                              labelStyle:widget.labelStyle??
                                  context.bodyBody.copyWith(
                                    color:(widget.focusNode!=null && widget.focusNode!.hasFocus)
                                      ?context.scheme().primary
                                      :widget.labelTextColor?? context.scheme().primaryText
                                  ),
                              hintText: widget.hint,
                              fillColor:  (widget.focusNode!=null && widget.focusNode!.hasFocus)
                             ? context.scheme().primariesShade03
                             : context.scheme().neutralsFieldsTags,
                              filled: true,
                              isDense: true,
                              hintStyle: context.bodyCallout.copyWith(
                                color: widget.hintColor ?? context.scheme().disabledText,
                              ),
                              errorStyle: const TextStyle(height: 0.001, color: Colors.transparent),
                              errorText: widget.isInputInValid ? widget.bottomText : null,
                              // errorStyle: context.body4Regular.copyWith(
                              //   color: widget.bottomTextColor ?? context.scheme().error,
                              //   height: widget.textHeight ?? 1.6,
                              // ),
                              errorMaxLines: 1,
                              counterText: '',
                              suffixIcon: widget.isTextFieldPassword &&
                                      (widget.obscureState == null || widget.isShowToggleObscureVisibility)
                                  ? (text.isNotEmpty)
                                      ? (Container(
                                          margin: const EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: InkWell(
                                            onTap: _toggleVisibility,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                left: 12,
                                                right: 12,
                                              ),
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              child: Icon(
                                                _isVisibleTextContent
                                                    ? Icons.visibility_off_outlined
                                                    : Icons.visibility_outlined,
                                                color: context.scheme().disabledText,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ))
                                      : Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            (widget.isOnlyNumeric ||
                                                    !widget.isShowSwitchKeyboardType ||
                                                    widget.toggleKeyboardModeValueNotifier != null)
                                                ? const SizedBox(
                                                    height: 30,
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                     // _toggleKeyboardMode();
                                                    },
                                                    child: Container(
                                                        width: 24,
                                                        height: 24,
                                                        margin: EdgeInsets.only(
                                                            top: 14,
                                                            bottom: 14,
                                                            left: (widget.showBiometrics ? 9 : 18),
                                                            right: 9),
                                                        child: Center(
                                                          child: SizedBox(
                                                            height: 24,
                                                            width: 24,
                                                            child: Icon(
                                                                Icons.dialpad,
                                                                color: context.scheme().disabledText,
                                                                size: 24),
                                                          ),
                                                        )),
                                                  ),
                                            (widget.showBiometrics)
                                                ? Container(
                                                    margin: const EdgeInsets.only(left: 8),
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (widget.onBiometricsTap != null) {
                                                          widget.onBiometricsTap!();
                                                        }
                                                      },
                                                      child: Container(
                                                          width: 24,
                                                          margin: const EdgeInsets.only(
                                                              top: 15, bottom: 15, left: 8, right: 9),
                                                          height: 24,
                                                          child: Center(
                                                            child: SizedBox(
                                                              height: 24,
                                                              width: 24,
                                                              child: Icon(
                                                                Icons.fingerprint,
                                                                color: context.scheme().disabledText,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        )
                                  : widget.suffixIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: widget.isInputInValid || widget.isInputValid,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Icon(widget.isInputInValid ? Icons.info_outline : Icons.check_circle_outline,
                          size: 18,
                          color: widget.isInputInValid
                              ? context.scheme().error
                              : context.scheme().success),
                      const SizedBox(
                        width: 6,
                      ),
                      CustomText(
                        widget.bottomText ?? '',
                        style: context.bodyCallout.copyWith(
                          color: widget.bottomTextColor ?? context.scheme().error,
                          height: widget.textHeight ?? 1.6,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }

  _toggleVisibility() {
    setState(() {
      _isVisibleTextContent = !_isVisibleTextContent;
    });
  }

  getBorder(BorderType type) {
    var borderColor = context.scheme().neutralsBorderDivider;
    var width = Dimen.borderWidthTextField;
    switch (type) {
      case BorderType.regularBorder:
        borderColor = context.scheme().neutralsBorderDivider;
        break;
      case BorderType.enabledBorder:
        borderColor = context.scheme().neutralsBorderDivider;
        break;
      case BorderType.focusedBorder:
        borderColor = context.scheme().primary;
        width = Dimen.selectedBorderWidth;
        break;
      case BorderType.errorBorder:
        borderColor = context.scheme().error;

        break;
      case BorderType.focusedErrorBorder:
        borderColor = context.scheme().error;
        width = Dimen.selectedBorderWidth;

        break;
      case BorderType.disabledBorder:
        borderColor = context.scheme().neutralsBorderDivider;
        break;
    }
    return CustomOutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        borderSide: BorderSide(color: widget.borderColor ?? borderColor, width: widget.borderWidth ?? width),
       );

    /* OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? borderColor, width: widget.borderWidth ?? width),
        borderRadius: BorderRadius.circular(Dimen.defaultRadius));*/
  }


}
enum BorderType { regularBorder, enabledBorder, disabledBorder, focusedBorder, errorBorder, focusedErrorBorder }
