import 'package:abaadengineering/project_seletion/projectslist.dart';
//import 'package:abaadengineering/ui/example.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/home/home.dart';
import 'package:flutter/material.dart';
//import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/home/home.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(ScaffoldExample());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print("email..." + email.toString());
  //var userId = prefs.getString("userid");
  runApp(MyApp(email: email));
}

class MyApp extends StatelessWidget {
  final email;
  MyApp({this.email});
  //const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Email..." + email.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? ScaffoldExample() : ProjectsListScreen(),
    );
  }
}
