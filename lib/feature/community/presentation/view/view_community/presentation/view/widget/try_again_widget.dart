import 'package:flutter/material.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class TryAgainWidget extends StatelessWidget {
  const TryAgainWidget({
    super.key,
    required this.tryAgainCallback,
  });

  final Function() tryAgainCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(appStrings.networkError),
        SizedBox(
          height: 16.h,
        ),
        TextButton(
          onPressed: tryAgainCallback,
          child: Text(appStrings.tryAgain),
        )
      ],
    );
  }
}
