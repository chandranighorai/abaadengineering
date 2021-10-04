import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/home/home.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/accounts/loginPage.dart';
import 'package:abaadengineering/ui/myaccount/BasicInformation.dart';
import 'package:abaadengineering/ui/myaccount/ChangePassword.dart';
import 'package:abaadengineering/ui/myaccount/Feedback.dart';
import 'package:abaadengineering/ui/myaccount/LegalInformation.dart';
import 'package:abaadengineering/ui/myaccount/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountActivity extends StatefulWidget {
  @override
  _AccountActivityState createState() => _AccountActivityState();
}

class _AccountActivityState extends State<AccountActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      //margin: EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF700A81), Color(0xFFE91EA5)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Row(children: <Widget>[
                        FlatButton(
                          child: Text(
                            'My \nAccount',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),

                          // color: Colors.blueAccent,
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 170.0, 15.0),

                          // color: Colors.white,
                          // onPressed: _nextActivity,
                        ),
                      ])),
                  SizedBox(width: 15.0),

                  Container(
                    //margin: EdgeInsets.only(top: 40.0),
                    child: SvgPicture.asset(
                      iconLogo,
                      matchTextDirection: false,
                      height: 70.0,
                      width: 68.0,
                    ),
                  )

                  //  SizedBox(height: 60.0,),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        _listItemPressed(context, index);
                      },
                      title: Text(
                        options[index],
                        style: TextStyle(fontSize: 15.0),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularGradientButton(
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      callback: () {
                        Navigator.pop(context);
                      },
                      gradient: LinearGradient(
                          colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final options = [
    "Basic Information",
    "Change Password",
    //"Settings",
    "Legal Information",
    "Send Feedback",
    "Logout"
  ];

  _listItemPressed(BuildContext context, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //var name = prefs.getString("name");
    var fname = prefs.getString("fname");
    var lname = prefs.getString("lname");
    var email = prefs.getString("email");
    var userId = prefs.getString("userid");
    if (options[index] == "Logout") {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs?.clear();
      //Navigator.pop(context);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ScaffoldExample(),
      //   ),
      // );
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Do you really want to exit?"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("No")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScaffoldExample(),
                            ),
                            (route) => false);
                        prefs?.clear();
                      },
                      child: Text("Yes"))
                ],
              ));
    } else if (options[index] == "Basic Information") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BasicInformation(
                  option: options[index],
                  fname: fname,
                  lname: lname,
                  email: email)));
    } else if (options[index] == "Legal Information") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LegalInformation(
                    option: options[index],
                  )));
    } else if (options[index] == "Send Feedback") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FeedBack(option: options[index])));
    } else {
      debugPrint("${options[index]} pressed");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChangePassword(option: options[index], userId: userId)));
    }
  }
}
