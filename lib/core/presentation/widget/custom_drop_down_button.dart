import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import 'custom_text.dart';



typedef OnSelectCallback = Function(int position);

class CustomDropDownButton extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool enabled;
  final bool isLoading;
  final bool hasError;
  final Function? onError;
  final Color? borderColor;
  final Color? arrowColor;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final double? fontSizeTitle;
  final OnSelectCallback? onSelected;
  final VoidCallback? onDisablePressed;
  final VoidCallback? onArrowPressed;

  const CustomDropDownButton(
      {super.key, required this.title,
        this.items = const [],
        this.enabled = true,
        this.isLoading = false,
        this.hasError = false,
        this.onError,
        this.borderColor,
        this.arrowColor,
        this.suffixIcon,
        this.textStyle,
        this.onSelected,
        this.onDisablePressed,
        this.fontSizeTitle,
        this.onArrowPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDisablePressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 7),
              decoration: BoxDecoration(
                  color: context.scheme().neutralsFieldsTags,
                  border: Border.all(
                      color: borderColor ?? context.scheme().neutralsBorderDivider, width:Dimen.borderWidth ),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: isLoading
                        ? Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>( context.scheme().primary),
                      ),
                    )
                        : hasError
                        ? InkWell(
                        onTap: onError!(),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.refresh,
                              size: 24,
                              color:  context.scheme().primary,
                            )))
                        : InkWell(
                      onTap: onArrowPressed,
                      child: Container(
                          padding: const EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
                          child: suffixIcon
                      ),
                    ),
                    hint: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child:  (onSelected == null ) ?CustomText(
                       title,
                        style: textStyle ??context.bodyBody.copyWith(color: context.scheme().secondaryText),
                      )
                      :
                        ListTile(title: CustomText(title),
                    subtitle:CustomText('t') ,),
                    ),
                    isExpanded: true,
                    items: enabled
                        ? items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(child: ListTile(title: CustomText(title),
                          subtitle:CustomText(value) ,)),
                      );
                    }).toList()
                        : null,
                    onChanged: (String? item) {
                      if (onSelected != null && item!=null) {
                        onSelected!(items.indexOf(item));
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
