import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';

import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';

import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DoNotHaveCompostBinWidget extends StatefulWidget {
  const DoNotHaveCompostBinWidget({
    super.key,
    required this.bloc,
  });
  final TrackerBloc bloc;

  @override
  State<DoNotHaveCompostBinWidget> createState() => _DoNotHaveCompostBinWidgetState();
}

class _DoNotHaveCompostBinWidgetState extends State<DoNotHaveCompostBinWidget>{
  final Uri _url = Uri.parse('https://mazeproducts.com.au/product-category/composting/compost-bins/');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:40.0,left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(onTap:(){Navigator.of(context).pop();},child: appAssets.arrowLeft.svg()),
          const SizedBox(height: 10),
          CustomText(
          appStrings.doNotHaveCompostBinTitle,
            style: context.titleTitle1,
          ),
          const SizedBox(height: 10),
          CustomText(
            appStrings.doNotHaveCompostBinSubTitle,
            style: context.bodyBody,
          ),
          const SizedBox(height: 30),
      InkWell(
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
              leading:Image.asset(appAssets.apMaze.path),
              title: CustomText(appStrings.tryMazeProductsTitle,
                style: context.subheadlineSubheadlineSemibold,),
              trailing:const AppArrow(),
              horizontalTitleGap: 0,
            ),
            CustomText(appStrings.tryMazeProductsSubTitle,
              style: context.footnoteFootnote.copyWith(color: context
                  .scheme()
                  .secondaryText),),
            const SizedBox(height: 20),
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
      )

        ],
      ),
    );
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
