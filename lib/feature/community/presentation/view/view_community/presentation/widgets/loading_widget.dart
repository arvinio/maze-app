import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required Color mainFontColor,
  })  : _mainFontColor = mainFontColor;

  final Color _mainFontColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        size: 14.w,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: _mainFontColor,
              // color: index.isEven ? _mainFontColor: _secondColor,
            ),
          );
        },
      ),
    );
  }
}
