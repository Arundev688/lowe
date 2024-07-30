class Constants {

  static const appTitle = 'Hutrac';

  //login screen
  static const login = 'Login';
  static const email = 'Email';
  static const password = 'Password';
  static const remember = 'Remember me';
  static const forget = 'Forgot Password?';
  static const noAccount = "Don't have an account?";
  static const signUpHere = ' Sign up here';

  //forget screen
 static const forgetNotes = 'Please enter your registered email to get reset link';
 static const sendResetLink = 'Send Reset Link';

 //reset screen
  static const resetTitle = 'Reset your password';
  static const confirmPassword = 'Confirm Password';
  static const resetPassword = 'Reset Password';

  //dashboard web
  static const List<String> tabBarTitles = [
    'Dashboard',
    'Onboard assets',
    'Associate Entitles',
    'Live Tracking'
  ];

  //home mobile
  static const scanOnboard = 'Scan and onboard';
  static const scanAssociate = 'Scan and associate';
  static const exitInfo = 'Are you sure want to exit app?';


  //dashboard mobile
  static const List<String> mobileDashboardMenu = [
   /* 'Onboard',*/
    'Dashboard',
    'Entitles',
   /* 'Settings'*/
  ];

  //settings mobile
  static const profileTitle = "Personal Info";
  static const logout = "Logout";
  static const name= "Name";
  static const logoutInfo = "Are you sure want to logout?";
  static const role = "Role";

  //scanning options screen
  static const List<String> scanningOption = [
   "Onboard Package",
   "Onboard Sensor",
   "Onboard & Associate",
   "Onboard Gateway",
   "Disassociate"
 ];


}
