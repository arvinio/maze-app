import 'package:injectable/injectable.dart';
import 'package:maze_app/di/injection_container.dart';


@LazySingleton()
class StringsBase {
  String get mazeComposting => 'Maze Composting';
  String get doNotHaveAnAccountMsg => 'Enter your email. If you don’t have an account we’ll create one for you.';
  String get continueSteps => 'Continue';
  String get loginAsGuest => 'Login as guest';
  String get agreeMessage => 'By continuing you agree to our';
  String get termsOfService => 'Terms of Service\n';
  String get privacyPolicy => ' Privacy Policy';
  String get email => ' Email';

}

StringsBase appStrings = inject<StringsBase>();
