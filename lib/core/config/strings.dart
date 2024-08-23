import 'package:injectable/injectable.dart';
import 'package:maze_app/di/injection_container.dart';


@LazySingleton()
class StringsBase {
  //public
  String get continueSteps => 'Continue';
  String get save => 'Save';
  String get version => 'Version 12.2.4';
  String get pleaseWait => 'Please Wait...';
  String get today => 'Today';
  String get yesterday => 'ِِYesterday';
  String get emptyList => 'No data available';

  //SignUp
  String get mazeComposting => 'Maze Composting';
  String get doNotHaveAnAccountMsg => 'Enter your email. If you don’t have an account we’ll create one for you.';
  String get loginAsGuest => 'Login as guest';
  String get agreeMessage => 'By continuing you agree to our';
  String get termsOfService => 'Terms of Service\n';
  String get privacyPolicy => ' Privacy Policy';
  String get email => ' Email';

  //Login
  String get verificationCode => ' Verification code';
  String get codeSend => ' Enter the code sent to';
  String get resend => ' Resend';
  String get resendCode => ' Resend Code in 00:';
  String get resendMsg => ' The code has been sent to your email';
  String get invalidCode => 'Invalid code';

  //Account Creation

  String get createPasswordTitle => ' Create a Password';
  String get createPasswordSubTitle => ' Let’s create your password for\n';
  String get password => 'Password';

  //Login
  String get loginTitle => 'Welcome Back';
  String get loginSubTitle => 'Enter your password to log back into\n';
  String get forgotPassword => 'Forgot password';

  //WellcomPage
   String get welcomeTitle => 'Welcome ';
   String get welcomeSubTitle => 'Let’s get back into it!';

  //Forgot Password
  String get newPasswordTitle => ' New Password';
  String get newPasswordSubTitle => ' Enter your password to log into\n';
  String get confirmPassword => ' Confirm new password';

  //Account Setup
  String get accountDtlTitle => 'Your details';
  String get accountDtlSuTitle => 'First, let’s get to you know you more.';
  String get firstName => 'First name';
  String get lastName => 'Last name';
  String get birthday => 'Birthday';
  String get showBirthday => 'Your birthday isn’t shown on your public profile';
  String get yourProfileTitle => 'Your profile';
  String get yourProfileSubTitle => 'Add a profile picture and username to get\n started. You’ll be able to add more later';
  String get userName => 'User Name';
  String get showPublicProfile => 'These details will be shown on your public profile';
  String get notificationTitle => 'Notifications';
  String get notificationSubTitle => 'Allow us to send you notifications. These will\n help you throughout your composting journey!';
  String get notMsg1 => 'Reminders to take your council bins\n out for collection.';
  String get notMsg2 => 'Keep up to date with the\n communities you follow and create.';
  String get notMsg3 => 'Get helpful tips throughout your\n composting journey';
  String get enableNotifications => 'Enable notifications';
  String get noThanks => 'No thank you';
  String get householdTitle => 'Household info';
  String get householdSubTitle => 'Please enter the following information, this\n helps us properly calculate your waste saved.';
  String get country => 'Country';
  String get state => 'State';
  String get council => 'Council';
  String get postcode => 'Postcode';
  String get householdSize => 'Household size';
  String get accountCreation => 'Complete account creation';
  String get accountSetupTitle => 'Account setup!';
  String get accountSetupSubTitle => 'Welcome to Maze Composting';
  String get search => 'Search';
  String get notFoundAnyResult => 'Result not find';
  String get searchAnotherWord => 'Search for another phrase';
  String get errorFetchInformation => 'Error in receiving information';
  String get tryAgain => 'Try Again';
  String get householdSizeInfoTitle => 'Info';
  String get householdSizeInfoSubTitle => 'By knowing the amount of members of your\n household, it allows us to more accurately\n calculate waste per person.';

//Account Info
  String get account => 'Account';
  String get editProfile => 'Edit profile';
  String get yourDetails => 'Your details';
  String get yourHousehold => 'Your Household';
  String get accountSettings => 'Account settings';
  String get helpCentre => 'Help centre';
  String get about => 'About';
  String get aboutYou => 'About you';
  String get countryLocation => 'What country are you located in?';
  String get stateLocation => 'What state are you located in?';
  String get councilBelong => 'What council do you belong to?';
  String get councilBin => 'Type of council bin';
  String get measurementSystem => 'Measurement system';
  String get metricKilogram => 'Metric (Kilogram)';
  String get imperialPound => 'Imperial (Pound)';
  String get logout => 'Logout';
  String get sureLogout => 'Are you sure?';
  String get deleteAccount => 'Delete account';
  String get contactUs => 'Contact us';
  String get reportProblem => 'Report a problem';
  String get termsConditions => 'Terms and Conditions';
  String get subject => 'Subject';
  String get description => 'Description';
  String get submitReport => 'Submit Report';
  String get yourPassword => 'Your Password';
  String get currentPassword => 'Type in your current password for\n';
  String get typeNewPassword => 'Type in the new password for\n';
  String get newEmailTitle => 'New Email Address';
  String get newEmailSubTitle => 'Enter your new email address.';
  String get newEmailAddress => 'New email address';
  String get verifyNewEmail => 'Verify New Email';
  String get notPublicShow => 'Your full name and birthday isn’t shown publicly';
  String get detailsPublicProfile => 'These details will be shown on your public profile';
  String get profileUpdatedMsg => 'Profile successfully updated';
  String get householdUpdatedMsg => 'Your household successfully updated';
  String get yourDetailsUpdatedMsg => 'your Details successfully updated';
  String get reportSendMsg => 'Report successfully sent';

  //chatbot
  String get chatHomeTitle => 'Messages';
  String get newChat => 'New chat';
  String get faqTitle => 'FAQ';
  String get faqSubTitle => 'View common questions';
  String get chatBotTitle => 'Chat Bot';
  String get message => 'Message';
  String get chatTitleMsg => 'Hey there';
  String get chatDescMsg => 'Feel free to ask me a question\n and I’ll try my best to answer it!';
  String get regenerateAnswer => 'Regenerate Answer';
  String get speakToHuman => 'Speak to a human';
  String get chatMsg => 'Hey there 👋\n \nFeel free to ask me a question\n and I’ll try my best to answer it!';






}

StringsBase appStrings = inject<StringsBase>();
