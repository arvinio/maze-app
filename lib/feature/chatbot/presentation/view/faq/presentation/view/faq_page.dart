import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/presentation/widget/bottom_sheet_header.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_dialog_content.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/login/data/model/enum/role.dart';
import 'package:maze_app/feature/chatbot/data/model/faq_response/faq_response.dart';
import 'package:maze_app/feature/chatbot/presentation/view/faq/presentation/bloc/faq_bloc.dart';
import 'package:maze_app/feature/chatbot/presentation/view/faq/presentation/view/crud_faq_dialog_content.dart';

class FaqPage extends StatefulWidget implements AutoRouteWrapper {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<FaqBloc>(), child: this);
  }
}

class _FaqPageState extends State<FaqPage> {
  double dialogHeightPercent = 0.9;
  bool? isAdmin;
  final List<int>? list = [];
  List<ValueNotifier<bool>>? obscureState;


  @override
  void initState() {
    super.initState();
    _fetchFaqList(context);
    isAdmin = inject<SettingsManager>().getRole() == Role.admin;
  }

  _fetchFaqList(BuildContext context) {
    context.read<FaqBloc>().add(const FaqEvent.fetchFaqListEvent());
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return CustomDialogContent(
      header: '',
      dialogHeightPercent: 0.92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 15),
              child: isAdmin!
                  ? ListTile(
                  leading: CustomText(appStrings.faqTitle,
                      style: context.titleTitle1.copyWith(
                          color: const Color(0xff0A0A0A))),
                  trailing:
                  InkWell(
                    onTap: () {
                      _showCrudFaqDialog(context, null);
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
                          CustomText(appStrings.newFaq,
                            textAlign: TextAlign.center,
                            style: context.titleHeadline.copyWith(
                                color: context
                                    .scheme()
                                    .whiteText),),
                        ],
                      ),),
                  )

              )
                  : CustomText(appStrings.faqTitle,
                  style: context.titleTitle1.copyWith(
                      color: const Color(0xff0A0A0A)))
          ),
          BlocBuilder<FaqBloc, FaqState>(builder: (context, state) {
            if (state.faqStatus.isLoading) {
              return loadingWidget(context);
            }
            else if (state.faqStatus.isDeleted) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              _fetchFaqList(context);
              return loadingWidget(context);
            }
            else if (state.faqStatus.isLoadFaqs) {
              obscureState = List.generate(
                  state.fetchedFaqs!.length, (index) =>
                  ValueNotifier(false));

              return state.fetchedFaqs!.isNotEmpty
                  ? SizedBox(
                height: h * 0.7,

                child: Padding(
                  padding:
                  const EdgeInsets.only(
                      left: 22.0, right: 24, top: 15, bottom: 0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.fetchedFaqs!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ValueListenableBuilder(
                          valueListenable: obscureState![index],
                          builder: (BuildContext context,
                              bool obscureValue,
                              Widget? child) {
                            FaqResult? faq=state.fetchedFaqs![index];

                            return !obscureState![index].value
                                ? buildFaqQuestion(
                                context,index,state, faq)
                                : buildShowAnswer(
                                context, index, state,faq);
                          }
                      );
                    },
                    separatorBuilder: (BuildContext context,
                        int index) {
                      return const SizedBox(height: 15,);
                    },

                  ),
                ),
              ) : emptyListWidget();
            }
            else if (state.faqStatus.isFailure) {
              return _failureModeWidget(context);
            } else {
              return Container();
            }
          })
        ],),
    );
  }

  Container buildFaqQuestion(BuildContext context, int index,FaqState state, FaqResult? faq) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 5, 5, 10),
      decoration: BoxDecoration(border: Border.all(color: context
          .scheme()
          .neutralsBorderDivider),
        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
      ),
      child: ListTile(
        onTap: () {
          obscureState![index].value = !obscureState![index].value;
        },
        title: CustomText(faq!.question!,
            style: context.bodyBodyMedium),
        trailing: isAdmin!
            ? InkWell(
            onTap: () {
              _showFaqAdminAccessDialog(
                  context, index, state, faq.id!);
            },
            child: appAssets.more.svg(width: 24, height: 24))
            : appAssets.dropDown.svg(width: 24, height: 24),
        contentPadding: EdgeInsets.zero,
      ),

    );
  }

  Container buildShowAnswer(BuildContext context, int index, FaqState state, FaqResult? faq) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 5, 5, 10),
      decoration: BoxDecoration(border: Border.all(color: context
          .scheme()
          .neutralsBorderDivider),
        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              obscureState![index].value = !obscureState![index].value;
            },
            title: CustomText(faq!.question!,
                style: context.bodyBodyMedium),
            trailing: appAssets.dropUp.svg(width: 24, height: 24),
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 3),
            child: Divider(color: context
                .scheme()
                .neutralsBorderDivider, thickness: 1,),
          ),
          const SizedBox(height: 15,),
          CustomText(faq.answer!,
              style: context.bodyCallout),
          const SizedBox(height: 5,),

        ],
      ),
    );
  }

  void _showFaqAdminAccessDialog(BuildContext context, int index,
      FaqState state, String id) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.35,
            child: Column(children: [
              CustomMenuItems(
                title: appStrings.edit,
                leading: appAssets.editProfile
                    .svg(color: context
                    .scheme()
                    .primaryText),
                onTap: () {
                  _showCrudFaqDialog(context, id);
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
                title: appStrings.delete,
                titleColor: context
                    .scheme()
                    .error,
                leading: appAssets.delete
                    .svg(color: context
                    .scheme()
                    .primaryText),

                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: context
                        .scheme()
                        .neutralsBorderDivider,
                    builder: (_) =>
                        AlertDialog(
                          title: CustomText(
                              '${appStrings.deleteFaq}?'),
                          content: CustomText(appStrings.sureLogout),

                          actions: [
                            SizedBox(width: 100, height: 50,
                                child: CustomButton.submit(
                                    text: 'Yes',
                                    showLoading: state.faqStatus
                                        .isLoading,
                                    onPressed: () {
                                      context.read<FaqBloc>().add(
                                          FaqEvent.deleteFaqEvent(id: id));
                                    })),
                            SizedBox(width: 100,
                                height: 50,
                                child: CustomButton.outline(
                                    text: 'No', onPressed: () {
                                  Navigator.of(context).pop();
                                }))

                          ],
                          elevation: 24,
                          backgroundColor: context
                              .scheme()
                              .neutralsBackground,

                        ),
                    barrierDismissible: false,
                  );
                },
              ),

            ],),
          );
        });
    // else toast
  }

  void _showCrudFaqDialog(BuildContext context, String? id) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return CrudFaqDialogContent(id: id,).wrappedRoute(context);
        });
    // else toast
  }

  Expanded emptyListWidget() {
    return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(appStrings.emptyList, textAlign: TextAlign.center,
                style: context.titleHeadline.copyWith(color: context
                    .scheme()
                    .disabledText),),
              const SizedBox(height: 28),
            ],
          ),
        ));
  }

  Expanded loadingWidget(BuildContext context) {
    return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 38,
                height: 38,
                child: CircularProgressIndicator(
                    strokeWidth: 3.8,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Theme
                        .of(context)
                        .primaryColor)),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ));
  }

  _failureModeWidget(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              appStrings.errorFetchInformation,
              style: context.titleTitle2.copyWith(color: context
                  .scheme()
                  .primariesShade03, height: 1.3),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton.submit(
              text: appStrings.tryAgain,
              textFontSize: 15,
              horizontalPadding: 20,
              minSize: 42,
              onPressed: () {
                _fetchFaqList(context);
              },
              isFullWidth: false,
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

}

