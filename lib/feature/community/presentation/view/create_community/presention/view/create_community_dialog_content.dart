import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/config/assets/assets.dart';
import '../../../../../../../core/config/dimen.dart';
import '../../../../../../../core/config/strings.dart';
import '../../../../../../../core/presentation/widget/bottom_sheet_header.dart';
import '../../../../../../../core/presentation/widget/custom_button.dart';
import '../../../../../../../core/presentation/widget/custom_text.dart';
import '../../../../../../../core/presentation/widget/custom_text_field.dart';
import '../../../../../../../core/style/app_theme.dart';
import '../../../../../../../core/util/extentsion/context_ext.dart';
import '../../../../../../../di/injection_container.dart';
import '../../../../../core/util/community_data_request/comunity.dart';
import '../../../../bloc/community_bloc/community_bloc.dart';
import 'community_banner__dialog_content.dart';

class CreateCommunityDialogContent extends StatefulWidget
    implements AutoRouteWrapper {
  const CreateCommunityDialogContent({super.key});

  @override
  State<CreateCommunityDialogContent> createState() =>
      _CreateCommunityDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<CommunityBloc>(), child: this);
  }
}

class _CreateCommunityDialogContentState
    extends State<CreateCommunityDialogContent> {
  double dialogHeightPercent = 0.92;
  final _nameFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  late final ValueNotifier<bool> _keyboardVisibilityValueNotifier;
  Community? community;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityValueNotifier = ValueNotifier(false);
    community = Community();
  }

  @override
  void dispose() {
    _nameFocusNode.unfocus();
    _descFocusNode.unfocus();
    super.dispose();
  }

  final List<int>? list = [];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    _keyboardVisibilityValueNotifier.value =
        MediaQuery.of(context).viewInsets.bottom != 0;

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: h * dialogHeightPercent,
        child: Container(
            decoration: BoxDecoration(
                color: context.scheme().neutralsBackground,
                boxShadow: [
                  BoxShadow(
                    color: context.scheme().selectIconDropDown,
                    spreadRadius: 1,
                    blurRadius: 4,
                  )
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimen.popupRadius),
                    topRight: Radius.circular(Dimen.popupRadius))),
            child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetHeader(
                      showDivider: false,
                      title: '',
                      closeIcon: appAssets.close.svg(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(appStrings.newCommunity,
                              style: context.titleTitle1),
                          SizedBox(
                              height: (!_keyboardVisibilityValueNotifier.value)
                                  ? 15
                                  : 8),
                          CustomText(appStrings.newCommunitySubTitle,
                              style: context.bodyBody),
                          SizedBox(
                              height: (!_keyboardVisibilityValueNotifier.value)
                                  ? 24
                                  : 8),
                          CustomTextField.outline(
                            textEditingController: _nameController,
                            label: appStrings.communityName,
                            focusNode: _nameFocusNode,
                            readOnly: false,
                            labelTextColor: context.scheme().secondaryText,
                          ),
                          SizedBox(
                              height: (!_keyboardVisibilityValueNotifier.value)
                                  ? 16
                                  : 8),
                          CustomTextField.outline(
                            label: appStrings.descriptionYourCommunity,
                            textEditingController: _descController,
                            maxLines: 5,
                            focusNode: _descFocusNode,
                          ),
                          SizedBox(
                            height: (!_keyboardVisibilityValueNotifier.value)
                                ? h * 0.25
                                : h * 0.01,
                          ),
                          _buildContinueButton()
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }

  Padding _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: CustomButton.submit(
        text: appStrings.continueSteps,
        onPressed: () {
          _showCreateBanner(context);
        },
      ),
    );
  }

  void _showCreateBanner(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          community!.name = _nameController.text.trim();
          community!.description = _descController.text.trim();

          return CommunityBannerDialogContent(community: community);
        });

    // else toast
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
