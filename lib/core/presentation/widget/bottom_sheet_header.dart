import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import 'custom_text.dart';

class BottomSheetHeader extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? icon;
  final Widget? closeIcon;
  final Function? onClosePressed;
  final bool showDivider;
  final bool isNumericTitle;
  final bool showHandler;
  final TextDirection? textDirection;

  const BottomSheetHeader({
    Key? key,
    required this.title,
    this.icon,
    this.onClosePressed,
    this.showHandler = false,
    this.closeIcon,
    this.showDivider = true,
    this.isNumericTitle = false,
    this.textDirection, this.subTitle,
  }) : super(key: key);

  const BottomSheetHeader.withHandler({
    Key? key,
    this.showHandler = true,
    this.title,
    this.icon,
    this.closeIcon,
    this.onClosePressed,
    this.showDivider = false,
    this.isNumericTitle = false,
    this.textDirection, this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showHandler
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 16),
          height: 4,
          width: 38,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: context.scheme().neutralsBorderDivider,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
        Visibility(
          visible: title != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 14),
            child: CustomText(
              title ?? '',
              style: context.titleTitle3,
              textDirection: textDirection,
            ),
          ),
        ),
        Visibility(
          visible: subTitle != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 14),
            child: CustomText(
              subTitle ?? '',
              style: context.bodyBody.copyWith(color: context.scheme().tertiaryText),
              textDirection: textDirection,
            ),
          ),
        ),
        Visibility(
          visible: showDivider,
          child: Column(
            children: [
              Divider(
                height: 1,
                thickness: 1,
                color: Theme.of(context).dividerColor,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    )
        : Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: icon,
                  ),
                if (icon != null)
                  const SizedBox(
                    width: 12,
                  ),
                isNumericTitle
                    ? Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: CustomText(
                          title ?? '',
                          style: context.titleTitle1,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                )
                    :
                const SizedBox(
                  width: 6,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
                    onTap: () {
                      if (onClosePressed != null) {
                        onClosePressed;
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10, bottom: 6),
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 38),
                        child: Center(
                            child: closeIcon /*?? //todo ad close icon later
                              as.icEdit.svg(color: context.scheme().mainBackground1),*/
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomText(
                        title ?? '',
                        style: context.titleHeadline,textAlign: TextAlign.center
                    ),
                  ),
                ),

              ],
            ),
          ),
          Visibility(
            visible: showDivider,
            child: Divider(
              height: 3,
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
