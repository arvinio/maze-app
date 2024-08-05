import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class AddWasteBinWidget extends StatelessWidget {
  const AddWasteBinWidget({
    super.key,
    required this.func,
  });
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ExitButton(),
        CustomText(
          "Add Waste bin",
          style: context.titleTitle1,
        ),
        // CustomText(
        //   "Select the type of bin you'd like to add.",
        //   style: context.bodyBody,
        // ),
        SizedBox(
          height: 10.h,
        ),
        TrackerField(
          leadingIcon: const InfoIcon(),
          title: "Don't know what to add?",
          subTitle: 'Tap to get some help',
          onTap: () {},
        ),
        SizedBox(
          height: 15.h,
        ),
        TrackerField(
          leadingIcon: Image.asset(appAssets.landfillIcon.path),
          title: 'Add a landfill bin',
          subTitle:
              'Storeswaste that will later be emptied intro your council landfill bin',
          onTap: func,
        ),
        SizedBox(
          height: 15.h,
        ),
        TrackerField(
          leadingIcon: Image.asset(
            appAssets.organicIcon.path,
            fit: BoxFit.contain,
          ),
          title: 'Add an organic waste bin',
          subTitle:
              'Store organic waste that will later be emptied intor a compost bin',
          onTap: () {},
        ),
        SizedBox(
          height: 15.h,
        ),
        TrackerField(
          leadingIcon: Image.asset(appAssets.recycleIcon.path),
          title: 'Add a recycling waste bin',
          subTitle:
              "Stores your recyclable waste before it's taken by the council or donated",
          onTap: () {},
        )
      ],
    );
  }
}
