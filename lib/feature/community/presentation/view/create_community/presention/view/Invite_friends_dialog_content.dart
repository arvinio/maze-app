import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/presentation/view/community_home_page.dart';
import 'package:maze_app/feature/community/presentation/view/create_community/presention/bloc/create_community_bloc.dart';

class InviteFriendsDialogContent extends StatefulWidget implements AutoRouteWrapper{
  Community? community;
   InviteFriendsDialogContent({super.key,this.community});

  @override
  State<InviteFriendsDialogContent> createState() => _InviteFriendsDialogContentState();

@override
  Widget wrappedRoute(BuildContext context) {
  return BlocProvider(create: (_) => inject<CreateCommunityBloc>(), child: this);

}
}

class _InviteFriendsDialogContentState extends State<InviteFriendsDialogContent> {
  double dialogHeightPercent = 0.92;
  final _emailFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  List<String> friends =[];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
                child: BlocConsumer<CreateCommunityBloc, CreateCommunityState>(
                  listener: (BuildContext context, CreateCommunityState state) async{
                    if (state.createStatus.isSuccess) {
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
                        ? communityCreatedWidget()
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BottomSheetHeader(
                            showDivider: false,
                            title: '',
                            closeIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                appAssets.arrowLeft.svg(),
                                SizedBox(width: w * 0.68,),
                                IconButton(onPressed: () {
                                  context.read<CreateCommunityBloc>().add(
                                      CreateCommunityEvent.newCommunityEvent(
                                          communityRequest: widget.community!));
                                }, icon: CustomText(appStrings.skip,
                                    style: context.titleHeadline.copyWith(
                                        color: context
                                            .scheme()
                                            .primary)))

                              ],)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(appStrings.inviteFriendsTitle,
                                  style: context.titleTitle1),
                              const SizedBox(height: 8),
                              CustomText(appStrings.inviteFriendsSubTitle,
                                  style: context.bodyBody),
                              const SizedBox(height: 24),
                              CustomTextField.outline(
                                  textEditingController: _emailController,
                                  label: appStrings.emailUsername,
                                  focusNode: _emailFocusNode,
                                  readOnly: false,
                                  suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20),
                                      child: appAssets.create.svg(width: 24,
                                          height: 24)),
                                  labelTextColor: context
                                      .scheme()
                                      .secondaryText,
                                  onTap: () {
                                    setState(() {
                                      if (_emailController.text.isNotEmpty) {
                                        friends.add(_emailController.text);
                                        _emailController.clear();
                                      }
                                    });
                                  }),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: h * .4,
                                child: ListView.separated(
                                  itemCount: friends.length,
                                  itemBuilder: (context, index) {
                                    return _buildListItem(friends[index]);
                                  },
                                  separatorBuilder: (BuildContext context,
                                      int index) {
                                    return Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: context
                                          .scheme()
                                          .neutralsBorderDivider,
                                      indent: 60,
                                      endIndent: 5,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildInviteButton(state)
                            ],),
                        )
                      ],
                    );
                  },
                ))),
      ),
    );
  }


    Column communityCreatedWidget() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
              title: CustomText(
                  appStrings.communityCreated, textAlign: TextAlign.center,
                  style: context.titleTitle1),
              subtitle: CustomText(appStrings.communityStarted,
                  textAlign: TextAlign.center,
                  style: context.bodyBody)

          ),
        ],
      );
    }


  Widget _buildListItem(String item) {
    return Container(
      padding:const EdgeInsets.only(top: 8),
      margin:const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: context.scheme().neutralsBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading:Image.asset(appAssets.friendsAvatar.path,width: 40),
        title: CustomText(item,style: context.bodyBody,),
        contentPadding: const EdgeInsets.only(right: 9),
        trailing: IconButton(
          icon:appAssets.closeCircle.svg(width: 24,height: 24),
          onPressed: () {
            setState(() {
              friends.remove(item);
            });
          },
        ),
      ),
    );
  }
  Padding _buildInviteButton(CreateCommunityState state) {
    return  Padding(
      padding: const EdgeInsets.only(top: 30,bottom: 10),
      child:CustomButton.submit(
        text: appStrings.inviteCommunityButton,
        showLoading: state.createStatus.isLoading,
        onPressed: () {
          widget.community!.invites=friends;
        context.read<CreateCommunityBloc>().add(  CreateCommunityEvent.newCommunityEvent(communityRequest: widget.community!));


        },
      ),
    );

  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
