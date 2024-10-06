import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/help_header.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class NewLandfillWasteBinWidget extends StatelessWidget {
  const NewLandfillWasteBinWidget({
    super.key,
    required this.haveBin,
    required this.dontHaveBin,
  });

  final VoidCallback haveBin;
  final VoidCallback dontHaveBin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HelpHeader(leadingIcon: ExitButton()),
          CustomText(
            appStrings.newWasteBinTitle,
            style: context.titleTitle1,
          ),
          SizedBox(
            height: 15.h,
          ), CustomText(
            appStrings.newWasteBinSubTitle,
            style: context.bodyBody,
          ),
          SizedBox(
            height: 20.h,
          ),
          TrackerField(
            title: appStrings.councilLandfillPhrase1,
            onTap: haveBin,
          ),
          SizedBox(
            height: 15.h,
          ),
          TrackerField(
            title: appStrings.councilLandfillPhrase2,
            onTap: dontHaveBin,
          ),
          SizedBox(
            height: 15.h,
          ),
          TrackerField(
            height: 88.h,
            title: appStrings.councilLandfillPhrase3,
            subTitle: appStrings.liveApartment,
            onTap: dontHaveBin,
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
