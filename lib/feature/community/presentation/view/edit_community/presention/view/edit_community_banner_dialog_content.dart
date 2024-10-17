import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/view/edit_community/presention/bloc/edit_community_bloc.dart';
import 'package:maze_app/feature/community/presentation/view/view_community/presentation/widgets/circle_avatar_widget.dart';


class EditCommunityBannerDialogContent extends StatefulWidget implements AutoRouteWrapper{
  CommunityDetails? communityDetails;
  Function onEditedCallback;
  EditCommunityBannerDialogContent({super.key,this.communityDetails , required this.onEditedCallback,});

  @override
  State<EditCommunityBannerDialogContent> createState() => _CommunityBannerDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject<EditCommunityBloc>()),
      ],
      child: this,
    );
  }
}

class _CommunityBannerDialogContentState extends State<EditCommunityBannerDialogContent> {
  double dialogHeightPercent = 0.92;
  ValueNotifier<bool> obscureCoverState = ValueNotifier(false);
  ValueNotifier<bool> obscureAvatarState = ValueNotifier(false);
  ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

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
    return null;
  }

 File? convertXFile(XFile? xFile){
    if(xFile != null){
      return File(xFile.path);
    }else{
      return null;
    }
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


    return BlocConsumer<EditCommunityBloc , EditCommunityState>(
      listener: (context, state) {
        if(state.editStatus == EditCommunityStatus.loading){
          loadingNotifier.value = true;
        } else if(state.editStatus == EditCommunityStatus.success){
          loadingNotifier.value = false;
          widget.onEditedCallback();
          Navigator.pop(context);
          Navigator.pop(context);

        } else if(state.editStatus == EditCommunityStatus.failure){
          loadingNotifier.value = false;
          Fluttertoast.showToast(
              msg: state.errorMessage ??'',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
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


                              ],)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(appStrings.editCommunity,
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
                          Padding(
                              padding: const EdgeInsets.only(top: 30,bottom: 10),
                              child:
                              ValueListenableBuilder(valueListenable: loadingNotifier,
                                builder: (_, loading, child) => CustomButton.submit(
                                text: appStrings.editCommunity,
                                showLoading: loading,
                                onPressed: () {
                                  context.read<EditCommunityBloc>().add(EditCommunityEvent.editCommunityEvent(
                                    communityRequest: widget.communityDetails! ,
                                    avatarFile: convertXFile(_avatarFile) ,
                                    coverFile: convertXFile(_coverFile),),);
                                },
                              ),)
                          ),
                            ],),
                        )
                      ],
                    ))),
          ),
        );
      }
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
                                    ) : widget.communityDetails?.avatar?.isNotEmpty == true ? CircleAvatarWidget(
                                      width: 100,
                                      height: 100,
                                     url: widget.communityDetails?.avatar,
                                      type: 'network', onTab: (){}, )
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


}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
