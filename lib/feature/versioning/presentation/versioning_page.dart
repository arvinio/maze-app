import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/versioning/presentation/bloc/versioning_bloc.dart';

@RoutePage()
class VersioningPage extends StatefulWidget implements AutoRouteWrapper {
  const VersioningPage({super.key});

  @override
  State<VersioningPage> createState() => _VersioningPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => inject<VersioningBloc>(), child: this);
  }
}

class _VersioningPageState extends State<VersioningPage> {
  @override
  void initState() {
    super.initState();
    init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VersioningBloc, VersioningState>(
      listener: (context, state) {
        if (state.versioningStatus.isFailure) {
          //toast
        }
      },
      builder: (context, state) {
        if (state.versioningStatus.isLoading) {
          return Container();
        } else if (state.versioningStatus.isSuccess) {
          return Container(color:Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text ( "update Exist:"),
                  Text (state.versionResponse!.updateExist.toString()),
                ],
              ));
        } else {
          return Container();
        }
      },
    );
  }

  init(BuildContext context) {
    context.read<VersioningBloc>().add(const VersioningEvent.init());
  }
}
