enum EntryMode {
  accountCreation,
  forgetPassword,
  fetchCountryList,
  fetchStateList,
  fetchCouncilList,
  fetchHouseholdSize;


  bool get isForgetPassword => this == forgetPassword;

  bool get isAccountCreation => this == accountCreation;
  bool get isFetchCountryList => this == fetchCountryList;
  bool get isFetchStateList => this == fetchStateList;
  bool get isFetchCouncilList => this == fetchCouncilList;

}
