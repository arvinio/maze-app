import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class CustomListTileMenus extends StatefulWidget {
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final double? indent;
  final double? endIndent;
  final int? itemCount;
  const CustomListTileMenus({super.key, this.title, this.leading, this.trailing, this.indent, this.endIndent, this.itemCount});

  @override
  State<CustomListTileMenus> createState() => _CustomListTileMenusState();
}

class _CustomListTileMenusState extends State<CustomListTileMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(  decoration: BoxDecoration(
      color: context
          .scheme()
          .neutralsBackground,
      border: Border.all(color: context
          .scheme()
          .neutralsBorderDivider),
      borderRadius: const BorderRadius.all(
          Radius.circular(Dimen.defaultRadius)),
    ),
      child: ListView.separated(

        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: CustomText(
                widget.title!,
                style: context.bodyBody),
            leading: SizedBox(width: 24,
                height: 64,
                child:widget.leading! ),
            trailing: SizedBox(width: 24,
                height: 64,
                child: widget.trailing!),
            contentPadding: const EdgeInsets.all( 10),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return   Divider(color: context.scheme().neutralsBorderDivider,indent: widget.indent,endIndent:widget.endIndent ,);

        },
        itemCount: widget.itemCount!,


      ),
    );
  }
}

