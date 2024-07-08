import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


@RoutePage()
class AccountNotificationPage extends StatefulWidget  {
  UserInfo? userInfo;
   AccountNotificationPage({super.key,required  this.userInfo});

  @override
  State<AccountNotificationPage> createState() => _AccountNotificationPageState();
}

class _AccountNotificationPageState extends State<AccountNotificationPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BasePageWidget(
        appBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 12, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: appAssets.arrowLeft.svg(width: 24, height: 24)),
            ],
          ),
        ),

        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  appStrings.notificationTitle, style: context.titleTitle1,),
                const SizedBox(height: 20,),
                LinearPercentIndicator(progressColor: context
                    .scheme()
                    .progress,
                  padding:const EdgeInsets.all(1),
                  animation: true,
                  barRadius: const Radius.circular(99),
                  lineHeight: 8.0,
                  animationDuration: 2000,
                  percent: 0.75,
                  animateFromLastPercent: true,
                  backgroundColor: context
                      .scheme()
                      .neutralsBorderDivider,
                  restartAnimation: false,

                ),
                const SizedBox(height: 40,),
                CustomText(
                  appStrings.notificationSubTitle, style: context.bodyBody,),
                const SizedBox(height: 30,),

                notification(appStrings.notMsg1, appAssets.notif1.svg()),
                const SizedBox(height: 16,),
                notification(appStrings.notMsg2, appAssets.notif2.svg()),
                const SizedBox(height: 16,),
                notification(appStrings.notMsg3, appAssets.notif3.svg()),
                 SizedBox(height: 0.1*h,),
                CustomButton.outline(
                  text: appStrings.noThanks,
                  onPressed: () {
                    widget.userInfo!.notification=false;
                    context.pushRoute( AccountHouseholdInfoPageRoute(userInfo:widget.userInfo!));
                  },),

                Padding(
                  padding: const EdgeInsets.only(top:12,bottom: 16),
                  child: CustomButton.submit(
                    text: appStrings.enableNotifications,
                    onPressed: () {
                      widget.userInfo!.notification=true;
                      context.pushRoute( AccountHouseholdInfoPageRoute(userInfo:widget.userInfo!));
                    },),
                ),

              ],),
          ),
        ));
  }

  Widget notification(String notification,Widget notificationIcon){
    return  Container(
      padding:const EdgeInsets.only(top:16,bottom: 16),
  decoration:BoxDecoration(
  borderRadius:
  BorderRadius.circular(Dimen.defaultRadius),
  border: Border.all(width: 1,color: context.scheme().neutralsBorderDivider)

  ),
  child: ListTile(title: CustomText(notification,style: context.bodyBody,),leading: notificationIcon),
  );

}


}
