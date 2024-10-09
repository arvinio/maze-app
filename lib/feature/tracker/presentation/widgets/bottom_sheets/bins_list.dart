import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class BinsList extends StatelessWidget {
   const BinsList({
    super.key,
    this.title,
    required this.bins, this.titleStyle,
  });

  final String? title;
  final List<Bin>? bins;
  final TextStyle? titleStyle ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExitButton(),
          CustomText(
            title!,
            style: titleStyle ?? context.titleTitle1,
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
            itemCount: bins!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TrackerField(
                  leadingIcon: bins![index].imageUrl == null
                      ? const NoImage()
                      : Image.network(
                    bins![index].imageUrl!,
                    fit: BoxFit.cover,
                  ),
                  title: bins![index].nickName,
                  subTitle: bins![index].type == BinType.landfill
                      ? appStrings.landfillWasteBin
                      : bins![index].type == BinType.compost
                      ? appStrings.compostTumbler
                      : '',
                  onTap: (){
                    Navigator.of(context).pop(index);
                  }
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 15);
            },
          )
        ],
      ),
    );
  }
}
