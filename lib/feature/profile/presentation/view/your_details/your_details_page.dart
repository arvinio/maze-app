import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_loading.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_loading.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/profile/data/model/edit_details_request/edit_details_request.dart';
import 'package:maze_app/feature/profile/presentation/bloc/profile_bloc.dart';

@RoutePage()
class YourDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  const YourDetailsPage({super.key});

  @override
  State<YourDetailsPage> createState() => _YourDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ProfileBloc>(), child: this);
  }
}

class _YourDetailsPageState extends State<YourDetailsPage> {
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _dateFocusNode = FocusNode();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? _birthDate;
  late  List<DateTime?> _dialogCalendarPickerValue;
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;


  @override
  void initState() {
    super.initState();
    _dialogCalendarPickerValue = [
    DateTime.now().add(const Duration(days: 1))];
    _keyboardVisibilityValueNotifier = ValueNotifier(false);
    context.read<ProfileBloc>().add(const ProfileEvent.getProfileEvent());
  }

  @override
  void dispose() {
    _firstNameFocusNode.unfocus();
    _lastNameFocusNode.unfocus();
    _dateFocusNode.unfocus();
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
    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;


    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.profileStatus.isSuccess) {
          if(state.response!.firstName !=null) {
            _firstNameController.text = state.response!.firstName!;
          }
          if(state.response!.lastName !=null) {
            _lastNameController.text = state.response!.lastName!;
          }
          if(state.response!.birthDate !=null) {
            _dateController.text =
            '${state.response!.birthDate!.day} ${monthList[state.response!
                .birthDate!.month - 1]} ${state.response!.birthDate!
                .year}';
            _birthDate =
            '${state.response!.birthDate!.year}/${state.response!
                .birthDate!.month}/${state.response!.birthDate!.day}';

            _dialogCalendarPickerValue=[state.response!.birthDate!];
          }

        } else if (state.profileStatus.isEditProfileSuccess) {

          Fluttertoast.showToast(msg: appStrings.yourDetailsUpdatedMsg,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        else if (state.profileStatus.isEditProfileFailure) {
          Fluttertoast.showToast(msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
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
                    appStrings.yourDetails, style: context.titleHeadline,
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
                        EditDetailsRequest detailsParam = EditDetailsRequest(
                          firstName: _firstNameController.text.trim(),
                          lastName: _lastNameController.text.trim(),
                          birthDate: _birthDate,
                        );
                        context.read<ProfileBloc>().add(
                            ProfileEvent.editProfileDetailEvent(
                                detailsParam: detailsParam));
                      }))),

            child: state.profileStatus.isLoading
            ? const CustomLoading()
            :Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 10),
                CustomTextField.outline(label: appStrings.firstName,
                  textEditingController: _firstNameController,
                  focusNode: _firstNameFocusNode,
                ),
                const SizedBox(height: 20),
                CustomTextField.outline(label: appStrings.lastName,
                  textEditingController: _lastNameController,
                  focusNode: _lastNameFocusNode,
                ),
                const SizedBox(height: 20),
                CustomTextField.outline(
                  label: appStrings.birthday,
                  textEditingController: _dateController,
                  focusNode: _dateFocusNode,
                  readOnly: true,
                  labelTextColor: context
                      .scheme()
                      .secondaryText,
                  onTap: () {
                    _selectDate(context, (date) {
                      _dialogCalendarPickerValue=date!;

                      _dateController.text =
                      '${date![0]!.day} ${monthList[date![0]!.month -
                          1]} ${date![0]!.year}';
                      _birthDate =
                      '${date![0]!.year}/${date![0]!.month}/${date![0]!
                          .day}';
                    });
                  },

                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    title: CustomText(
                      appStrings.notPublicShow,
                      style: context.footnoteFootnote,
                    ),
                    leading: IconButton(
                      icon: appAssets.eyeSlash.svg(),
                      onPressed: () {},
                    ),
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0.0,


                  ),
                ),

              ],

            )
        );
      },
    );
  }


  Future<void> _selectDate(BuildContext context,
      Function(List<DateTime?>? date) onSelectDate) async {
    final date = (await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      dialogSize: const Size(325, 370),
      borderRadius: BorderRadius.circular(15),
      value: _dialogCalendarPickerValue,
      dialogBackgroundColor: Colors.white


    ));

    if (date != null) onSelectDate(date);
  }

  final config = CalendarDatePicker2WithActionButtonsConfig(
    calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
    calendarType: CalendarDatePicker2Type.single,
    selectedDayHighlightColor: const Color(0xff5AA700),
    closeDialogOnCancelTapped: true,
    firstDayOfWeek: 1,
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    centerAlignModePicker: true,
    customModePickerIcon: const SizedBox(),

  );

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
}