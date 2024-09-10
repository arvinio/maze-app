import 'package:maze_app/core/config/assets/assets.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ExitButton(),
        CustomText(
          "Add bin",
          style: context.titleTitle1,
        ),
        CustomText(
          "Select the type of bin you'd like to add.",
          style: context.bodyBody,
        ),
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
          title: 'Waste Bin',
          subTitle: 'This can be a landfill, organic or recycling waste bin.',
          onTap: addWasteBin,
        ),
        SizedBox(
          height: 10.h,
        ),
        TrackerField(
          leadingIcon: Image.asset(appAssets.compostIcon.path),
          title: 'Compost Bin',
          subTitle:
              'Is a bin for turning organic waste into nutrient-rich compost.',
          onTap: addCompostBin,
        ),
      ],
    );
  }
}
