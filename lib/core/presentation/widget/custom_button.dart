
import 'package:flutter/material.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import '../../config/dimen.dart';
import 'custom_text.dart';

enum ButtonType {
  submit,
  cancel,
  outline;

  bool get isSubmit => this == ButtonType.submit;

  bool get isCancel => this == ButtonType.cancel;

  bool get isOutline => this == ButtonType.outline;
}

class CustomButton extends StatefulWidget {
  const CustomButton.submit({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isFullWidth = true,
    this.showLoading = false,
    this.minSize = Dimen.buttonMinHeight,
    this.textFontSize,
    this.textFontWeight = FontWeight.w600,
    this.enabled = true,
    this.borderRadius = Dimen.defaultRadius,
    this.borderSize = Dimen.borderWidth,
    required this.onPressed,
    this.leftArrow = false,
    this.rightArrow = false,
    this.icon,
    this.iconSize,
    this.horizontalPadding,
  })  : _buttonType = ButtonType.submit,
        borderColor = null;

  const CustomButton.cancel({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isFullWidth = true,
    this.showLoading = false,
    this.minSize = Dimen.buttonMinHeight,
    this.textFontSize,
    this.textFontWeight = FontWeight.w600,
    this.enabled = true,
    this.borderRadius = Dimen.defaultRadius,
    this.borderSize = Dimen.borderWidth,
    required this.onPressed,
    this.icon,
    this.iconSize,
    this.horizontalPadding,
  })  : _buttonType = ButtonType.cancel,
        borderColor = null,
        leftArrow = false,
        rightArrow = false;

  const CustomButton.outline({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.isFullWidth = true,
    this.showLoading = false,
    this.minSize = Dimen.buttonMinHeight,
    this.textFontSize,
    this.textFontWeight = FontWeight.w600,
    this.enabled = true,
    this.borderRadius = Dimen.defaultRadius,
    this.borderSize = Dimen.borderWidth,
    this.icon,
    this.iconSize,
    this.horizontalPadding,
    required this.onPressed,
  })  : _buttonType = ButtonType.outline,
        leftArrow = false,
        rightArrow = false;

  final ButtonType _buttonType;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final bool isFullWidth;
  final bool showLoading;
  final double minSize;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final bool enabled;
  final double borderRadius;
  final double borderSize;
  final VoidCallback onPressed;
  final bool leftArrow;
  final bool rightArrow;
  final Widget? icon;
  final double? iconSize;
  final double? horizontalPadding;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Widget button = Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius:
            BorderRadius.circular(widget._buttonType.isOutline ? widget.borderRadius : widget.borderRadius - 2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: _getBackgroundColor(context).withOpacity(0.1),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          enableFeedback: false,
          // disabledColor: ,
          onTap: (widget.showLoading || !widget.enabled) ? null : widget.onPressed,
          child: SizedBox(
            height: widget.minSize,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? (widget.isFullWidth ? 0 : 32)),
                  child: Row(
                    mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: widget.icon != null && !widget.showLoading,
                        child: SizedBox(
                          width: widget.iconSize ?? 40,
                          height: widget.iconSize ?? 40,
                          child: widget.icon ?? Container(),
                        ),
                      ),
                      widget.showLoading
                          ? Center(
                              child:  CustomText('laoding... '),
                            )
                          : Center(
                              child: CustomText(
                                widget.text,
                                textAlign: TextAlign.center,
                                style: context.titleHeadline.copyWith(
                                  color: _getTextColor(context),
                                  fontSize: widget.textFontSize,
                                  fontWeight: widget.textFontWeight,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.leftArrow,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Visibility(
                      visible: !widget.showLoading,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_forward, size: 24, color: _getTextColor(context)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.rightArrow,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Visibility(
                      visible: !widget.showLoading,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.west, size: 23, color: _getTextColor(context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    button = Container(
      height: widget.minSize + 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          width: widget.borderSize,
          color: widget._buttonType.isOutline ? _getBorderColor(context) : _getBackgroundColor(context),
        ),
      ),
      child: button,
    );

    return widget.isFullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  Color _getBackgroundColor(BuildContext context) {
    if (!widget.enabled && !widget.showLoading) {
      return _getDisableBackgroundColor(context);
    }
    return widget.backgroundColor ??
        (widget._buttonType.isSubmit
            ? Theme.of(context).colorScheme.primary
            : widget._buttonType.isCancel
                ? Theme.of(context).colorScheme.neutralsFieldsTags
                : Theme.of(context).colorScheme.neutralsBackground);
  }

  Color _getDisableBackgroundColor(BuildContext context) {
    return widget.showLoading
        ? _getBackgroundColor(context)
        : widget._buttonType.isOutline
            ? context.scheme().neutralsBackground
            : Theme.of(context).colorScheme.disableButtonBackground;
  }

  Color _getTextColor(BuildContext context) {
    return widget.textColor ??
        (!widget.enabled
            ? Theme.of(context).colorScheme.disabledText
            : widget._buttonType.isSubmit
                ? context.scheme().whiteText
                : widget._buttonType.isCancel
                    ? Theme.of(context).colorScheme.disabledText
                    : Theme.of(context).primaryColor);
  }

  Color _getBorderColor(BuildContext context) {
    return widget.borderColor ?? context.scheme().neutralsBorderDivider;
  }
}
