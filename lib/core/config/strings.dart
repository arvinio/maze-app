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

  //Login
  String get verificationCode => ' Verification code';
  String get codeSend => ' Enter the code sent to';
  String get reSend => ' Resend';

  //Account Creation

  String get createPasswordTitle => ' Create a Password';
  String get createPasswordSubTitle => ' Let’s create your password for\n';
  String get password => 'Password';

  //Login
  String get loginTitle => 'Welcome Back';
  String get loginSubTitle => 'Enter your password to log back into\n';
  String get forgotPassword => 'Forgot password';

  //WellcomPage
   String get welcomeTitle => 'Welcome Wilson51';
   String get welcomeSubTitle => 'Let’s get back into it!';

  //Forgot Password
  String get forgotPasswordTitle => ' New Password';
  String get forgotPasswordSubTitle => ' Enter your password to log into\n';
  String get confirmPassword => ' Confirm new password';



}

StringsBase appStrings = inject<StringsBase>();
