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
import 'package:maze_app/feature/auth/create_password/presentation/bloc/create_pass_bloc.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';

@RoutePage()
class CreatePasswordPage extends StatefulWidget implements AutoRouteWrapper {
  final EntryMode entryMode;
  final String email;
  const CreatePasswordPage(
      {super.key, required this.entryMode, required this.email});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<CreatePassBloc>(), child: this);
  }
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  ValueNotifier<bool> obscureState = ValueNotifier(false);

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
        child: BlocConsumer<CreatePassBloc, CreatePassState>(
          listener: (context, state) {
            if (state.createPassStatus.isSuccess) {
                (widget.entryMode.isAccountCreation)
                    ? context.pushRoute(const AccountDetailsPageRoute())
                    : context.router.replaceAll([const BottomNavigationRoute()]);

            } else if (state.createPassStatus.isFailure) {
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: CustomText(
                      (widget.entryMode.isAccountCreation)
                          ? appStrings.createPasswordTitle
                          : appStrings.newPasswordTitle,
                      style: context.titleTitle1),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text.rich(CustomTextSpan(
                        textData: (widget.entryMode.isAccountCreation)
                            ? appStrings.createPasswordSubTitle
                            : appStrings.newPasswordSubTitle,
                        style: context.bodyBody,
                        children: [
                          CustomTextSpan(
                            textData: widget.email ?? '',
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
                ValueListenableBuilder(
                  valueListenable: obscureState,
                  builder: (BuildContext context, bool obscureValue,
                      Widget? child) {
                    return CustomTextField.outline(
                        textEditingController: _controller,
                        label: appStrings.password,
                        focusNode: _focusNode,
                        autoFocus: true,
                        obscureText: !obscureState.value,
                        suffixIcon: IconButton(iconSize: 20,
                          padding: EdgeInsets.zero,
                          highlightColor: Colors.transparent,
                          constraints: const BoxConstraints(
                              maxHeight: 24, maxWidth: 24),
                          icon: !obscureState.value
                              ? appAssets.eye.svg()
                              : appAssets.eyeSlash.svg(),
                          onPressed: () {
                            obscureState.value = !obscureState.value;
                          },)
                    );
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CustomButton.submit(
                    text: (widget.entryMode.isAccountCreation)
                        ? appStrings.continueSteps
                        : appStrings.confirmPassword,
                    onPressed: () {
                      context.read<CreatePassBloc>().add(
                          CreatePassEvent.confirmPassword(
                              password: _controller.text.trim()));
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
