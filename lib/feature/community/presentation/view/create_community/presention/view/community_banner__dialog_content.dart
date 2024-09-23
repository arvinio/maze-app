import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/presentation/view/create_community/presention/bloc/create_community_bloc.dart';

import 'Invite_friends_dialog_content.dart';

class CommunityBannerDialogContent extends StatefulWidget implements AutoRouteWrapper{
  Community? community;
   CommunityBannerDialogContent({super.key,this.community});

  @override
  State<CommunityBannerDialogContent> createState() => _CommunityBannerDialogContentState();

@override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<CreateCommunityBloc>(), child: this);
  }
}

class _CommunityBannerDialogContentState extends State<CommunityBannerDialogContent> {
  double dialogHeightPercent = 0.92;
  ValueNotifier<bool> obscureCoverState = ValueNotifier(false);
  ValueNotifier<bool> obscureAvatarState = ValueNotifier(false);

  XFile? _coverFile;
  Uint8List? _coverImage;
  XFile? _avatarFile;
  Uint8List? _avatarImage;
  String avatarUrl="";
  String coverUrl="";

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

  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return file;
    }
    print('No Images Selected');
  }


  @override
  void initState() {
    super.initState();
  }

  final List<int>? list=[];


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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetHeader(
                        showDivider: false,
                        title: '',
                        closeIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            appAssets.arrowLeft.svg(),
                            SizedBox(width: w * 0.67,),
                            IconButton(onPressed: () {
                            _showInviteFriends(context);
                            }, icon: CustomText(appStrings.skip,
                                style: context.titleHeadline.copyWith(
                                    color: context
                                        .scheme()
                                        .primary)))

                          ],)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(appStrings.communityBannerTitle,
                              style: context.titleTitle1),
                          const SizedBox(height: 8),
                          CustomText(appStrings.communityBannerSubTitle,
                              style: context.bodyBody),
                          const SizedBox(height: 24),
                          ValueListenableBuilder(
                              valueListenable: obscureAvatarState,
                              builder: (BuildContext context, bool obscureValue,
                                  Widget? child) {
                                return _buildAvatarSelector(context);
                              }
                          ),

                          const SizedBox(height: 24),
                          ValueListenableBuilder(
                              valueListenable: obscureCoverState,
                              builder: (BuildContext context, bool obscureValue,
                                  Widget? child) {
                                return _buildCoverSelector(
                                  image: _coverImage != null
                                      ? MemoryImage(_coverImage!)
                                      : ExactAssetImage(appAssets.banner.path),
                                  size: 200,
                                );
                              }
                          ),
                          const SizedBox(height: 100),
                          _buildContinueButton()
                        ],),
                    )
                  ],
                ))),
      ),
    );
  }

  Widget _buildAvatarSelector(BuildContext context) {
    return Center(
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
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
                                      backgroundImage:ExactAssetImage(
                                          appAssets.recycleBin.path),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -8,
                                    left: 58,
                                    child: IconButton(
                                      icon: appAssets.create.svg(),
                                      onPressed: ()  async {
                                          await selectAvatarImage();
                                          obscureAvatarState.value =
                                          !obscureAvatarState.value;

                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
  }

  Widget _buildCoverSelector({required ImageProvider image, required double size}) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size,
          decoration: BoxDecoration(
            borderRadius:const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            right: 8,
            bottom: 8,
            child: IconButton(
                icon: appAssets.create.svg(),
                onPressed: () async {
                  await selectCoverImage();
                  obscureCoverState.value =
                  !obscureCoverState.value;
                })
        ),
      ],
    );
  }

  Padding _buildContinueButton() {
    return  Padding(
      padding: const EdgeInsets.only(top: 30,bottom: 10),
      child:CustomButton.submit(
        text: appStrings.continueSteps,
        onPressed: () {
          _showInviteFriends(context);
        },
      ),
    );

  }

  void _showInviteFriends(BuildContext context)  {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          if(_avatarFile!=null) {
            widget.community!.avatar=File(_avatarFile!.path);
          }
          if(_coverFile!=null) {
            widget.community!.cover=File(_coverFile!.path);
          }
          return  InviteFriendsDialogContent(community: widget.community).wrappedRoute(context);
        });

    // else toast
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
