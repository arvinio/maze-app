import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:maze_app/feature/chatbot/data/model/chat_history/chat_history_response.dart';
import 'package:maze_app/feature/chatbot/data/model/faq/faq_response.dart';
import 'package:maze_app/feature/chatbot/presentation/bloc/chat_bot_bloc.dart';
import 'package:maze_app/feature/chatbot/presentation/view/faq/faq_page.dart';
import 'package:intl/intl.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:maze_app/feature/chatbot/presentation/widgets/chat_history_widget.dart';


@RoutePage()
class ChatBotHomePage extends StatefulWidget {
   const ChatBotHomePage({super.key});

  @override
  State<ChatBotHomePage> createState() => _ChatBotHomePageState();
}

class _ChatBotHomePageState extends State<ChatBotHomePage> {
  late final List<ChatHistoryResult>? historyList=[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
        create: (_) =>
        inject<ChatBotBloc>()
          ..add(const ChatBotEvent.fetchChatHistoryListEvent()),
        child: BlocConsumer<ChatBotBloc, ChatBotState>(
          listener: (context, state) {
            if (state.chatBotStatus.isLoadAllHistory) {
              historyList!.clear();
              historyList!.addAll(state.allFetchedHistoryList!);
            } else if (state.chatBotStatus.isFailure) {
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
            return BasePageWidget(
                appBarHeight: 100,
                appBar: Padding(
                    padding: const EdgeInsets.only(
                        top: 56, bottom: 14, left: 10),
                    child: ListTile(
                        leading: CustomText(
                          appStrings.chatHomeTitle,
                          style: context.titleTitle2,),
                        trailing: InkWell(
                          onTap: () {
                            context.pushRoute(ChatPageRoute(chatId: null))
                                .then((value) {
                              if (context.mounted) {
                                context.read<ChatBotBloc>().add(
                                    const ChatBotEvent
                                        .fetchChatHistoryListEvent());
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 125,
                            height: 34,
                            decoration: BoxDecoration(color: context
                                .scheme()
                                .primary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                appAssets.add.svg(),
                                const SizedBox(width: 5),
                                CustomText(appStrings.newChat,
                                  textAlign: TextAlign.center,
                                  style: context.titleHeadline.copyWith(
                                      color: context
                                          .scheme()
                                          .whiteText),),
                              ],
                            ),),
                        ))
                ),

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(color: context
                          .scheme()
                          .neutralsBorderDivider,
                        indent: 0,
                        endIndent: 0,
                        thickness: 1,),
                      const SizedBox(height: 30,),
                      InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            _showFAQDialog(context, (result) {

                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                            decoration: BoxDecoration(
                              color: context
                                  .scheme()
                                  .neutralsBackground,
                              border: Border.all(color: context
                                  .scheme()
                                  .neutralsBorderDivider, width: 1),
                              borderRadius:
                              BorderRadius.circular(Dimen.defaultRadius),
                            ),
                            child: ListTile(
                              title: CustomText(appStrings.faqTitle,
                                style: context.subheadlineSubheadlineSemibold,),
                              subtitle: CustomText(appStrings.faqSubTitle,
                                style: context.footnoteFootnote.copyWith(
                                    color: context
                                        .scheme()
                                        .secondaryText),),
                              leading: SizedBox(width: 48,
                                  height: 48,
                                  child: Image.asset(appAssets.faq.path)),
                              trailing: SizedBox(width: 28,
                                  height: 28,
                                  child: appAssets.dropDown.svg(
                                      width: 10, height: 6)),
                            ),
                          )
                      ),
                      state.chatBotStatus.isLoading
                          ? const Center()
                          : GroupedListView<ChatHistoryResult, String>(
                        elements: historyList!,
                        shrinkWrap: true,
                        groupBy: (element) =>
                            element.createdDate.toString().substring(0, 10),
                        groupSeparatorBuilder: (dynamic groupByValue) =>
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: CustomText(
                                groupByValue == formatter.format(now) ?
                                appStrings.today
                                    : groupByValue == formatter.format(
                                    now.subtract(const Duration(days: 1)))
                                    ? appStrings.yesterday
                                    : monthList[7]

                                , style: context.titleHeadline,),
                            ),
                        itemBuilder: (context, ChatHistoryResult element) {
                          return ChatHistoryWidget(
                            title: element.lastQuestion!,
                            onTap: () {
                              context.pushRoute(
                                  ChatPageRoute(chatId: element.id));
                            },
                          );
                        },
                        floatingHeader: true,
                        // optional
                        order: GroupedListOrder.DESC, // optional
                      )

                    ],),
                )
            );
          },
        )
    );
  }

  final List<String> monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  Future<void> _showFAQDialog(BuildContext context,
      Function(FaqResult reason) onSelectReason) async {
    FocusScope.of(context).unfocus();
    FaqResult? result = await showModalBottomSheet(
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


