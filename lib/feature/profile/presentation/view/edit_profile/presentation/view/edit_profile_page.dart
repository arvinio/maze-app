import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

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
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_loading.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/profile/core/util/edit_profile_request/edit_profile_request.dart';
import 'package:maze_app/feature/profile/presentation/bloc/profile_bloc.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget implements AutoRouteWrapper{
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ProfileBloc>(), child: this);
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _userNameFocusNode = FocusNode();
  final _aboutYouFocusNode = FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _aboutYouController = TextEditingController();
  XFile? _coverFile;
  Uint8List? _coverImage;
  XFile? _avatarFile;
  Uint8List? _avatarImage;
  String avatarUrl="";
  String coverUrl="";
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;

  Future<void> selectCoverImage() async {
    _coverFile = await pickImage(ImageSource.gallery);
    if (_coverFile != null) {
      _coverImage = await _coverFile!.readAsBytes();
    }
  }

  Future<void> selectAvatarImage() async {
    _avatarFile = await pickImage(ImageSource.gallery);
    if (_avatarFile != null) {
      _avatarImage = await _avatarFile!.readAsBytes();
    }
  }

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(false);
    context.read<ProfileBloc>().add( const ProfileEvent.getProfileEvent());
  }

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
    ValueNotifier<bool> obscureCoverState = ValueNotifier(true);
    ValueNotifier<bool> obscureAvatarState = ValueNotifier(true);

    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.profileStatus.isSuccess) {
          if (state.response!.cover != null) {
            coverUrl = state.response!.cover!;
          }
          if (state.response!.avatar != null) {
            avatarUrl = state.response!.avatar!;
          }
          if (state.response!.username != null) {
            _userNameController.text = state.response!.username!;
          }
          if (state.response!.about != null) {
            _aboutYouController.text = state.response!.about!;
          }
        }
        else if (state.profileStatus.isFailure) {
          Fluttertoast.showToast(msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        else if (state.profileStatus.isEditProfileSuccess) {
          Fluttertoast.showToast(msg: appStrings.profileUpdatedMsg,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        else if (state.profileStatus.isEditProfileFailure) {
          Fluttertoast.showToast(msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return BasePageWidget(
          appBar: Padding(
            padding: const EdgeInsets.fromLTRB(0, 42, 0, 16),
            child:
            ListTile(
                title: CustomText(
                  appStrings.editProfile, style: context.titleHeadline,
                  textAlign: TextAlign.center,),
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: appAssets.arrowLeft.svg(width: 24, height: 24)),
                trailing: TextButton(child: CustomText(appStrings.save,
                    style: context.titleHeadline.copyWith(color: context
                        .scheme()
                        .primary)),
                    onPressed: () {
                      EditProfileRequest request = EditProfileRequest(
                       cover: ( _coverFile !=null)?File(_coverFile!.path!):null,
                        avatar: ( _avatarFile !=null)?File(_avatarFile!.path!):null,
                        username: _userNameController.text.trim(),
                        about: _aboutYouController.text.trim(),
                      );
                      context.read<ProfileBloc>().add(
                          ProfileEvent.editProfileEvent(
                              profileRequest: request));
                    })
            ),
          ),
          child:  state.profileStatus.isLoading
              ? const CustomLoading()
              :SingleChildScrollView(
            child: SizedBox(
              height: (!_keyboardVisibilityValueNotifier.value) ? h * 0.9 : h *
                  0.74,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: (!_keyboardVisibilityValueNotifier.value)
                      ? 30
                      : 10,),
                  Center(
                      child: Stack(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: obscureCoverState,
                            builder: (BuildContext context, bool obscureValue,
                                Widget? child) {
                              return Container(
                                padding: const EdgeInsets.all(30),
                                width: w, height: h / 4,
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
                                        image: _coverImage != null
                                            ? MemoryImage(_coverImage!)
                                            : coverUrl.isNotEmpty?
                                            NetworkImage(coverUrl)
                                        :ExactAssetImage(
                                            appAssets.cover.path),
                                        fit: BoxFit.cover)
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: 124,
                            left: 287,
                            child: IconButton(
                              icon: appAssets.floatingActionButtons.svg(),
                              onPressed: () async {
                                await selectCoverImage();
                                obscureCoverState.value =
                                !obscureCoverState.value;
                              },),
                          ),
                          ValueListenableBuilder(
                            valueListenable: obscureAvatarState,
                            builder: (BuildContext context, bool obscureValue,
                                Widget? child) {
                              return Padding(
                                padding: EdgeInsets.only(top: (h / 4) - 45),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: 95,
                                    height: 95,
                                    child: _avatarImage != null
                                        ? CircleAvatar(
                                      radius: 100,
                                      backgroundImage: MemoryImage(
                                          _avatarImage!),
                                    )
                                        : CircleAvatar(
                                      backgroundColor: context
                                          .scheme()
                                          .disabledText,
                                      radius: 100,
                                     backgroundImage:avatarUrl.isNotEmpty? NetworkImage(avatarUrl
                                     ):ExactAssetImage(
                                         appAssets.avatar.path),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: w / 5, top: h / 4),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              /* bottom: -15,
                                right: w/3,*/
                              child: IconButton(icon: appAssets
                                  .floatingActionButtons.svg(),
                                  onPressed: () async {
                                    await selectAvatarImage();
                                    obscureAvatarState.value =
                                    !obscureAvatarState.value;
                                  }),
                            ),
                          )
                        ],)

                  ),
                  SizedBox(height: (!_keyboardVisibilityValueNotifier.value)
                      ? 50
                      : 10),
                  CustomTextField.outline(label: appStrings.userName,
                    textEditingController: _userNameController,
                    focusNode: _userNameFocusNode,),
                  SizedBox(height: (!_keyboardVisibilityValueNotifier.value)
                      ? 20
                      : 7),
                  CustomTextField.outline(label: appStrings.aboutYou,
                    textEditingController: _aboutYouController,
                    maxLines: 5,
                    focusNode: _aboutYouFocusNode,

                  ),

                  (!_keyboardVisibilityValueNotifier.value)
                      ? const Spacer()
                      : const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      title: CustomText(
                        appStrings.detailsPublicProfile,
                        style: context.footnoteFootnote,
                      ),
                      leading: IconButton(
                        icon: appAssets.eye.svg(),
                        onPressed: () {},
                      ),
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0.0,


                    ),
                  ),

                ],

              ),
            )
            ,
          )
          ,
        );
      },
    );
  }

  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return file;
    }
    print('No Images Selected');
  }
}
