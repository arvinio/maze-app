import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/presentation/widget/app_loading.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/knowledge/domain/entity/article.dart';
import 'package:maze_app/feature/knowledge/domain/entity/create_edit_article.dart';
import 'package:maze_app/feature/knowledge/presentation/knowledge/cubit/knowledge_cubit.dart';
import 'package:file_picker/file_picker.dart';

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
  var _dropDownValue = '';
  File? file;

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Create new post',
          ),
          centerTitle: true,
        ),
        child: BlocBuilder<KnowledgeCubit, KnowledgeState>(
          builder: (context, state) {
            if (state.runtimeType == ArticlesLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text('Title'),
                  CustomTextField.outline(
                    textEditingController: _titleController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text('Content'),
                  CustomTextField.outline(
                    textEditingController: _contentController,
                    minLines: 8,
                    maxLines: 20,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Choose category'),
                      DropdownMenu(
                        dropdownMenuEntries: context
                            .read<KnowledgeCubit>()
                            .getCategoriesDropDown(),
                        onSelected: (value) => _dropDownValue = value,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      const Text('Choose a cover photo'),
                      IconButton.filled(
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              file = File(result.files.single.path!);
                            }
                          },
                          icon: const Icon(Icons.camera_alt_outlined))
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: CustomButton.cancel(
                          text: 'Cancel',
                          onPressed: () {
                            context.maybePop();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: CustomButton.submit(
                          text: "Post",
                          onPressed: () {
                            context
                                .read<KnowledgeCubit>()
                                .createArticle(CreateEditArticle(
                                  text: _contentController.text,
                                  title: _titleController.text,
                                  categoryID: _dropDownValue,
                                  image: file?.path,
                                ));
                          },
                        ),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return const PageLoading();
            }
          },
        ));
  }
}
