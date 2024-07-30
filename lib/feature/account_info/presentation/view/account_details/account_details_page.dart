import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

@RoutePage()
class AccountDetailsPage extends StatefulWidget  {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;
  UserInfo? userInfo;
  String? _birthDate;
  final List<DateTime?> _dialogCalendarPickerValue = [
    DateTime.now().add(const Duration(days: 1)),

  ];


  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(true);
    userInfo=inject<UserInfo>();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

    double w = MediaQuery
        .of(context)
        .size
        .width;

    double h = MediaQuery
        .of(context)
        .size
        .height;


    return BasePageWidget(
        resizeToAvoidBottomInset: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                appStrings.accountDtlTitle, style: context.titleTitle1,),
              const SizedBox(height: 20,),
              LinearPercentIndicator(progressColor: context
                  .scheme()
                  .progress,
              padding:const EdgeInsets.all(1),
                animation: true,
                barRadius: const Radius.circular(99),
                lineHeight: 8.0,
                animationDuration: 2000,
                percent: 0.25,
                animateFromLastPercent: true,
                backgroundColor: context
                    .scheme()
                    .neutralsBorderDivider,
                restartAnimation: false,

              ),
              const SizedBox(height: 40,),
              CustomText(
                appStrings.accountDtlSuTitle, style: context.bodyBody,),
              const SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w * 0.45,
                    child: CustomTextField.outline(
                      textEditingController: _firstNameController,
                      label: appStrings.firstName,
                      focusNode: _focusNode1,
                      labelTextColor: context
                          .scheme()
                          .secondaryText,
                     )),

                  SizedBox(
                      width: w * 0.45,
                      child: CustomTextField.outline(
                        textEditingController: _lastNameController,
                        label: appStrings.lastName,
                        focusNode: _focusNode2,
                        labelTextColor: context
                            .scheme()
                            .secondaryText,

                      )),
                ],
              ),
              const SizedBox(height: 20,),
              CustomTextField.outline(textEditingController: _birthDateController,
                label: appStrings.birthday,
                focusNode: _focusNode3,
                labelTextColor: context
                    .scheme()
                    .secondaryText,
                readOnly: true,

               onTap: (){
                 _selectDate(context,(date) {
                   _birthDateController.text='${date![0]!.day} ${monthList[date![0]!.month-1]} ${date![0]!.year}';
                      _birthDate='${date![0]!.year}/${date![0]!.month}/${date![0]!.day}';

                 });
               },
              ),

            (!_keyboardVisibilityValueNotifier.value)? const Spacer(): SizedBox(height: 0.04*h,),
              ListTile(
                title: CustomText(
                  appStrings.showBirthday,
                  style: context.footnoteFootnote,
                ),
                leading: IconButton(
                  icon: appAssets.eyeSlash.svg(),
                  onPressed: () {},
                ),
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0.0,


              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomButton.submit(
                  text: appStrings.continueSteps,
                  onPressed: () {
                      userInfo?.firstName = _firstNameController.text;
                      userInfo?.lastName = _lastNameController.text;
                      userInfo?.birthDate = _birthDate;
                      context.pushRoute(
                          AccountProfilePageRoute(userInfo: userInfo!));
                  },),
              ),

            ],),
        ));
  }


  Future<void> _selectDate( BuildContext context,Function(List<DateTime?>? date) onSelectDate) async {
      final date = (await showCalendarDatePicker2Dialog(
        context: context,
        config: config,
        dialogSize: const Size(325, 370),
        borderRadius: BorderRadius.circular(15),
        value: _dialogCalendarPickerValue,
        dialogBackgroundColor: Colors.white,
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