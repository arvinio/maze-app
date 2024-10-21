import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/tracker/data/model/deleted_bins/deleted_bins_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/no_image.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class BinsList extends StatefulWidget implements AutoRouteWrapper {
  const BinsList({
    super.key,
    this.title,
    required this.bins, this.titleStyle,
  });

  final String? title;
  final List<Bin>? bins;
  final TextStyle? titleStyle;

  @override
  State<BinsList> createState() => _BinsListState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<TrackerBloc>(), child: this);
  }
}

class _BinsListState extends State<BinsList> {
  final List<Bin> bins = [];

  @override
  void initState() {
    context.read<TrackerBloc>().add(const TrackerEvent.getBinsList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackerBloc, TrackerState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loadInProgress: () {},
          binsLoaded: (value) {
            bins.clear();
            bins.addAll(value);
          },
          loadingError: (error) {
            Fluttertoast.showToast(msg: error.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          navigateToAddNewEntryPage: (bin) {},
        );
      },
      builder: (context, state) {
        return  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ExitButton(),
                CustomText(
                  widget.title!,
                  style: widget.titleStyle ?? context.titleTitle1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
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
                        onTap: () {
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
          ),
        );
      },
    );
  }
}