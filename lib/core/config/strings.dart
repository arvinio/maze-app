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
  String get older => 'Older';
  String get emptyList => 'No data available';
  String get options => 'Options';
  String get create => 'Create';
  String get edit => 'Edit';
  String get delete => 'Delete';


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
  String get profileUpdatedMsg => 'Profile updated successfully';
  String get householdUpdatedMsg => 'Information updated successfully';
  String get yourDetailsUpdatedMsg => 'Information updated successfully';
  String get reportSendMsg => 'Report sent successfully';

  //chatbot
  String get chatHomeTitle => 'Messages';
  String get newChat => 'New chat';
  String get faqTitle => 'FAQ';
  String get newFaq => 'New FAQ';
  String get updateFaq => 'Update FAQ';
  String get createFaq => 'Create FAQ';
  String get deleteFaq => 'Delete FAQ';
  String get question => 'Question';
  String get answer => 'Answer';
  String get faqCreatedMsg => 'FAQ created successfully';
  String get faqUpdatedMsg => 'FAQ updated successfully';
  String get faqSubTitle => 'View common questions';
  String get chatBotTitle => 'Chat Bot';
  String get message => 'Message';
  String get chatTitleMsg => 'Hey there';
  String get chatDescMsg => 'Feel free to ask me a question\n and I’ll try my best to answer it!';
  String get regenerateAnswer => 'Regenerate Answer';
  String get speakToHuman => 'Speak to a human';
  String get chatMsg => 'Hey there 👋\n \nFeel free to ask me a question\n and I’ll try my best to answer it!';

  //Tutorial

  String get tutorialTitleMsg => 'Hey there 👋';
  String get tutorialSubTitleMsg => 'Welcome to Maze Composting, I’m \nwormy, would you like a quick walk \nthrough of the app?';
  String get noThanksTutorial => 'No thanks';
  String get yesPlease => 'Yes please';
  String get back => 'Back';
  String get next => 'Next';
  String get finishWalkthrough =>'Finish Walkthrough';
  String get communityTutorial => 'Here is where you can interact with\n others in the composting community\n and ask questions to get help on your\n journey.';
  String get knowledgeTutorial => 'This is where you can browse through articles, on all things composting. This is a great place to get started if you’re new to composting.';
  String get liveChatTutorial =>'This is where I live, I’ll try my best to answer all of your questions. If I’m not able to, I’ll transfer you to a human.';
  String get trackerTutorial =>'This is where you can track all of your waste and compost bins. If you’re new to composting, I recommend checking out the Knowledge area first and getting to know the basics.';
  String get profileTutorial =>'Lastly, here you’ll find your public profile and access to your account settings at the top.';
  String get finishTutorial =>'Lastly, If you ever have any questions, feel free to ask the community or myself. Have fun and welcome to Maze Composting! 🎉 ';

  String get community => 'Community';
  String get knowledge => 'Knowledge';
  String get liveChat =>'Live chat';
  String get tracker =>'Tracker';
  String get profile =>'Profile';
  String get thanksForListening =>'Thanks for listening ';

  //Tracker
  String get needHelp =>'Need help?';
  String get newEntry =>'New entry';
  String get tooltipMsg =>'You must at least add a landfill bin to get started with your tracking journey.';
  String get addCompostTitle =>'Add a compost bin ';
  String get addCompostSubTitle =>'Stores waste that will later be \nemptied into your council landfill bin. ';
  String get doNotHaveCompost =>'Don’t have a compost bin? ';
  String get checkOutMazeCompost =>'Check out the Maze compost bins ';
  String get addNewBin =>'Add new bin';
  String get manageBins=>'Manage bins';
  String get yourBins=>'Your bins';
  String get addBinTitle=>'Add bin';
  String get addBinSubTitle=>'Select the type of bin you’d like to add.';
  String get doNotKnowWhatToAdd=>'Don’t know what to add?';
  String get someHelp=>'Tap to get some help';
  String get wasteBinTitle=>'Waste Bin';
  String get wasteBinSubTitle=>'This is can be a landfill, organic or \nrecycling waste bin.';
  String get compostBinTitle=>'Compost Bin';
  String get compostBinSubTitle=>'Is a bin for turning organic waste \ninto nutrient-rich compost.';
  String get haveCompostBinTitle=>'Do you have a \nCompost bin?';
  String get haveCompostBinSubTitle=>'Firstly do you have a compost bin and or a tumbler already?';
  String get alreadyHaveOne=>'I already have one';
  String get doNotHaveOne=>'I don’t have one';
  String get compostBinHelp=>'Anything that transforms your waste into \ncompost we consider as a compost bin.\n\nFor example Bukashi bins and electrical waste\n bins, we still consider as compost bins.  ';
  String get doNotHaveCompostBinTitle=>'Don’t have a \ncompost bin?';
  String get doNotHaveCompostBinSubTitle=>'Below are some options you have on how to \nget started.';
  String get tryMazeProductsTitle=>'Try Maze products';
  String get tryMazeProductsSubTitle=>'Maze is a supplier of quality home and gardening\n products based in Melbourne Australia. Providing\n quality, innovative and sustainable products for the\n home and garden.';
  String get wasteSaved=>'Waste saved';
  String get compostMade=>'Compost made';
  String get wasteRecycled=>'Waste recycled';
  String get waste=>'Waste';
  String get compost=>'Compost';
  String get addLandfillBinTitle=>'Add a landfill bin';
  String get addLandfillBinSubTitle=>'Stores waste that will later be emptied into your council landfill bin.';
  String get addLandfillBinWasteSubTitle=>'Stores waste that will later be emptied into landfill.';
  String get addWasteBinTitle=>'Add waste bin';
  String get addWasteBinSubTitle=>'Select the type of waste bin\nyou’d like to add.';
  String get newWasteBinTitle=>'New landfill\nwaste bin ';
  String get newWasteBinSubTitle=>'Firstly, do you have a council landfill bin? This\n is commonly know as the red wheelie bin and\n is picked up by your council.';
  String get councilLandfillPhrase1=>'I have a council landfill bin';
  String get councilLandfillPhrase2=>'I don’t have a council landfill bin';
  String get councilLandfillPhrase3=>'I share my council landfill bin with other households';
  String get liveApartment=>'(Usually if you live in apartments)';
  String get councilLandfillBinTitle=>'Council landfill bin';
  String get councilLandfillBinSubTitle=>'Please enter in the details below of your\ncouncil landfill waste bin.';
  String get details=>'Details*';
  String get nickname=>'Nickname';
  String get councilPickupDates=>'Council pickup dates';
  String get size=>'Size*';
  String get litres=>'Litres';
  String get dimensions=>'Dimensions';
  String get amountLitres=>'Amount of litres';
  String get width=>'Width';
  String get height=>'Height';
  String get length=>'Length';
  String get photo=>'Photo';
  String get photos=>'Photos';
  String get landfillBinTitle=>'Landfill bin';
  String get landfillBinSubTitle=>'Since you don’t have a council landfill bin, we\nrecommend tracking the bin you primarily use\nfor collecting landfill waste.\n\nPlease enter in the details below of your\nprimary landfill waste bin.';
  String get newCompostBinTitle=>'New compost bin';
  String get newCompostBinSubTitle=>'Please enter in the details below of\nyour new compost bin.';
  String get compartment=>'Does your bin have 2 compartments?';
  String get info=>'Info';
  String get infoMsg=>'The estimated weight is based on the bins\nsize and fullness combined. If you measure\nyour bins, feel free to replace this number.';
  String get compostTumbler=>'Compost Tumbler';
  String get landfillWaste=>'Landfill waste';
  String get landfillWasteBin=>'Landfill waste bin';
  String get noDataAddedYet=>'No data added yet';
  String get entries=>'Entries';
  String get binSize=>'Bin size';
  String get kg=>'kg';
  String get editDetails=>'Edit details';
  String get muteNotifications=>'Mute notifications';
  String get deleteTumbler=>'Delete Backyard Tumbler';
  String get date=>'Date';
  String get entry=>'Entry';
  String get entryType=>'Entry type';
  String get note=>'Note';
  String get noteDesc=>'Added a lot more today, just a friendly\nnote for my future self.';
  String get compostUse=>'Compost use';
  String get whatDidYouAdd=>'What did you add?';
  String get didYouMixIt=>'Did you mix it?';
  String get yes=>'Yes';
  String get no=>'No';
  String get amountOfCompost=>'Amount of compost emptied out';
  String get amountOfWaste=>'Amount of waste emptied';
  String get estimatedWeight=>'Estimated Weight';
  String get howFullCompost=>'How full was the bin compartment\nbefore emptying it?';
  String get howFullPickedUp=>'How full was the bin\nbefore the council picked it up?';
  String get greens=>'Greens';
  String get kitchenScraps=>'Kitchenscraps';
  String get fruits=>'Fruits, Vegetables, etc';
  String get freshYardWaste=>'Fresh yard waste';
  String get grassClippings=>'Grass clippings, plant trimmings, etc';
  String get other=>'Other';
  String get browns=>'Browns';
  String get paperProducts=>'Paper products';
  String get newspaper=>'Newspaper, cardboard, napkins, etc';
  String get dryYardWaste=>'Dry yard waste';
  String get straw=>'Straw, dry grass, wood chip, dead plants, etc';
  String get myGarden=>'My garden';
  String get donated=>'Donated';
  String get compostUseNote=>'Gave it to a friend of mine who\nneeded some soil.';
  String get newEntryFor=>'New entry for';
  String get startLiveChat=>'Start a live chat with us';
  String get browseOurBeginnerArticles=>'Browse our beginner articles';
  String get help=>'Help';
  String get deletedBins=>'Deleted bins';
  String get viewRecoverDeletedBins=>'View / recover deleted bins';
  String get transferData=>'Transfer Data to another bin';
  String get deleteBinTitle=>'Delete Bin';
  String get deleteBinSubTitle=>'The data of the bin won’t be deleted';
  String get permanentDeleteTitle=>'Permanent delete';
  String get permanentDeleteSubTitle=>'The data of the bin will be deleted';
  String get restoreDeletedBin=>'Restore deleted bin';
  String get permanentDeleteDialog=>'Delete this bin?';
  String get permanentDeleteDialog2=>'This is permanent and can’t be undone';
  String get noImage=>'No image';
  String get restoredMsg=>'It was restored';
  String get typeOfCompostBin=>'Type of compost bin';
  String get daysAgo=>'days ago';
  String get addedToLandfill=>'Added to landfill';
  String get totalSentToLandfill=>'Total sent to landfill';
  String get editBin=>'Edit bin';
  String get sentToLandfill=>'Sent to Landfill';
  String get aFullBinSize=>'A full bin size';
  String get aHalfOfTheBinSize=>'A half of the bin size';
  String get aQuarterOfTheBinSize=>'A quarter of the bin size';


  //Pickupdate
  String get monday=>'Monday';
  String get tuesday=>'Tuesday';
  String get wednesday=>'Wednesday';
  String get thursday=>'Thursday';
  String get friday=>'Friday';
  String get saturday=>'Saturday';
  String get sunday=>'Sunday';
  String get everyWeek=>'Every Week';
  String get everySecond=>'Every Second';








}

StringsBase appStrings = inject<StringsBase>();
