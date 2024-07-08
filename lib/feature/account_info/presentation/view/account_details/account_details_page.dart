import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                 _selectDate();
               },
              ),
              /* CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.multi,
              ),
             // value: _dates,
              //onValueChanged: (dates) => _dates = dates,
            ),)*/

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
                    userInfo?.firstName=_firstNameController.text;
                    userInfo?.lastName=_lastNameController.text;
                    userInfo?.birthDate='1985/10/02';//_birthDate
                    context.pushRoute( AccountProfilePageRoute(userInfo: userInfo!));
                  },),
              ),

            ],),
        ));
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), lastDate: DateTime(2100),);
    if (_picked != null) {
      _birthDateController.text =
      '${_picked.day} ${monthList[_picked.month]} ${_picked.year}';
     _birthDate='${_picked.year}/${_picked.month}/${_picked.day}' ;
    }
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

}