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
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/profile/presentation/bloc/profile_bloc.dart';

@RoutePage()
class NewEmailAddressPage extends StatefulWidget implements AutoRouteWrapper {
  const NewEmailAddressPage(
      {super.key});

  @override
  State<NewEmailAddressPage> createState() => _NewEmailAddressPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ProfileBloc>(), child: this);
  }
}

class _NewEmailAddressPageState extends State<NewEmailAddressPage> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

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
               context.pushRoute(VerificationCodePageRoute(userId: state.changeEmailResponse!.userId!, userName: _controller.text.trim(),
                   entryMode: EntryMode.changeEmail));
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
                  title: CustomText( appStrings.newEmailTitle,
                      style: context.titleTitle1),
                  subtitle:  CustomText( appStrings.newEmailSubTitle,
                      style: context.bodyBody),

                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 5,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextField.outline(
                    textEditingController: _controller,
                    label: appStrings.newEmailAddress,
                    focusNode: _focusNode,
                    autoFocus: true,

                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CustomButton.submit(
                    text: appStrings.continueSteps,
                    showLoading: state.profileStatus.isLoading,
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                          ProfileEvent.changeEmailEvent(
                              email: _controller.text.trim()));
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
