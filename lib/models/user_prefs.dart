import 'package:abaadengineering/models/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveUserPrefs(UserData userData) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  preferences.setBool("isLoggedIn", true);

  //preferences.setString("name", userData.name.toString());
  preferences.setString("fname", userData.fname.toString());

  preferences.setString("lname", userData.lname.toString());

  preferences.setString("userid", userData.id);

  preferences.setString("email", userData.emailID.toString());

  preferences.setString("userPhone", userData.userPhone);

  preferences.setString("profilePicture", userData.profilePicture);
  preferences.setBool("isNotified", false);
  preferences.setBool("isActive", false);
  preferences.setString("createdAt", userData.createdAt);
  preferences.setString("lastLoginTime", userData.lastLoginTime);
}
