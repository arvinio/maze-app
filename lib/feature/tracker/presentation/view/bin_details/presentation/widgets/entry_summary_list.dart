import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/widget/app_arrow.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/presentation/view/entry_page/presentation/bloc/entry_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/get_entry_type_icon.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/loading.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class EntrySummaryList extends StatefulWidget {
   EntrySummaryList({super.key, required this.entries,required this.state});
  List<EditEntry> entries;
   EntryState state;
  @override
  State<EntrySummaryList> createState() => _EntrySummaryListState();


}
class _EntrySummaryListState extends State<EntrySummaryList> {

  List<String> month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "June",
    "July",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];


  @override
  Widget build(BuildContext context) {
    return  widget.state.status.isLoading
            ? const Loading()
            : Container(
          height: 300.h, // ?? (children.length * 45.h) + 20.h,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: context
                .scheme()
                .neutralsBackground,
            border: Border.all(color: context
                .scheme()
                .neutralsBorderDivider),
            borderRadius:
            const BorderRadius.all(Radius.circular(Dimen.defaultRadius)),
          ),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final dateString = '${widget.entries[index].entryDate
                    .day} ${month[widget.entries[index].entryDate.month - 1]} '
                    ' ${widget.entries[index].entryDate.year}';
                return Dismissible(
                  key: ValueKey(widget.entries[index].entryId),
                  background: Container(
                    color: context
                        .scheme()
                        .error,
                    child:  Icon(
                      Icons.delete,
                      color: context
                          .scheme()
                          .neutralsBackground,
                    ),
                  ),
                  confirmDismiss: (isConfirmed) async {
                    context.read<EntryBloc>().add(EntryEvent.deleteBinEntry(entryId: widget.entries[index].entryId));
                    return Future(() => true);
                  },
                  child: ListTile(
                    leading: GetEntryTypeIcon(entryType: widget.entries[index].type),
                    title: CustomText(dateString, style: context.bodyBody,),
                    subtitle: CustomText(widget.entries[index].type.toDisplayString(),
                        style: context.footnoteFootnote.copyWith(color: context
                            .scheme()
                            .secondaryText)),
                    onTap: () {},
                    trailing: const AppArrow(),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return CustomDivider(
                    indent: 53.w, endIndent: 20.w);
              },
              itemCount: widget.entries.length),
        );

  }
}