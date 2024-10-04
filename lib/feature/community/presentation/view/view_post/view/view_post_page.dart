import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/presentation/view/view_post/widget/comment.dart';
import 'package:maze_app/feature/community/presentation/view/widgets/community_actions.dart';



@RoutePage()
class ViewPostPage extends StatefulWidget  {
  const ViewPostPage({super.key});

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {

  final _commentFocusNode = FocusNode();
  final TextEditingController _commentController = TextEditingController();
  List<CommunityDetails>? myCommunities = [];
  List<CommunityDetails>? otherCommunities = [];
  CommunityDetails? details;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _commentFocusNode.dispose();
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


    return BasePageWidget(
        appBarHeight: 60,
        pagePaddingHorizontal: 0,
        appBar: Padding(
            padding: const EdgeInsets.only(
                top: 50, bottom: 2, left: 25),
            child: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Align(alignment: Alignment.topLeft,
    child: appAssets.arrowLeft.svg(width: 24, height: 24)))),
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Divider(
            height: 1,
            thickness: 2,
            color: context
                .scheme()
                .neutralsBorderDivider,
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimen.pagePaddingHorizontal,
            ),
            child: Column(children: [

              ListTile(
                leading: const SizedBox(
                  width: 60, height: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                  ),
                ),
                title: CustomText('CompostWizard32', style: context.titleHeadline,),
                subtitle: CustomText(
                  '3h • The Garden Gang', style: context.subheadlineSubheadline,),
                trailing: InkWell(child: appAssets.more.svg(),
                    onTap: () {
                      _showLikeReportPostDialog(context);
                    }),
                contentPadding: EdgeInsets.zero,
              ),
              // Post Content
              const SizedBox(height: 20,),
              CustomText(
                'These homegrown carrots look absolutely vibrant and healthy! 🥕✨',
                style: context.titleHeadline,
              ),
              const SizedBox(height: 20,),
              CustomText(
                'Hey everyone, I\'m new to composting and just started my first pile. '
                    'It\'s exciting to see how nature can turn kitchen scraps into rich garden soil. '
                    'Any tips for a beginner like me? Can\'t wait to learn from this community! 🌱🌿',
                style: context.subheadlineSubheadline,
              ),
              const SizedBox(height: 20,),
              // Post Image
              Container(height: 220,
                  decoration: BoxDecoration(
                    color: context
                        .scheme()
                        .disableButtonBackground,
                    borderRadius: BorderRadius.circular(16),
                  )),
              const SizedBox(height: 20,),
              // Post Actions
              const CommunityActions(title: '${14.9} k'),
              const SizedBox(height: 15),
            ],),
          ),
          // Post Header

          Divider(color: context
              .scheme()
              .neutralsBorderDivider,
            indent: 0, endIndent: 0,),
          // Comments Section
          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimen.pagePaddingHorizontal,
            ),
            child: CustomText(appStrings.comments,style: context.titleTitle3,),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimen.pagePaddingHorizontal,
            ),
            child: SizedBox(
              height: 0.4*h,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Comment(
                      username: 'Abram Westervelt',
                      comment: 'Wow, your vegetable pile looks so healthy! 🌱 Any tips for a beginner like me?',
                      likes: '10.9k',
                      onPressed: (){_showOtherCommentsDialog(context);},
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20,);
                  }),
            ),
          ),
          const SizedBox(height: 20,),
          Divider(color: context
              .scheme()
              .neutralsBorderDivider,
            indent: 0, endIndent: 0,),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(
          horizontal: Dimen.pagePaddingHorizontal,
          ),
            child: CustomTextField.outline(
                textEditingController: _commentController,
                hint: appStrings.comment,
                borderColor: context
                    .scheme()
                    .neutralsFieldsTags,
                maxLines: 1,
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          10.0, 10.0, 0.0, 10.0),
                      child: appAssets.sendMsgActive
                          .svg(
                          width: 20, height: 20)
                  ),
                )),
          ),
        ],
      ),
    )
    );
  }



  void _showLikeReportPostDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.32,
            child: Column(children: [
              CustomMenuItems(
                title: appStrings.notInterested,

                leading: appAssets.dislike.svg(),
                onTap: () {
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: context
                    .scheme()
                    .neutralsBorderDivider,
                indent: 60,
                endIndent: 30,
              ),
              CustomMenuItems(
                title: appStrings.report,
                titleColor: context
                    .scheme()
                    .error,
                leading: appAssets.report.svg(),
                onTap: () {},
              ),

            ],),
          );
        });
    // else toast
  }

  void _showOtherCommentsDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.32,
            child: Column(children: [
              CustomMenuItems(
                title: appStrings.muteUser,
                leading: appAssets.mute.svg(),
                onTap: () {},
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: context
                    .scheme()
                    .neutralsBorderDivider,
                indent: 60,
                endIndent: 30,
              ),

              CustomMenuItems(
                title: appStrings.reportUser,
                leading: appAssets.report.svg(),
                onTap: () {
                },
              ),
            ],),
          );
        });
    // else toast
  }

  void _showMyCommentsDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.32,
            child: Column(children: [
              CustomMenuItems(
                title: appStrings.delete,
                leading: appAssets.delete.svg(),
                onTap: () {},
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: context
                    .scheme()
                    .neutralsBorderDivider,
                indent: 60,
                endIndent: 30,
              ),

              CustomMenuItems(
                title: appStrings.edit,
                leading: appAssets.editProfile.svg(),
                onTap: () {
                },
              ),
            ],),
          );
        });
    // else toast
  }


}