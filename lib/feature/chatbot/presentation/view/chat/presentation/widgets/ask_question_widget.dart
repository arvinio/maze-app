import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import 'chat_result_widget.dart';

class AskQuestionWidget extends StatelessWidget {
  const AskQuestionWidget({
    super.key,
    required this.question,
    required this.width,

  });

  final String question;
  final double width;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const  SizedBox(height: 10,),
          Container(
            width: width*0.6,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 5),
            decoration:  BoxDecoration(
              color: context.scheme().primary,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(4.0),bottomLeft: Radius.circular(12.0)),
            ),
            child: CustomText(question,style: context.bodyBodyMedium.copyWith(color: context.scheme().whiteText),),
          ),
          const  SizedBox(height: 2,),


    ],
      );
  }
}
