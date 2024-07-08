import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:maze_app/feature/knowledge/presentation/widgets/article_post_widget.dart';

@RoutePage()
class AdminArticlePage extends StatefulWidget implements AutoRouteWrapper {
  const AdminArticlePage({
    super.key,
    this.article,
  });

  final Article? article;

  @override
  State<AdminArticlePage> createState() => _AdminArticlePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<KnowledgeCubit>(), child: this);
  }
}

class _AdminArticlePageState extends State<AdminArticlePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        appBar: AppBar(),
        child: BlocBuilder<KnowledgeCubit, KnowledgeState>(
          builder: (context, state) {
            if (state.runtimeType == ArticlesLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField.outline(
                    textEditingController: _titleController,
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('state is not right'),
              );
            }
          },
        ));
  }
}
