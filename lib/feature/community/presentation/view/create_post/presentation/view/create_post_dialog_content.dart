import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/view/create_post/presentation/bloc/create_post_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/create_post/presentation/view/post_to_dialog_content.dart';



class CreatePostDialogContent extends StatefulWidget implements AutoRouteWrapper{
  const CreatePostDialogContent({super.key});

  @override
  State<CreatePostDialogContent> createState() => _CreatePostDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<CreatePostBloc>(), child: this);
  }
}

class _CreatePostDialogContentState extends State<CreatePostDialogContent> {
  double dialogHeightPercent = 0.92;
  final _postToFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final TextEditingController _postToController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String? _communityId;
  XFile? _file;
  final List<XFile> _files = [];
  final List<File> _photos = [];
  Uint8List? _image;
  final List<Uint8List> _images = [];
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;

  Future<void> selectImage() async {
    _file = await pickImage(ImageSource.gallery);
    if (_file != null) {
      _image = await _file!.readAsBytes();
      _images.add(_image!);
    }
  }

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    _postToFocusNode.unfocus();
    _titleFocusNode.unfocus();
    _descFocusNode.unfocus();
    super.dispose();
  }

  final List<int>? list = [];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    ValueNotifier<bool> obscureState = ValueNotifier(true);
    ValueNotifier<bool> obscureStateTextField = ValueNotifier(false);

    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

    disableSubmitReport(obscureStateTextField);

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: h * dialogHeightPercent,
        child: Container(
            decoration: BoxDecoration(
                color: context
                    .scheme()
                    .neutralsBackground,
                boxShadow: [
                  BoxShadow(
                    color: context
                        .scheme()
                        .selectIconDropDown,
                    spreadRadius: 1,
                    blurRadius: 4,
                  )
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimen.popupRadius),
                    topRight: Radius.circular(Dimen.popupRadius))),
            child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: BlocConsumer<CreatePostBloc, CreatePostState>(
                  listener: (BuildContext context,
                      CreatePostState state) async {
                    if (state.createStatus.isNotifyChangeFieldsValue) {
                      _postToController.text=state.selectedCommunity!.name!;
                      _communityId=state.selectedCommunity!.id;
                    }
                    else if (state.createStatus.isSuccess) {
                      await Future.delayed(const Duration(seconds: 2));
                      if (context.mounted) {
                        context.pushRoute(CommunityHomePageRoute());
                        //  context.router.replaceAll([const CommunityHomePage()]);
                      }
                    }

                    else if (state.createStatus.isFailure) {
                      Fluttertoast.showToast(
                          msg: state.errorMessage!,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    return (state.createStatus.isSuccess)
                        ? postSentWidget()
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BottomSheetHeader(
                          showDivider: false,
                          title: '',
                          // icon: appAssets.close.svg(),
                          closeIcon: appAssets.close.svg(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: CustomText(appStrings.newPost, style: context
                              .titleTitle1.copyWith(color: const Color(
                              0xff0A0A0A))),
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, right: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(
                                      height: (!_keyboardVisibilityValueNotifier
                                          .value)
                                          ? 30
                                          : 10),

                                  CustomTextField.outline(
                                    textEditingController: _postToController,
                                    label: appStrings.wherePost,
                                    focusNode: _postToFocusNode,
                                    readOnly: false,
                                    suffixIcon: Padding(
                                        padding: const EdgeInsets.all(7),
                                        child: appAssets.dropDown.svg(
                                            width: 10, height: 10)),
                                    labelTextColor: context
                                        .scheme()
                                        .secondaryText,
                                    onTap: () {
                                      _showPostToDialog(context, (community) {
                                         setSelectedResultToState(community);
                                      });
                                    },
                                  ),
                                  SizedBox(
                                      height: (!_keyboardVisibilityValueNotifier
                                          .value)
                                          ? 20
                                          : 10),
                                  CustomTextField.outline(
                                      label: appStrings.titleOfPost,
                                      textEditingController: _titleController,
                                      focusNode: _titleFocusNode,
                                      onChanged: (value) {
                                        disableSubmitReport(
                                            obscureStateTextField);
                                      },
                                      onEditingComplete: () {
                                        disableSubmitReport(
                                            obscureStateTextField);
                                      }
                                  ),
                                  SizedBox(
                                      height: (!_keyboardVisibilityValueNotifier
                                          .value)
                                          ? 20
                                          : 10),
                                  CustomTextField.outline(
                                      label: appStrings.description,
                                      textEditingController: _descController,
                                      maxLines: 5,
                                      focusNode: _descFocusNode,
                                      onChanged: (value) {
                                        disableSubmitReport(
                                            obscureStateTextField);
                                      },
                                      onEditingComplete: () async {
                                        disableSubmitReport(
                                            obscureStateTextField);
                                      }
                                  ),
                                  SizedBox(
                                      height: (!_keyboardVisibilityValueNotifier
                                          .value)
                                          ? 0
                                          : 4),
                                  SizedBox(
                                    height: (!_keyboardVisibilityValueNotifier
                                        .value)
                                        ? h * 0.2
                                        : h * 0.1,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildAddPhotoButton(w, obscureState),
                                        const SizedBox(width: 10,),
                                        Flexible(
                                          child: ValueListenableBuilder(
                                            valueListenable: obscureState,
                                            builder: (BuildContext context,
                                                bool obscureValue,
                                                Widget? child) {
                                              return GridView.builder(
                                                  physics: const ScrollPhysics(),
                                                  shrinkWrap: true,
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: (!_keyboardVisibilityValueNotifier
                                                        .value) ? 2 : 4,
                                                    // number of items in each row
                                                    mainAxisSpacing: 7,
                                                    // spacing between rows
                                                    crossAxisSpacing: 10,
                                                    // spacing between columns
                                                    mainAxisExtent: 100,
                                                  ),
                                                  padding: const EdgeInsets
                                                      .only(left: 0, right: 0),
                                                  itemCount: _files.length,
                                                  itemBuilder: (context,
                                                      index) =>
                                                      _buildPhotoPreview(
                                                          w, index)
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildPostButton(
                                      obscureStateTextField, state),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )
            )),
      ),
    );
  }

  InkWell _buildAddPhotoButton(double w, ValueNotifier<bool> obscureState) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await selectImage();

        obscureState.value = !obscureState.value;
      },
      child: Container(
          padding: EdgeInsets.all(
              (!_keyboardVisibilityValueNotifier.value)
                  ? 30
                  : 10),
          width: (!_keyboardVisibilityValueNotifier.value) ? w /
              4 : w / 6,
          height: (!_keyboardVisibilityValueNotifier.value)
              ? 100
              : 50,
          decoration: BoxDecoration(
            color: context
                .scheme()
                .neutralsBackground,
            border: Border.all(color: context
                .scheme()
                .neutralsBorderDivider),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimen.defaultRadius)),
          ),
          child: appAssets.addReport.svg()
      ),
    );
  }

  Stack _buildPhotoPreview(double w, int index) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(
                (!_keyboardVisibilityValueNotifier.value)
                    ? 30
                    : 10),
            width: (!_keyboardVisibilityValueNotifier.value) ? w /
                4 : w / 6,
            height: (!_keyboardVisibilityValueNotifier.value)
                ? 100
                : 50,
            decoration: BoxDecoration(
                color: context
                    .scheme()
                    .neutralsBackground,
                border: Border.all(color: context
                    .scheme()
                    .neutralsBorderDivider),
                borderRadius: const BorderRadius.all(
                  Radius.circular(Dimen.defaultRadius),
                ),
                image: DecorationImage(
                    image: MemoryImage(
                        _images[index]), fit: BoxFit.cover
                )
            )),
        Positioned(

            top: 4,
            right: (!_keyboardVisibilityValueNotifier.value) ? 20 : 5,
            child: InkWell(
                onTap: () {
                  setState(() {
                    _files.removeAt(index);
                    _images.removeAt(index);
                    _photos.removeAt(index);
                  });
                },
                child: appAssets.photoClose.svg())
        ),
      ],
    );
  }

  ValueListenableBuilder<bool> _buildPostButton(
      ValueNotifier<bool> obscureStateTextField, CreatePostState state) {
    return ValueListenableBuilder(
        valueListenable: obscureStateTextField,
        builder: (BuildContext context, bool obscureValue,
            Widget? child) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: !obscureStateTextField.value
                ? CustomButton.outline(
              text: appStrings.post,
              textColor: context
                  .scheme()
                  .tertiaryText,
              backgroundColor: context
                  .scheme()
                  .disabledText,
              onPressed: () {},
            )
                : CustomButton.submit(
              text: appStrings.post,
              showLoading: state.createStatus.isLoading,
              onPressed: () {
                PostDataRequest request =
                PostDataRequest(
                    communityId: _communityId,
                    title: _titleController.text.trim(),
                    content: _descController.text.trim(),
                    photos: _photos
                );
                context.read<CreatePostBloc>().add(
                    CreatePostEvent.newPostEvent(postRequest: request));
              },
            ),
          );
        }
    );
  }

  Column postSentWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
            title: CustomText(
                appStrings.postSent, textAlign: TextAlign.center,
                style: context.titleTitle1),
            subtitle: CustomText(appStrings.postSuccessMsg,
                textAlign: TextAlign.center,
                style: context.bodyBody)

        ),
      ],
    );
  }

  void disableSubmitReport(ValueNotifier<bool> obscureStateTextField) {
    if (_postToController.text.isEmpty) {
      obscureStateTextField.value = false;
    }
    else {
      obscureStateTextField.value = true;
    }
  }

  Future<void> _showPostToDialog(BuildContext context,
      Function(CommunityDetails community) onSelectResult)

  async {
    FocusScope.of(context).unfocus();
    CommunityDetails? community = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const PostToDialogContent().wrappedRoute(context);
        });
    if (community != null) onSelectResult(community);
    // else toast
  }

  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      _files.add(file!);
      _photos?.add(File((file.path)));
      return file;
    }
  }

  Expanded loadingWidget(BuildContext context) {
    return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 38,
                height: 38,
                child: CircularProgressIndicator(
                    strokeWidth: 3.8,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Theme
                        .of(context)
                        .primaryColor)),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ));
  }

  void setSelectedResultToState(result) {
    context.read<CreatePostBloc>().add(
        CreatePostEvent.setSelectedCommunityEvent(result));
  }
}
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
