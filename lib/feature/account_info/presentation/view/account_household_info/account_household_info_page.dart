import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/account_info/data/model/account_info_response.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';
import 'package:maze_app/feature/account_info/presentation/bloc/account_info_bloc.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/council_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/country_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/household_size_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/household_size_info_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/state_dialog_content.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


@RoutePage()
class AccountHouseholdInfoPage extends StatefulWidget  implements AutoRouteWrapper{
  UserInfo? userInfo;
   AccountHouseholdInfoPage({super.key,required this.userInfo});

  @override
  State<AccountHouseholdInfoPage> createState() => _AccountHouseholdInfoPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<AccountInfoBloc>(), child: this);

  }
}

class _AccountHouseholdInfoPageState extends State<AccountHouseholdInfoPage> {

  final focusNodeCountry = FocusNode();
  final focusNodeState = FocusNode();
  final focusNodeCouncil = FocusNode();
  final focusNodePostcode = FocusNode();
  final focusNodeSize = FocusNode();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController councilController = TextEditingController();
  final TextEditingController postcodeController = TextEditingController();
  final TextEditingController householdSizeController = TextEditingController();
  String? countryId;
  String? stateId;
  bool stateEnable=false;
  bool councilEnable=false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    councilController.dispose();
    postcodeController.dispose();
    householdSizeController.dispose();
    focusNodeCountry.dispose();
    focusNodeState.dispose();
    focusNodeCouncil.dispose();
    focusNodePostcode.dispose();
    focusNodeSize.dispose();
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

