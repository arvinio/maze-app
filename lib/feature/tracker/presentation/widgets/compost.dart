import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/presentation/widget/custom_text.dart';
import 'package:maze_app/core/presentation/widget/info_icon.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/view/create_bin_types/presentation/view/new_compost_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/bottom_sheets/do_not_have_compost_bin_widget.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/show_dialog.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_field.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_preview.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bottom_sheets/have_compost_bin_widget.dart';

class Compost extends StatelessWidget {
   Compost({
    super.key,
    required this.bloc,
  });

  final TrackerBloc bloc;
  final Uri _url = Uri.parse('https://mazeproducts.com.au/product-category/composting/compost-bins/');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !bloc.hasCompost
            ? Column(
          children: [
            TrackerField(
              leadingIcon: Image.asset(appAssets.compostIcon.path),
              title: appStrings.addCompostTitle,
              subTitle: appStrings.addCompostSubTitle,
              onTap: () {

                ShowDialog.openModalBottomSheet(
                    context,
                   child: HaveCompostBinWidget(
                      haveBinFunc: () {
                        ShowDialog.openModalBottomSheet(
                            context,
                            child: NewCompostBinWidget(
                                bloc:
                                bloc));
                      },
                      doNotHaveBinFunc:
                          () {
                            ShowDialog.openModalBottomSheet(
                              context,
                                child: DoNotHaveCompostBinWidget(bloc: bloc,));},
                    ));
              },
            ),
            const SizedBox(height: 15,),

            _buildCheckOutMazeCompostBin(context)
          ],
        )
            : TrackerPreview(
            onTap: () {
              context.read<TrackerBloc>().add(
                  TrackerEvent.fetchBinDetails(binId: bloc.bins.first.id!));
            },
            bin: bloc.bins.firstWhere(
                  (element) => element.type == BinType.compost,
            )),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  InkWell _buildCheckOutMazeCompostBin(BuildContext context) {
    return InkWell(
      onTap:_launchUrl,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: context
              .scheme()
              .neutralsBorderDivider),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(children: [
          ListTile(
            leading: const InfoIcon(),
            title: CustomText(appStrings.doNotHaveCompost,
              style: context.subheadlineSubheadline,),
            subtitle: CustomText(appStrings.checkOutMazeCompost,
              style: context.footnoteFootnote.copyWith(color: context
                  .scheme()
                  .secondaryText),),
            trailing:const AppArrow(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(appAssets.compost.path),
              const SizedBox(width: 10,),
              Image.asset(appAssets.compost1.path),
              const SizedBox(width: 10,),
              Image.asset(appAssets.compost2.path),
              const SizedBox(width: 10,),
              Image.asset(appAssets.compost3.path),
            ],)
        ],),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
