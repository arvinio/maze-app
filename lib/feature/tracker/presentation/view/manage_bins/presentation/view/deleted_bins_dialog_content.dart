import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/custom_menu_items.dart';
import 'package:maze_app/core/presentation/widget/menu_dialog_content.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/data/model/deleted_bins/deleted_bins_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/view/manage_bins/presentation/bloc/manage_bins_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class DeletedBinsContent extends StatelessWidget implements AutoRouteWrapper {
  DeletedBinsContent({
    super.key
  });


  //List<DeletedBin>? bins=[];
  var deletedBins = <DeletedBin>[];

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) =>
    inject<ManageBinsBloc>()
      ..add(const ManageBinsEvent.getDeletedBins()), child: this);
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
                  }
                },
                builder: (context, state) {
                  return state.status.isLoading
                      ?loadingWidget(context)
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
                          subTitle: bins[index].type ==  BinType.compost.name
                              ? appStrings.compostTumbler
                              : appStrings.landfillWaste,
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


  loadingWidget(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.3),
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
}