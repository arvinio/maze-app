import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/core/presentation/route/app_router.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_listTile_menus.dart';
import 'package:maze_app/core/presentation/widget/custom_loading.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';
import 'package:maze_app/feature/profile/presentation/bloc/profile_bloc.dart';

@RoutePage()
class AccountSettingsPage extends StatefulWidget implements AutoRouteWrapper{
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<ProfileBloc>(), child: this);
  }
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {

  String? email='';
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add( const ProfileEvent.getProfileEvent());
  }


  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;

    return  BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if(state.profileStatus.isSuccess){
          email=state.response!.email!;
        }
        else if(state.profileStatus.isDeleteSuccess){
          context.router.popUntilRouteWithName(const SignupPageRoute().routeName);
        }
        else  if (state.profileStatus.isFailure) {
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
            appBarHeight: 60,
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
              SizedBox(width: w*0.25,),
              CustomText(appStrings.accountSettings, style: context.titleHeadline,
                textAlign: TextAlign.center,),
            ],
          ),
        ),
        child: state.profileStatus.isLoading
        ?const CustomLoading()
       : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 40),
            Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: context
                      .scheme()
                      .neutralsBackground,
                  border: Border.all(color: context
                      .scheme()
                      .neutralsBorderDivider),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimen.defaultRadius)),
                ),

                child:Column(children: [
                  buildAccountMenus(context,
                      title:appStrings.email,
                      subTitle: email,
                      trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                  onTap: (){
                    context.pushRoute(const NewEmailAddressPageRoute());
                  }
                  ),
                  buildDivider(context, w),
                  buildAccountMenus(context,
                      title:appStrings.password,
                      trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText,),
                  onTap: (){
                      context.pushRoute(CurrentPasswordPageRoute(email: email!, ));
                  }),

                ],)),
            const SizedBox(height: 20),
            Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: context
                      .scheme()
                      .neutralsBackground,
                  border: Border.all(color: context
                      .scheme()
                      .neutralsBorderDivider),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimen.defaultRadius)),
                ),

                child:Column(children: [
                  buildAccountMenus(context,
                      title:appStrings.logout,
                      trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                  onTap: (){
                    showDialog(
                        context: context,
                        barrierColor: context.scheme().neutralsBorderDivider,
                        builder: (_) =>
                       AlertDialog(
                        title: CustomText(appStrings.logout),
                        content: CustomText(appStrings.sureLogout),

                        actions: [
                          SizedBox(width: 100,height: 50, child: CustomButton.submit(
                              text: 'Yes',
                              onPressed: (){
                            inject<SettingsManager>().setBearerToken('');
                            inject<SettingsManager>().setRefreshToken('');
                            inject<SettingsManager>().setRole('');
                            context.router.popUntilRouteWithName(const SignupPageRoute().routeName);
                          })),
                          SizedBox(width: 100,height:50,child: CustomButton.outline(text: 'No', onPressed: (){Navigator.of(context).pop();}))

                        ],
                         elevation: 24,
                         backgroundColor: context.scheme().neutralsBackground,

                      ),
                      barrierDismissible: false,
                    );
                  }
                  ),
                  buildDivider(context, w),
                  buildAccountMenus(context,
                      title:appStrings.deleteAccount,
                      titleStyle: context.bodyBodyMedium.copyWith(color: context.scheme().error),
                      trailing: appAssets.rightArrow.svg(color: context.scheme().tertiaryText),
                      onTap: (){
                        showDialog(
                          context: context,
                          barrierColor: context.scheme().neutralsBorderDivider,
                          builder: (_) =>
                              AlertDialog(
                                title: CustomText('${appStrings.deleteAccount}?'),
                                content: CustomText(appStrings.sureLogout),

                                actions: [
                                  SizedBox(width: 100,height: 50, child: CustomButton.submit(text: 'Yes', onPressed: (){
                                    context.read<ProfileBloc>().add( const ProfileEvent.deleteAccountEvent());
                                  })),
                                  SizedBox(width: 100,height:50,child: CustomButton.outline(text: 'No', onPressed: (){Navigator.of(context).pop();}))

                                ],
                                elevation: 24,
                                backgroundColor: context.scheme().neutralsBackground,

                              ),
                          barrierDismissible: false,
                        );
                      }),

                ],)),

          ],

        )
          );
  },
);
  }

  Divider buildDivider(BuildContext context, double w) => Divider(color: context.scheme().neutralsBorderDivider,indent: w*0.06,);



  ListTile buildAccountMenus(BuildContext context,
      {required String title,String? subTitle='' ,  Widget? leading,required Widget trailing,TextStyle? titleStyle,void Function()? onTap}) {
    return ListTile(
      title: CustomText(
          title,
          style: context.bodyBody),
      titleTextStyle: titleStyle,
      subtitle: CustomText(
          subTitle!,
          style: context.footnoteFootnote.copyWith(color: context.scheme().secondaryText)),
      leading: SizedBox(width: 24,
          height: 64,
          child:leading ),
      trailing: SizedBox(width: 24,
          height: 64,
          child: trailing),
      contentPadding: const EdgeInsets.fromLTRB( 0,5,5,5,),
      horizontalTitleGap: 0,
      onTap: onTap,
    );
  }
}
