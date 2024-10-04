import 'package:flutter/material.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import '../../config/dimen.dart';
import 'custom_text.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    this.isSelected = false,
    this.isInputInValid = false,
    this.errorText = '',
    this.isEnabled = true,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final bool isEnabled;
  final bool isInputInValid;
  final String errorText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(Dimen.inputRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Dimen.textFieldHeight,
              padding: const EdgeInsets.only(right: 16, left: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimen.inputRadius),
                border: Border.all(
                    width: Dimen.borderWidth,
                    color: isInputInValid
                        ? context.scheme().error
                        : context.scheme().neutralsBorderDivider),
              ),
              child: Center(
                child: Row(
                  children: [
                    CustomText(
                      title,
                      style: context.bodyBody.copyWith(
                          color: isSelected && isEnabled
                              ? context.scheme().primaryText
                              : context.scheme().disabledText),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.expand_more,
                      color: isSelected && isEnabled
                          ? context.scheme().expandMoreDropDown
                          : context.scheme().selectIconDropDown,
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: errorText.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(top: 6, right: 16),
                child: CustomText(errorText,
                    style: context.bodyBody.copyWith(
                      color: context.scheme().error,
                      height: 1,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