        child: BlocConsumer<AccountInfoBloc, AccountInfoState>(
          listener: (context, state) async {
            switch (state.infoStatus) {
              case AccountInfoStatus.notifyChangeFieldsValue:
                {
                  if (state.entryMode == EntryMode.fetchCountryList) {
                    countryController.text = state.selectedResult!.name!;
                    countryId = state.selectedResult!.id!;
                    stateEnable=true;
                  } else if (state.entryMode == EntryMode.fetchStateList) {
                    stateController.text = state.selectedResult!.name!;
                    stateId = state.selectedResult!.id!;
                    councilEnable=true;
                  } else if (state.entryMode == EntryMode.fetchCouncilList) {
                    councilController.text = state.selectedResult!.name!;
                    countryId = state.selectedResult!.id!;
                  }
                  break;
                }
              case AccountInfoStatus.loadAllStateList:
              // TODO: Handle this case.
              case AccountInfoStatus.loadAllCouncilList:
              // TODO: Handle this case.
              case AccountInfoStatus.init:
                break;
              case AccountInfoStatus.loading:
                break;

              case AccountInfoStatus.loadAllCountryList:
                break;

              case AccountInfoStatus.fetchFailure:
                break;

              case AccountInfoStatus.registerSuccess:
                {
                  context.pushRoute(const WelcomeAccountSetupPageRoute());
                  await Future.delayed(const Duration(seconds: 2));
                  if (context.mounted) {
                    context.pushRoute(const BottomNavigationRoute(),);
                  }

                }

              case AccountInfoStatus.registerFailure:
                Fluttertoast.showToast(
                  msg:state.errorMessage!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      appStrings.householdTitle, style: context.titleTitle1,),
                    const SizedBox(height: 20,),
                    LinearPercentIndicator(
                      progressColor: context
                          .scheme()
                          .progress,
                      padding: const EdgeInsets.all(1),
                      animation: true,
                      barRadius: const Radius.circular(99),
                      lineHeight: 8.0,
                      animationDuration: 2000,
                      percent: 1,
                      animateFromLastPercent: true,
                      backgroundColor: context
                          .scheme()
                          .neutralsBorderDivider,
                      restartAnimation: false,

                    ),
                    const SizedBox(height: 30,),
                    CustomText(
                      appStrings.householdSubTitle, style: context.bodyBody,),
                    const SizedBox(height: 30,),

                    CustomTextField.outline(
                      textEditingController: countryController,
                      label: appStrings.country,
                      focusNode: focusNodeCountry,
                      readOnly: false,
                      suffixIcon: Padding(padding: const EdgeInsets.all(7),
                          child: appAssets.dropDown.svg(width: 10, height: 10)),
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                      onTap: () {
                        _showCountryDialog(context, (result) {
                          setSelectedResultToState(
                              result, EntryMode.fetchCountryList);
                        });
                      },
                    ),
                    const SizedBox(height: 14),

                    CustomTextField.outline(
                      textEditingController: stateController,
                      label: appStrings.state,
                      focusNode: focusNodeState,
                      readOnly: true,
                      enabled: stateEnable,
                      suffixIcon: Padding(padding: const EdgeInsets.all(7),
                          child: appAssets.dropDown.svg(width: 10, height: 10)),
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                      onTap: () {
                        _showStateDialog(context, (result) {
                          setSelectedResultToState(
                              result, EntryMode.fetchStateList);
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    CustomTextField.outline(
                      textEditingController: councilController,
                      label: appStrings.council,
                      focusNode: focusNodeCouncil,
                      readOnly: true,
                      enabled: councilEnable,
                      suffixIcon: Padding(padding: const EdgeInsets.all(7),
                          child: appAssets.dropDown.svg(width: 10, height: 10)),
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                      onTap: () {
                        _showCouncilDialog(context, (result) {
                          setSelectedResultToState(
                              result, EntryMode.fetchCouncilList);
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    CustomTextField.outline(
                      textEditingController: postcodeController,
                      label: appStrings.postcode,
                      focusNode: focusNodePostcode,
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField.outline(
                      textEditingController: householdSizeController,
                      label: appStrings.householdSize,
                      focusNode: focusNodeSize,
                      readOnly: true,
                      suffixIcon:  InkWell(
                        onTap: (){
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (builder) {
                                return const HouseholdSizeInfoDialogContent();
                              });
                        },
                        child: Padding(padding:const EdgeInsets.all(10),
                            child: appAssets.infoCircle.svg(width: 5, height: 5)),
                      ),
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                      onTap: () {
                        _showSizeDialog(context, (result) {
                          householdSizeController.text = result;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.12, bottom: 16),
                      child: CustomButton.submit(
                        text: appStrings.accountCreation,
                        onPressed: () {
                          widget.userInfo!.country = countryController.text;
                          widget.userInfo!.state = stateController.text;
                          widget.userInfo!.council = councilController.text;
                          widget.userInfo!.postcode = postcodeController.text;
                          if(householdSizeController.text.isNotEmpty) {
                            widget.userInfo!.householdSize =int.parse(
                                householdSizeController.text.substring(0,1));
                            context.read<AccountInfoBloc>().add(
                                AccountInfoEvent.registerDetailsEvent(userInfoParam:  widget.userInfo!));

                          }else
                          {
                            Fluttertoast.showToast(
                              msg:'householdSize must not be less than 1',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }

                        },),
                    ),

                  ],),
              ),
            );
          },
        ));
  }


  Future<void> _showCountryDialog(BuildContext context,
      Function(Result reason) onSelectReason) async {
    FocusScope.of(context).unfocus();
    Result? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const CountryDialogContent().wrappedRoute(context);
        });
    if (result != null) onSelectReason(result);
    // else toast
  }

  Future<void> _showStateDialog(BuildContext context,
      Function(Result reason) onSelectReason) async {
    FocusScope.of(context).unfocus();
    Result? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return SateDialogContent(countryId: countryId).wrappedRoute(context);
        });
    if (result != null) onSelectReason(result);
    // else toast
  }

  Future<void> _showCouncilDialog(BuildContext context,
      Function(Result reason) onSelectReason) async {
    FocusScope.of(context).unfocus();
    Result? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return CouncilDialogContent(stateId: stateId).wrappedRoute(context);
        });
    if (result != null) onSelectReason(result);
    // else toast
  }

  Future<void> _showSizeDialog(BuildContext context,
      Function(String reason) onSelectReason) async {
    FocusScope.of(context).unfocus();
    String? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const HouseholdSizeDialogContent();
        });

    if (result != null) onSelectReason(result);
  }

  void setSelectedResultToState(result, EntryMode entryMode) {
    context.read<AccountInfoBloc>().add(
        AccountInfoEvent.setSelectedResultEvent(result, entryMode));
  }
}

