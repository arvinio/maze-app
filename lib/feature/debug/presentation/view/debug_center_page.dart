import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/core/presentation/cubit/firebase_cubit/firebase_cubit.dart';
import 'package:maze_app/core/presentation/widget/base/base_page_widget.dart';

class DebugCenterPage extends StatelessWidget {
  const DebugCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      child: BlocBuilder<FirebaseCubit, FirebaseState>(
        builder: (context, state) => Column(
          children: [
            const Text("FCM Token:"),
            Text(state.fcmToken ?? "No token!!!"),
          ],
        ),
      ),
    );
  }
}
