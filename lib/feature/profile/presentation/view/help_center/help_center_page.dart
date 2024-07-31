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
class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;

    return BasePageWidget(
        appBarHeight: 60,

        appBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 56, 12, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: appAssets.arrowLeft.svg(width: 24, height: 24)),
              SizedBox(width: w*0.3,),
              CustomText(appStrings.helpCentre, style: context.titleHeadline,
                textAlign: TextAlign.center,),
            ],
          ),
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),
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
                      title:appStrings.contactUs,
                      trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText)),
                  buildDivider(context, w),
                  buildAccountMenus(context,
                      title:appStrings.reportProblem,
                      trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),

                    onTap: (){
                    context.pushRoute(const ReportPageRoute());
                    }
                  ),

                ],))
          ],

        ));
  }

  Divider buildDivider(BuildContext context, double w) => Divider(color: context.scheme().neutralsBorderDivider,indent: w*0.06,);



  ListTile buildAccountMenus(BuildContext context,
      {required String title,  Widget? leading,required Widget trailing,void Function()? onTap}) {
    return ListTile(
      title: CustomText(
          title,
          style: context.bodyBody),
      leading: SizedBox(width: 24,
          height: 64,
          child:leading ),
      trailing: SizedBox(width: 24,
          height: 64,
          child: trailing),
      onTap:onTap ,
      contentPadding: const EdgeInsets.fromLTRB( 0,5,5,5,),
      horizontalTitleGap: 0,
    );
  }
}
