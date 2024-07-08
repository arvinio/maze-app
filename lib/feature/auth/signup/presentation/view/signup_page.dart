import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_text_span.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/auth/signup/presentation/bloc/signup_bloc.dart';


@RoutePage()
class SignupPage extends StatefulWidget implements AutoRouteWrapper {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<SignupBloc>(), child: this);

  }
}

class _SignupPageState extends State<SignupPage> {
  final _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(true);

  }

  @override
  void dispose() {
    _textController.dispose();
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
      resizeToAvoidBottomInset:false,
      child:BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if(state.signupStatus.isSuccess){
                 context.pushRoute(VerificationCodePageRoute(
                userName: _textController.text.trim(),
                userId: state.signupResponse!.userId!,
                entryMode: EntryMode.accountCreation
            ));
          }
          else  if(state.signupStatus.isRegister){
                context.pushRoute(LoginPageRoute(
              userName: _textController.text.trim(),
            ));
          }
          else  if (state.signupStatus.isFailure) {
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
    return SingleChildScrollView(
        child: SizedBox(
          height: h * 0.95,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: (!_keyboardVisibilityValueNotifier.value) ? 139 : 53,
                    bottom: 12),
                 // child:appAssets.appIcon.svg()
                  child: Image.asset(
                    'assets/icons/app.png',
                      width:(!_keyboardVisibilityValueNotifier.value)?150:100

                  ),
              ),
              ListTile(
                  title: CustomText(
                    appStrings.mazeComposting, textAlign: TextAlign.center,
                    style: context.titleTitle1,),
                  subtitle: CustomText(appStrings.doNotHaveAnAccountMsg,
                      textAlign: TextAlign.center,
                      style: context.bodyBody)
        
              ),
              SizedBox(height: !_keyboardVisibilityValueNotifier.value ? 66 : 38),
              CustomTextField.outline(textEditingController: _textController,
                label: appStrings.email,
                focusNode: _focusNode,
                labelTextColor: context
                    .scheme()
                    .secondaryText,
              ),
              const SizedBox(height: 16,),
              CustomButton.submit(
                text: appStrings.continueSteps,
                showLoading: state.signupStatus.isLoading,
                onPressed: () {
                  context.read<SignupBloc>().add(
                      SignupEvent.init(userName: _textController.text.trim()));
                },),
              const SizedBox(height: 16,),
              Visibility(
                visible: !_keyboardVisibilityValueNotifier.value,
                child: CustomButton.outline(
                  text: appStrings.loginAsGuest, onPressed: () {
                },),
              ),
              (!_keyboardVisibilityValueNotifier.value)
                  ? const Spacer()
                  : const Center(),
              Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text.rich(textAlign: TextAlign.center,
                      CustomTextSpan(textData: appStrings.agreeMessage,
                          children: [
                            CustomTextSpan(textData: appStrings.termsOfService,
                                style: context.footnoteFootnoteBold.copyWith(
                                    color: context
                                        .scheme()
                                        .primary)),
                            CustomTextSpan(textData: 'and'),
                            CustomTextSpan(textData: appStrings.privacyPolicy,
                                style: context.footnoteFootnoteBold.copyWith(
                                    color: context
                                        .scheme()
                                        .primary))
                          ]))
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }

}
