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
import 'package:maze_app/feature/profile/presentation/bloc/profile_bloc.dart';

@RoutePage()
class CurrentPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  final String email;
  const CurrentPasswordPage(
      {super.key, required this.email});

  @override
  State<CurrentPasswordPage> createState() => _CurrentPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ProfileBloc>(), child: this);
  }
}

class _CurrentPasswordPageState extends State<CurrentPasswordPage> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  ValueNotifier<bool> obscureState = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBarHeight: 100,
        appBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 56, 12, 10),
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
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state.profileStatus.isSuccess) {
              context.pushRoute(const AccountSettingsPageRoute());
            } else if (state.profileStatus.isFailure) {
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
                  title: CustomText( appStrings.yourPassword,
                      style: context.titleTitle1),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text.rich(CustomTextSpan(
                        textData: appStrings.currentPassword,
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
                    text:appStrings.continueSteps,
                    showLoading: state.profileStatus.isLoading,
                    onPressed: () {
                      context.pushRoute( ChangePasswordPageRoute(
                          email: widget.email,
                          currentPass: _controller.text.trim()));
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
