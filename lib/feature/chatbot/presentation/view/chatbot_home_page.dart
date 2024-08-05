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
import 'package:maze_app/feature/chatbot/presentation/view/faq/faq_page.dart';


@RoutePage()
class ChatBotHomePage extends StatefulWidget  implements AutoRouteWrapper{
  const ChatBotHomePage({super.key});

  @override
  State<ChatBotHomePage> createState() => _ChatBotHomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<AccountInfoBloc>(), child: this);

  }
}

class _ChatBotHomePageState extends State<ChatBotHomePage> {
  List<String> historyList =[ "What materials can be composted,\n and which ones should be avoided?",
  "Are there common mistakes to\n avoid when composting?"
  ];


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
      appBarHeight: 100,
        appBar: Padding(
          padding: const EdgeInsets.only(top: 56,bottom: 14,left: 10),
          child: ListTile(
           leading: CustomText(appStrings.chatHomeTitle,style: context.titleTitle2,),
            trailing:  InkWell(
              onTap: (){
                context.pushRoute(const ChatBotPageRoute());
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                width: 125,height: 34,
                decoration: BoxDecoration(color: context.scheme().primary,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    appAssets.add.svg(),
                    const SizedBox(width:5),
                    CustomText(appStrings.newChat,textAlign: TextAlign.center,
                    style: context.titleHeadline.copyWith(color: context.scheme().whiteText),),
                  ],
                ),),
            ),


          )
        ),

        child:SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Divider(color: context.scheme().neutralsBorderDivider,indent: 0,endIndent: 0,thickness: 1,),
                    const SizedBox(height: 30,),

          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: (){
              _showFAQDialog(context, (result) {

              });
            },
            child:  Container(
              padding:const EdgeInsets.fromLTRB(10,10,0,10),
              decoration: BoxDecoration(
                color: context.scheme().neutralsBackground,
                border: Border.all(color:  context.scheme().neutralsBorderDivider,width: 1),
                borderRadius:
                BorderRadius.circular(Dimen.defaultRadius),
              ),
              child: ListTile(
                title: CustomText(appStrings.faqTitle,style: context.subheadlineSubheadlineSemibold,),
                subtitle: CustomText(appStrings.faqSubTitle,
                  style: context.footnoteFootnote.copyWith(color: context.scheme().secondaryText),),
                leading: SizedBox(width: 48,height: 48, child: Image.asset(appAssets.faq.path)),
                trailing: SizedBox(width: 28,height: 28, child:appAssets.dropDown.svg(width: 10, height: 6)),
              ),
            )
          ),
                    const SizedBox(height: 30,),
                    CustomText(appStrings.today ,style: context.titleHeadline,),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                       itemCount: historyList.length,
                          itemBuilder: (context,index){
                         return  ChatHistoryWidget(title:historyList[index]);
                          },
                    ),),
                    CustomText(appStrings.yesterday ,style: context.titleHeadline,),
                    const ChatHistoryWidget(title:"What is composting, and how does it work?"),

          const SizedBox(height: 10,),
          CustomText('March' ,style: context.titleHeadline,),
         const ChatHistoryWidget(title:"How long does it take for compost to be ready for use in the garden?"),

                  ],),
              ),
            )
          );
  }


  Future<void> _showFAQDialog(BuildContext context,
      Function(Result reason) onSelectReason) async {
    FocusScope.of(context).unfocus();
    Result? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const FaqPage().wrappedRoute(context);
        });
    if (result != null) onSelectReason(result);
    // else toast
  }
}

class ChatHistoryWidget extends StatelessWidget {
  final String? title;
  final Widget? leading;
  const ChatHistoryWidget({
    super.key,
    required this.title, this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Container(
          padding:const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.scheme().neutralsBackground,
            border: Border.all(color:  context.scheme().neutralsBorderDivider,width: 1),
            borderRadius:
            BorderRadius.circular(Dimen.defaultRadius),
          ),
          child: ListTile(
            title: CustomText(title!,style: context.bodyBody),
            leading:leading ?? appAssets.message.svg(),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}

