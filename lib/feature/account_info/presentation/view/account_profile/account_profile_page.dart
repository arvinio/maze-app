import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


@RoutePage()
class AccountProfilePage extends StatefulWidget  {
  UserInfo? userInfo;

  AccountProfilePage({super.key,required
  this.userInfo});


  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;
  final _focusNode = FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  XFile? _file;
  Uint8List? _image;

  void selectImage() async {
    _file = await pickImage(ImageSource.gallery);
    if(_file!=null)
    {
      _image = await _file!.readAsBytes();
    }
  }

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(true);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisibilityValueNotifier.value = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0;

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

        child: SingleChildScrollView(
          child: SizedBox(
            height:(! _keyboardVisibilityValueNotifier.value) ?0.9*h: 0.65*h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  appStrings.yourProfileTitle, style: context.titleTitle1,),
                SizedBox(height:(! _keyboardVisibilityValueNotifier.value) ? 40:20,),
                LinearPercentIndicator(progressColor: context
                    .scheme()
                    .progress,
                  padding:const EdgeInsets.all(1),
                  animation: true,
                  barRadius: const Radius.circular(99),
                  lineHeight: 8.0,
                  animationDuration: 2000,
                  percent: 0.5,
                  animateFromLastPercent: true,
                  backgroundColor: context
                      .scheme()
                      .neutralsBorderDivider,
                  restartAnimation: false,

                ),
                SizedBox(height: (! _keyboardVisibilityValueNotifier.value) ? 40:20,),
                CustomText(
                  appStrings.yourProfileSubTitle, style: context.bodyBody,),
                SizedBox(height: (! _keyboardVisibilityValueNotifier.value) ? 30:20,),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 136,
                        height: 136,
                        child: _image!=null
                            ? CircleAvatar(
                          radius: 100,
                          backgroundImage: MemoryImage( _image! ),
                        )
                            : CircleAvatar(
                          backgroundColor: context.scheme().disabledText,
                          radius: 100,
                          child: appAssets.avatar.svg(width: 100, height: 100,color: context.scheme().neutralsBackground),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(icon: appAssets.floatingActionButtons.svg(),onPressed: () { selectImage(); }, ),
                      )
                    ],),
                ),

                const SizedBox(height: 20,),
                CustomTextField.outline(
                  textEditingController: _userNameController,
                  label: appStrings.userName,
                  focusNode: _focusNode,
                  labelTextColor: context
                      .scheme()
                      .secondaryText,
                ),
                (! _keyboardVisibilityValueNotifier.value)? const Spacer():SizedBox(height: 0.01*h,),
                ListTile(
                  title: CustomText(
                    appStrings.showPublicProfile,
                    style: context.footnoteFootnote,
                  ),
                  leading: IconButton(
                    icon: appAssets.eye.svg(),
                    onPressed: () {},
                  ),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0.0,
                ),
                Padding(
                  padding:  const EdgeInsets.only(bottom: 16),
                  child: CustomButton.submit(
                      text: appStrings.continueSteps,
                      onPressed: () {
                        widget.userInfo!.username = _userNameController.text;
                        if (_file != null) {
                          widget.userInfo!.avatar = File(_file!.path!);
                        }

                        context.pushRoute(
                            AccountNotificationPageRoute(
                                userInfo: widget.userInfo));
                      }),
                ),

              ],),
          ),
        ));
  }

  Future<XFile?> pickImage(ImageSource source) async{
    final ImagePicker imagePicker=ImagePicker();
    XFile? file=await imagePicker.pickImage(source: source);
    if(file!=null)
    {

      return file;
    }
    print('No Images Selected');
  }


}
