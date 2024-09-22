import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class FeedFilterWidget extends StatefulWidget {
  FeedFilterWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isChecked,
  });
  final String subTitle;
  final String title;
  bool isChecked;

  @override
  State<FeedFilterWidget> createState() => _FeedFilterWidgetState();
}

class _FeedFilterWidgetState extends State<FeedFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(widget.title),
      subtitle: CustomText(widget.subTitle),
      trailing: Checkbox(
        value: widget.isChecked,
        onChanged: (value) {
          setState(() {
            widget.isChecked = value!;
          });
        },
      ),
    );
  }
}
