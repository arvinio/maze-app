enum EntryMode {
  accountCreation,
  forgetPassword;


  bool get isForgetPassword => this == forgetPassword;

  bool get isAccountCreation => this == accountCreation;
}
