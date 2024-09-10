import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class GetEntryTypeIcon extends StatelessWidget {
  const GetEntryTypeIcon({
    super.key,
    required EntryType entryType,
  }) : _entryType = entryType;

  final EntryType _entryType;

  @override
  Widget build(BuildContext context) {
    switch (_entryType) {
      case EntryType.generalNote:
        return appAssets.generalNoteIcon.svg();

      case EntryType.emptiedCompost:
        return appAssets.emptiedCompostIcon.svg();
      case EntryType.emptiedBin:
      case EntryType.addedWaste:
        return appAssets.addWasteIcon.svg();

      default:
        return appAssets.generalNoteIcon.svg();
    }
  }
}
