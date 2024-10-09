import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_loading.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/presentation/widget/page_loading.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/data/model/deleted_bins/deleted_bins_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/bloc/manage_bins_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class DeletedBinsContent extends StatelessWidget implements AutoRouteWrapper {
  DeletedBinsContent({
    super.key, required this.bloc,
  });

  final TrackerBloc bloc;

  //List<DeletedBin>? bins=[];
  var deletedBins = <DeletedBin>[];

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) =>
    inject<ManageBinsBloc>()
      ..add(ManageBinsEvent.getDeletedBins()), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExitButton(),
            CustomText(
              appStrings.deletedBins,
              style: context.titleTitle1,
            ),
            SizedBox(
              height: 20.h,
            ),

            BlocConsumer<ManageBinsBloc, ManageBinsState>(
                listener: (context, state) async {
                  if (state.status.isFetchDeletedBins) {
                    deletedBins!.clear();
                    deletedBins!.addAll(state.deletedBins!.toList());
                  }
                  else if (state.status.isDeleted) {
                    deletedBinsEvent(context);
                  }
                  else   if (state.status.isRestored) {
                    deletedBinsEvent(context);
                    Fluttertoast.showToast(
                      msg:appStrings.restoredMsg,
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
                  return state.status.isLoading
                      ? const PageLoading()
                      : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: deletedBins.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      List<DeletedBin> bins = deletedBins;
                      return TrackerField(
                          leadingIcon: bins[index].photo == null
                              ? const NoImage()
                              : Image.network(
                            bins[index].photo!,
                            fit: BoxFit.cover,
                          ),
                          title: bins[index].nickname!,
                          subTitle: appStrings.compostTumbler,
                          trailing: IconButton(
                              icon: appAssets.more.svg(color: context
                                  .scheme()
                                  .tertiaryText),
                              padding: const EdgeInsets.only(left: 30),
                              onPressed: () {
                                restoreBinContent(
                                    context, bins[index].id, state);
                              }
                          ),
                          onTap: () {}
                      );
                    },

                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 15.h);
                    },
                  );
                })
          ],
        ),
      ),
    );
  }

  void deletedBinsEvent(BuildContext context) {
    return context.read<ManageBinsBloc>().add(
                      const ManageBinsEvent.getDeletedBins());
  }

  restoreBinContent(BuildContext context, String? id, ManageBinsState state) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return MenuDialogContent(
            header: appStrings.options,
            dialogHeightPercent: 0.35,
            color: context
                .scheme()
                .neutralsBorderDivider,
            child: Column(children: [
              CustomMenuItems(
                title: appStrings.restoreDeletedBin,
                leading: appAssets.restore.svg(),
                trailing: appAssets.rightArrow.svg(color: context
                    .scheme()
                    .tertiaryText),
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                onTap: () {
                  Navigator.of(context).pop();
                  context.read<ManageBinsBloc>().add(
                      ManageBinsEvent.restoreBin(id: id!));
                },
              ),
              Divider(color: context
                  .scheme()
                  .neutralsBorderDivider, indent: 45.w, endIndent: 15.w,),
              CustomMenuItems(
                title: appStrings.permanentDeleteTitle,
                subTitle: CustomText(appStrings.permanentDeleteSubTitle,
                    style: context.footnoteFootnote.copyWith(color: context
                        .scheme()
                        .secondaryText)),
                leading: appAssets.manageDeleteBin.svg(),
                trailing: appAssets.rightArrow.svg(color: context
                    .scheme()
                    .tertiaryText),
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                onTap: () {
                  ShowDialog.delete(context,
                      title: appStrings.permanentDeleteDialog,
                      subtitle: appStrings.permanentDeleteDialog2,
                      showLoading: state.status.isLoading,
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        await Future.delayed(const Duration(milliseconds: 20));
                        if (context.mounted) {
                          context.read<ManageBinsBloc>().add(
                              ManageBinsEvent.deleteBinPermanently(id: id!));
                        }
                      });
                },

              )
            ],)
        );
      },
    );
  }
}