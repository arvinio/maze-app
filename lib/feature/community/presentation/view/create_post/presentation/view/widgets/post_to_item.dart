import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

class PostToItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  void Function()? onTap;

   PostToItem({
    super.key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildLeading(context),
      title: CustomText(title, style: context.bodyBody),
      subtitle: subtitle != null ?
      CustomText(
        subtitle!, style: context.footnoteFootnote.copyWith(color: context
          .scheme()
          .secondaryText),) : null,
      onTap: onTap
    );
  }

  Widget _buildLeading(BuildContext context) {
    return imageUrl != null
        ? Container(
        padding: const EdgeInsets.all(30),
        width: 40, height: 40,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: context
                .scheme()
                .neutralsBorderDivider),
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            image: DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover)))
        : CircleAvatar(
      backgroundColor: context
          .scheme()
          .neutralsBorderDivider,
      child: Icon(Icons.group, color: context
          .scheme()
          .neutralsBackground),
    );
  }
}
