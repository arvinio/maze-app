import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class NewEntryDialogContent extends StatelessWidget {
  const NewEntryDialogContent({
    super.key,
    required this.bloc,
  });

  final TrackerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExitButton(),
          CustomText(
            appStrings.newEntryFor,
            style: context.titleTitle1,
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
            itemCount: bloc.bins.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TrackerField(
                  leadingIcon: bloc.bins[index].imageUrl == null
                      ? const SizedBox(
                    child: Text('no image'),
                  )
                      : Image.network(
                    bloc.bins[index].imageUrl!,
                    fit: BoxFit.cover,
                  ),
                  title: bloc.bins[index].nickName,
                  subTitle: bloc.bins[index].type == BinType.landfill
                      ? appStrings.landfillWasteBin
                      : bloc.bins[index].type == BinType.compost
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
