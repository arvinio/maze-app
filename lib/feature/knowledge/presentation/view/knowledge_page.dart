import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';

@RoutePage()
class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<KnowledgePage> createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        appBar: AppBar(
          title: Text(
            'Knowledge',
            style: context.titleTitle2,
          ),
          actions: [
            IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.abc),
            ),
          ],
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {},
        ));
  }
}
