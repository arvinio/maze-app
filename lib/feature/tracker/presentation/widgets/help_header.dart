import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';

class HelpHeader extends StatelessWidget {
  const HelpHeader({
    super.key, this.leadingIcon, this.padding
  });

  final Widget? leadingIcon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: leadingIcon!,
        ),
          TextButton(child: CustomText(appStrings.help,
              style: context.titleHeadline.copyWith(color: context
                  .scheme()
                  .primary)),
              onPressed: () {
                ShowDialog.needHelpContent(context);
              })
        ]);
  }
}
