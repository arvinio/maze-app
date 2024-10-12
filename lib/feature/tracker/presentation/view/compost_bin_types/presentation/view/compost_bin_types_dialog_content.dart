import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_button.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/data/model/compost_bin_types/compost_bin_types_response.dart';
import 'package:maze_app/feature/tracker/presentation/view/compost_bin_types/presentation/bloc/compost_bin_types_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/custom_divider.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/exit_button.dart';

class CompostBinTypesDialogContent extends StatefulWidget implements AutoRouteWrapper {
  const CompostBinTypesDialogContent({super.key});

  @override
  State<CompostBinTypesDialogContent> createState() => _CompostBinTypesDialogContentState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<CompostBinTypesBloc>(), child: this);
  }
}

class _CompostBinTypesDialogContentState extends State<CompostBinTypesDialogContent> {
  List<CompostBinTypes> compostBinTypes=[];

  @override
  void initState() {
    _fetchCompostBinTypes(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompostBinTypesBloc, CompostBinTypesState>(
      listener: (context, state) {
        if(state.status.isLoadCompostBinTypes){
          compostBinTypes.clear();
          compostBinTypes.addAll(state.retrievedCompostBinTypes!);
        }
      },
      builder: (context, state) {
        return  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ExitButton(),
                    SizedBox(
                      width: 40.w,
                    ),
                    CustomText(
                      appStrings.typeOfCompostBin!,
                      style:  context.titleTitle3,
                    ),
                  ],
                ),
                (state.status.isLoading)
                    ?loadingWidget(context)
                 : (state.status.isFailure)
                ?_failureWidget(context,state.errorMessage)
                :Container(
                    margin:const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: context.scheme().neutralsBackground,
                      border:
                      Border.all(color:  context.scheme().neutralsBorderDivider),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimen.defaultRadius)),
                    ),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: compostBinTypes!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomMenuItems(
                          title: compostBinTypes![index].name!,
                          trailing: appAssets.rightArrow.svg(),
                          padding:const  EdgeInsets.fromLTRB(0,8,15,8),
                          onTap: () {
                           _onSelect(context, compostBinTypes![index]);
                          }
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const CustomDivider();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

   loadingWidget(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top:80.h),
      child: Center(
                  child: SizedBox(
                    width: 38,
                    height: 38,
                    child: CircularProgressIndicator(
                        strokeWidth: 3.8,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
                  ),
                ),
    );
  }

  _failureWidget(BuildContext context,String? error) {
    return Padding(
      padding:  EdgeInsets.only(top:80.h),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
             error!,
              style: context.footnoteFootnoteBold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton.submit(
              text: appStrings.tryAgain,
              textFontSize: 15,
              horizontalPadding: 20,
              minSize: 42,
              onPressed: () {
                _fetchCompostBinTypes(context);
              },
              isFullWidth: false,
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  _onSelect(BuildContext context, CompostBinTypes result) {
    Navigator.pop(context, result);
  }

  _fetchCompostBinTypes(BuildContext context) {
    context.read<CompostBinTypesBloc>().add( const CompostBinTypesEvent.getCompostBinTypesEvent());
  }
}

