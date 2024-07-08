import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/presentation/widget/custom_text_span.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/presentation/bloc/forgot_pass_bloc.dart';
import 'package:maze_app/feature/auth/login/presentation/bloc/login_bloc.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  final String userName;

  const LoginPage({super.key, required this.userName});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject<LoginBloc>(), child: this),
        BlocProvider(create: (_) => inject<ForgotPassBloc>(), child: this)
      ],
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
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
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state.loginStatus.isSuccess) {

                context.pushRoute(const WelcomePageRoute());
                await Future.delayed(const Duration(seconds: 2));
                if (context.mounted) {
                  context.pushRoute(const BottomNavigationRoute(),);
                }

            } else if (state.loginStatus.isFailure) {
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: CustomText(appStrings.loginTitle,
                      style: context.titleTitle1),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text.rich(CustomTextSpan(
                        textData: appStrings.loginSubTitle,
                        style: context.bodyBody,
                        children: [
                          CustomTextSpan(
                            textData: widget.userName,
                            style: context.bodyBodyMedium,
                          ),
                        ])),
                  ),
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 5,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField.outline(
                    textEditingController: _controller,
                    label: appStrings.password,
                    focusNode: _focusNode,
                    obscureText: true,
                    autoFocus: true,
                    suffix: appAssets.eye.svg()),
                const Spacer(),
                BlocConsumer<ForgotPassBloc, ForgotPassState>(
                  listener: (context, state) {
                    if (state.forgotPassStatus.isSuccess) {
                      context.pushRoute(VerificationCodePageRoute(
                          userId: state.forgotPassResponse!.userId!,
                          userName: widget.userName,
                          entryMode: EntryMode.forgetPassword));
                    } else if (state.forgotPassStatus.isFailure) {
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
                    return CustomButton.outline(
                      text: appStrings.forgotPassword,
                      onPressed: () {
                        context.read<ForgotPassBloc>().add(
                            ForgotPassEvent.forgotPass(email: widget.userName));
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: CustomButton.submit(
                    text: appStrings.continueSteps,
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginEvent.loginUser(
                          email: widget.userName, password: _controller.text));
                    },
                  ),
                ),
              ],
            );
          },
        ));
    ;
  }
}
