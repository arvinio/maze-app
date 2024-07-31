import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

@RoutePage()
class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({super.key});

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;

    return BasePageWidget(
        child:
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(appStrings.account, style: context.titleTitle2,
                textAlign: TextAlign.left,),
              const SizedBox(height: 40),
            Container(
               padding: EdgeInsets.zero,
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

                  child:Column(children: [
                    buildAccountMenus(context,
                    title:appStrings.editProfile,
                    leading:appAssets.editProfile.svg(color: context.scheme().primaryText),
                    trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                    onTap: (){
                      context.pushRoute(const EditProfilePageRoute());

                    }),
                    buildDivider(context, w),
                    buildAccountMenus(context,
                        title:appStrings.yourDetails,
                        leading:appAssets.yourDetails.svg(color: context.scheme().primaryText),
                        trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                      onTap: (){
                      context.pushRoute(const YourDetailsPageRoute());
                    }),
                    buildDivider(context, w),

                    buildAccountMenus(context,
                        title:appStrings.yourHousehold,
                        leading:appAssets.house.svg(color: context.scheme().primaryText),
                        trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                      onTap: (){
                        context.pushRoute(const YourHouseholdPageRoute());

                      }
                    ),
                    buildDivider(context, w),

                    buildAccountMenus(context,
                        title:appStrings.accountSettings,
                        leading:appAssets.settings.svg(color: context.scheme().primaryText),
                        trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                        onTap: (){
                          context.pushRoute(const AccountSettingsPageRoute());
                        }),
                    buildDivider(context, w),

                    buildAccountMenus(context,
                        title:appStrings.helpCentre,
                        leading:appAssets.question.svg(color: context.scheme().primaryText),
                        trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                      onTap: (){
                      context.pushRoute(const HelpCenterPageRoute());
                      }
                    ),
                    buildDivider(context, w),

                    buildAccountMenus(context,
                        title:appStrings.about,
                        leading:appAssets.infoCircle.svg(color: context.scheme().primaryText),
                        trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                        onTap: (){
                          context.pushRoute(const AboutPageRoute());
                        }
                    )
                    ],))
            ],

          ),
        ));
  }

  Divider buildDivider(BuildContext context, double w) => Divider(color: context.scheme().neutralsBorderDivider,indent: w*0.12,);



  ListTile buildAccountMenus(BuildContext context,
      {required String title, required Widget leading,required Widget trailing,void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
                  title: CustomText(
                      title,
                      style: context.bodyBody),
                  leading: SizedBox(width: 24,
                      height: 64,
                      child:leading ),
                  trailing: SizedBox(width: 24,
                      height: 64,
                      child: trailing),
      contentPadding: const EdgeInsets.all( 10),
                );
  }
}
