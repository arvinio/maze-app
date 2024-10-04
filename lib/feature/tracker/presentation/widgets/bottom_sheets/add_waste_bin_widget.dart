import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/previous_button.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class AddWasteBinWidget extends StatelessWidget {
  const AddWasteBinWidget({
    super.key,
    required this.func,
  });
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PreviousButton(),
          CustomText(
           appStrings.addWasteBinTitle,
            style: context.titleTitle1,
          ),
          SizedBox(
            height: 15.h,
          ), CustomText(
            appStrings.addWasteBinSubTitle,
             style: context.bodyBody,
          ),
          SizedBox(
            height: 20.h,
          ),
          TrackerField(
            leadingIcon: const InfoIcon(),
            title: appStrings.doNotKnowWhatToAdd,
            subTitle:appStrings.someHelp,
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
            title: appStrings.addLandfillBinTitle,
            subTitle:appStrings.addLandfillBinWasteSubTitle,
            onTap: func,
          ),
          SizedBox(
            height: 15.h,
          ),
          // TrackerField(
          //   leadingIcon: Image.asset(
          //     appAssets.organicIcon.path,
          //     fit: BoxFit.contain,
          //   ),
          //   title: 'Add an organic waste bin',
          //   subTitle:
          //       'Store organic waste that will later be emptied intor a compost bin',
          //   onTap: () {},
          // ),
          // SizedBox(
          //   height: 15.h,
          // ),
          // TrackerField(
          //   leadingIcon: Image.asset(appAssets.recycleIcon.path),
          //   title: 'Add a recycling waste bin',
          //   subTitle:
          //       "Stores your recyclable waste before it's taken by the council or donated",
          //   onTap: () {},
          // )
        ],
      ),
    );
  }
}
