// import 'package:flutter/material.dart';
// import 'package:maze_app/feature/debug/presentation/view/debug_center_page.dart';
// import 'package:shake/shake.dart';
//
// const showDebugCenterOnStartup = true;
//
// class DebugCenterOnShake extends StatefulWidget {
//   final Widget child;
//   final bool debugOnly;
//
//   const DebugCenterOnShake({
//     super.key,
//     required this.child,
//     this.debugOnly = false,
//   });
//
//   @override
//   DebugCenterOnShakeState createState() => DebugCenterOnShakeState();
// }
//
// class DebugCenterOnShakeState extends State<DebugCenterOnShake> {
//   late ShakeDetector _detector;
//   bool _open = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     if (widget.debugOnly) {
//       assert(() {
//         _init();
//         return true;
//       }());
//     } else {
//       _init();
//     }
//     if (showDebugCenterOnStartup) {
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//         await Future.delayed(const Duration(seconds: 3));
//         if (mounted) {
//           // Navigator.of(context).push(
//           //   CustomTransitionPageRoute(
//           //     builder: (_) => const NetworkErrorPage(),
//           //   ),
//           // );
//
//           _openDebugCenter();
//         }
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
//
//   _init() {
//     _detector = ShakeDetector.waitForStart(
//       onPhoneShake: _openDebugCenter,
//       shakeThresholdGravity: 2.69,
//       shakeSlopTimeMS: 385,
//     );
//     _detector.startListening();
//   }
//
//   _openDebugCenter() async {
//     if (_open) return;
//
//     _open = true;
//
//     await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const DebugCenterPage()),
//     );
//     _open = false;
//   }
//
//   @override
//   void dispose() {
//     _detector.stopListening();
//     super.dispose();
//   }
// }
