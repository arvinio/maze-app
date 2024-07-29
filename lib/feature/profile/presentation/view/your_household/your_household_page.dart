import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_loading.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/account_info/data/model/account_info_response.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/council_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/country_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/household_size_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/household_size_info_dialog_content.dart';
import 'package:maze_app/feature/account_info/presentation/widgets/state_dialog_content.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/profile/data/model/edit_household_request/edit_household_request.dart';
import 'package:maze_app/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:maze_app/feature/profile/presentation/widgets/council_bin_dialog_content.dart';


@RoutePage()
class YourHouseholdPage extends StatefulWidget implements AutoRouteWrapper {
  const YourHouseholdPage({super.key});

  @override
  State<YourHouseholdPage> createState() => _YourHouseholdPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ProfileBloc>(), child: this);
  }
}

class _YourHouseholdPageState extends State<YourHouseholdPage> {

  final focusNodeCountry = FocusNode();
  final focusNodeState = FocusNode();
  final focusNodeCouncil = FocusNode();
  final focusNodePostcode = FocusNode();
  final focusNodeSize = FocusNode();
  final focusNodeCouncilBin = FocusNode();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController councilController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController householdSizeController = TextEditingController();
  final TextEditingController councilBinController = TextEditingController();

  String? countryId;
  String? stateId;
  bool stateEnable = false;
  bool councilEnable = false;
  List<String> size=[
    "1 member",
    "2 members",
    "3 members",
    '4 members',
    '5 members'];

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.getProfileEvent());
  }

  @override
  void dispose() {
    countryController.dispose();
    councilController.dispose();
    postCodeController.dispose();
    householdSizeController.dispose();
    councilBinController.dispose();
    focusNodeCountry.dispose();
    focusNodeState.dispose();
    focusNodeCouncil.dispose();
    focusNodePostcode.dispose();
    focusNodeSize.dispose();
    focusNodeCouncilBin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state.profileStatus.isSuccess) {
          /*countryId = state.response!.countryId!;
          stateId = state.selectedResult!.id!;*/
          countryController.text=state.response!.country!.isNotEmpty ?state.response!.country! :'';
          stateController.text=state.response!.state!.isNotEmpty ? state.response!.state! :'';
          councilController.text=state.response!.council!.isNotEmpty ? state.response!.council!:'';
          postCodeController.text=state.response!.postcode!.isNotEmpty  ? state.response!.postcode! :'';
          householdSizeController.text=size[state.response!.householdSize!-1];
          councilBinController.text=state.response!.measurementSystem!.isNotEmpty ? state.response!.measurementSystem!:'';
        }
        if(state.profileStatus.isNotifyChangeFieldsValue) {
          if (state.entryMode == EntryMode.fetchCountryList) {
            countryController.text = state.selectedResult!.name!;
            countryId = state.selectedResult!.id!;
            stateEnable = true;
          } else if (state.entryMode == EntryMode.fetchStateList) {
            stateController.text = state.selectedResult!.name!;
            stateId = state.selectedResult!.id!;
            councilEnable = true;
          } else if (state.entryMode == EntryMode.fetchCouncilList) {
            councilController.text = state.selectedResult!.name!;
          }
        }
        else if (state.profileStatus.isEditProfileSuccess){
          Fluttertoast.showToast(msg: appStrings.householdUpdatedMsg,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);

        }  else if (state.profileStatus.isEditProfileFailure) {
          Fluttertoast.showToast(msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);

        }

        else if (state.profileStatus.isFailure) {
          Fluttertoast.showToast(msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
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
              padding: const EdgeInsets.fromLTRB(0, 42, 0, 16),
              child:   ListTile(
                  title: CustomText(
                    appStrings.yourHousehold, style: context.titleHeadline,
                    textAlign: TextAlign.center,),
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.only(left: 20,right: 20),
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: appAssets.arrowLeft.svg(width: 24, height: 24)),
                  trailing: TextButton(child: CustomText(appStrings.save,
                      style: context.titleHeadline.copyWith(color: context
                          .scheme()
                          .primary)),
                      onPressed: () {

                        EditHouseholdRequest houseHolParam = EditHouseholdRequest(
                          country: countryController.text.trim(),
                          state: stateController.text.trim(),
                          council: councilController.text.trim(),
                          postcode: postCodeController.text.trim(),
                          householdSize: int.parse(householdSizeController.text.substring(0,1)),
                          measurementSystem: councilBinController.text.trim(),
                        );
                        context.read<ProfileBloc>().add(
                            ProfileEvent.editHouseholdInfoEvent(
                                householdParam: houseHolParam));
                      })
              ),

            ),
            child: state.profileStatus.isLoading
                ?  const CustomLoading()
            :SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField.outline(
                      textEditingController: countryController,
                      label: appStrings.countryLocation,
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
                      label: appStrings.stateLocation,
                      focusNode: focusNodeState,
                      readOnly: true,
                      enabled: stateController.text.isNotEmpty || stateEnable,
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
                      label: appStrings.councilBelong,
                      focusNode: focusNodeCouncil,
                      readOnly: true,
                      enabled:councilController.text.isNotEmpty || councilEnable,
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
                      textEditingController: postCodeController,
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
                      suffixIcon: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (builder) {
                                return const HouseholdSizeInfoDialogContent();
                              });
                        },
                        child: Padding(padding: const EdgeInsets.all(10),
                            child: appAssets.infoCircle.svg(
                                width: 5, height: 5)),
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
                    const SizedBox(height: 14),

                    CustomTextField.outline(
                      textEditingController: councilBinController,
                      label: appStrings.councilBin,
                      focusNode: focusNodeCouncilBin,
                      readOnly: true,
                      suffixIcon: Padding(padding: const EdgeInsets.all(7),
                          child: appAssets.dropDown.svg(width: 10, height: 10)),
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                      onTap: () {
                        _showCouncilBinDialog(context, (result) {
                          councilBinController.text = result;
                        });
                      },
                    ),
                  ],),
              ),
            )
        );
      },
    );
  }


  Future<void> _showCountryDialog(BuildContext context,
      Function(Result result) onSelectResult) async {
    FocusScope.of(context).unfocus();
    Result? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const CountryDialogContent().wrappedRoute(context);
        });
    if (result != null) onSelectResult(result);
    // else toast
  }

  Future<void> _showStateDialog(BuildContext context,
      Function(Result result) onSelectResult) async {
    FocusScope.of(context).unfocus();
    Result? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return SateDialogContent(countryId: countryId).wrappedRoute(context);
        });
    if (result != null) onSelectResult(result);
    // else toast
  }

  Future<void> _showCouncilBinDialog(BuildContext context,
      Function(String strResult) onSelectResult) async {
    FocusScope.of(context).unfocus();
    String? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const CouncilBinDialogContent();
        });
    if (result != null) onSelectResult(result);
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
      Function(String strResult) onSelectResult) async {
    FocusScope.of(context).unfocus();
    String? result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const HouseholdSizeDialogContent();
        });

    if (result != null) onSelectResult(result);
  }

  void setSelectedResultToState(result, EntryMode entryMode) {
    context.read<ProfileBloc>().add(
        ProfileEvent.setSelectedResultEvent(result, entryMode));
  }
}

