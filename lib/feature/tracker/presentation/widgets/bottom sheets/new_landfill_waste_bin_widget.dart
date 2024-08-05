import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class NewLandfillWasteBinWidget extends StatelessWidget {
  const NewLandfillWasteBinWidget({
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
          "New landfill waste bin ",
          style: context.titleTitle1,
        ),
        CustomText(
          "Firstly do you have a landfill council bin? This is commonly known as the red wheelie bin and is picked up by your council.",
          style: context.bodyBody,
        ),
        SizedBox(
          height: 10.h,
        ),
        TrackerField(
          // leadingIcon: const InfoIcon(),
          title: "I have a council landfill bin",
          // subTitle: 'Tap to get some help',
          onTap: func,
        ),
        SizedBox(
          height: 15.h,
        ),
        TrackerField(
          // leadingIcon: Image.asset(appAssets.landfillIcon.path),
          title: "I don't have a council landfill bin",
          // subTitle:
          //     'Storeswaste that will later be emptied intro your council landfill bin',
          onTap: () {},
        ),
        SizedBox(
          height: 15.h,
        ),
        TrackerField(
          height: 88.h,
          // leadingIcon: Image.asset(
          //   appAssets.organicIcon.path,
          //   fit: BoxFit.contain,
          // ),
          title: "I share my council landfill bin with other households",
          subTitle: "Usually if you live in apartments",
          onTap: () {},
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
