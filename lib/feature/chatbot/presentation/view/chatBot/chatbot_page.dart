import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/account_info/data/model/account_info_response.dart';
import 'package:maze_app/feature/account_info/presentation/bloc/account_info_bloc.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/country_dialog_content.dart';


@RoutePage()
class ChatBotPage extends StatefulWidget  implements AutoRouteWrapper{
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<AccountInfoBloc>(), child: this);

  }
}

class _ChatBotPageState extends State<ChatBotPage> {


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
        appBarHeight: 80,
        appBar: Padding(
            padding: const EdgeInsets.only(top: 56,bottom: 14,left: 5),
            child: ListTile(
              title: CustomText(appStrings.chatBotTitle,style: context.titleHeadline,textAlign: TextAlign.center,),
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: appAssets.arrowLeft.svg(width: 24, height: 24)),
              trailing:  appAssets.more.svg()


            )
        ),

        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: context.scheme().neutralsBorderDivider,indent: 0,endIndent: 0,thickness: 1,),
              const SizedBox(height: 30,),

            ],),
        )
    );
  }


}

