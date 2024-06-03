import '../../di/injection_container.dart';



abstract class StringsBase {

  String get themeModeSystem => 'According to the device';

}

/// ss = String s
StringsBase ss = inject<StringsBase>();
