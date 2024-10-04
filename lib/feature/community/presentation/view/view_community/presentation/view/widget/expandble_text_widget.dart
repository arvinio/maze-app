import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;
  late TextPainter textPainter;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.subheadlineSubheadline;
    final effectiveStyle = textStyle;

    textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: effectiveStyle),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        textPainter.layout(maxWidth: constraints.maxWidth);

        if (textPainter.didExceedMaxLines) {
          const readMoreText = "...Read more";
          const showLessText = "Show less";
          final actionStyle =
              effectiveStyle.copyWith(color: context.scheme().primary);

          final actionWidth = TextPainter(
            text: TextSpan(text: readMoreText, style: actionStyle),
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: constraints.maxWidth);

          final threeLineHeight = textPainter.preferredLineHeight * 3;
          final truncatedEndIndex = textPainter
              .getPositionForOffset(
                Offset(
                    constraints.maxWidth - actionWidth.width, threeLineHeight),
              )
              .offset;

          return RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                    text: isExpanded
                        ? widget.text
                        : widget.text
                            .substring(0, truncatedEndIndex)
                            .trimRight(),
                    style: effectiveStyle),
                TextSpan(
                  text: isExpanded ? showLessText : readMoreText,
                  style: actionStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => setState(() => isExpanded = !isExpanded),
                ),
              ],
            ),
          );
        } else {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.text,
              style: effectiveStyle,
              textAlign: TextAlign.left,
            ),
          );
        }
      },
    );
  }
}
