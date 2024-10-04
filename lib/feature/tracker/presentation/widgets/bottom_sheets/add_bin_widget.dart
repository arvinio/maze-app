import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class AddBinWidget extends StatelessWidget {
  const AddBinWidget({
    super.key,
    required this.addWasteBin,
    required this.addCompostBin,
  });
  final VoidCallback addWasteBin;
  final VoidCallback addCompostBin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExitButton(),
          CustomText(
            appStrings.addBinTitle,
            style: context.titleTitle1,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
            appStrings.addBinSubTitle,
            style: context.bodyBody,
          ),
          SizedBox(
            height: 20.h,
          ),
          TrackerField(
            leadingIcon: const InfoIcon(),
            title: appStrings.doNotKnowWhatToAdd,
            subTitle: appStrings.someHelp,
            titleStyle: context.bodyBody ,
            isInfoIcon: true,
            horizontalTitleGap: 0,
            onTap: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          TrackerField(
            leadingIcon: Image.asset(appAssets.landfillIcon.path),
            title:appStrings.wasteBinTitle,
            subTitle: appStrings.wasteBinSubTitle,
            onTap: addWasteBin,
          ),
          SizedBox(
            height: 15.h,
          ),
          TrackerField(
            leadingIcon: Image.asset(appAssets.compostIcon.path),
            title: appStrings.compostBinTitle,
            subTitle:
            appStrings.compostBinSubTitle,
            onTap: addCompostBin,
          ),
        ],
      ),
    );
  }
}
