import 'dart:convert';
import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/user_prefs.dart';
import 'package:abaadengineering/models/userdata.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/ui/dialogs/forgot_dialog.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/accounts/forgot_password.dart';
import 'package:abaadengineering/util/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/accounts/SignUpActivity.dart';
import 'package:abaadengineering/ui/mainActivity.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  //===========================
  String userEmail = "";
  String userPassword = "";
  String forgotEmail = "";
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  void loginUser(BuildContext context) async {
    if (userEmail.trim() == "") {
      showCustomToast("Please enter email.");
      return;
    }
    if (userPassword.trim() == "") {
      showCustomToast("Pleaase enter password");
      return;
    }
    // var requestLogin = jsonEncode(<String, String>{
    //   'email': userEmail.toString(),
    //   'password': userPassword.toString(),
    // });

    var requestLogin = "?email=" + userEmail + "&password=" + userPassword;

    final response =
        await http.get(Uri.parse('' + Consts.CUST_LOGIN + requestLogin));

    var getURL = Consts.CUST_LOGIN + requestLogin;

    debugPrint("Login URL ${getURL}");
    if (response.statusCode == 200) {
      print(response.body);
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == "success") {
        // showCustomToast("" + responseData['status']);
        var jsonUserData = responseData['userdata'];

        UserData userData = new UserData(
            true,
            jsonUserData['id'],
            jsonUserData['name'],
            jsonUserData['email_id'],
            jsonUserData['phone_number'],
            jsonUserData['profile_picture'],
            int.parse(jsonUserData['is_notified'].toString()) == 1
                ? true
                : false,
            int.parse(jsonUserData['is_active'].toString()) == 1 ? true : false,
            jsonUserData['created'],
            jsonUserData['last_login_time']);

        saveUserPrefs(userData);
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ProjectsListScreen(
                    userData: userData,
                  )),
        );
      } else
        showCustomToast("" + responseData['message']);
    } else {
      showCustomToast("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 50.0,
          right: 20.0,
          left: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/Icon Set_page_30.png', height: 150, width: 150),
            SizedBox(
              height: 40.0,
            ),
            buildTextField(
              "Email",
            ),
            SizedBox(
              height: 20.0,
            ),
            buildTextField("Password"),
            SizedBox(
              height: 20.0,
            ),
            nextButtonContainer(context),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              ForgotPasswordDialog()),

                      // showDialog(
                      //   barrierDismissible: false,
                      //   context: context,
                      //   builder: (context) {
                      //     return showForgotDialog();
                      //   },
                      // ),
                    },
                    child: Text(
                      "Forgotten Password?",
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 30.0),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Text(
            //         "Or",
            //         style: TextStyle(
            //           color: Colors.black38,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(height: 5.0),
            // buildButtonContainer(),
            // SizedBox(
            //   height: 10.0,
            // ),
            // Container(
            //   child: Center(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         SizedBox(
            //           height: 40.0,
            //         ),
            //         SizedBox(
            //             width: 80.0,
            //             height: 1.0,
            //             child: const DecoratedBox(
            //                 decoration:
            //                     const BoxDecoration(color: Colors.grey))),
            //         SizedBox(
            //           height: 40.0,
            //         ),
            //         SizedBox(
            //           width: 10.0,
            //         ),
            //         Text("You can sign in with"),
            //         SizedBox(
            //           width: 10.0,
            //         ),
            //         SizedBox(
            //           height: 40.0,
            //         ),
            //         SizedBox(
            //             width: 80.0,
            //             height: 1.0,
            //             child: const DecoratedBox(
            //                 decoration:
            //                     const BoxDecoration(color: Colors.grey))),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 30.0,
            // ),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[gPlusButtonContainer(), fbButtonContainer()],
            //   ),
            // ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:
            hintText == "Email" ? Icon(Icons.person) : Icon(Icons.vpn_key),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
      keyboardType:
          hintText == "Email" ? TextInputType.emailAddress : TextInputType.text,
      onChanged: (value) => {
        setState(() {
          hintText == "Email"
              ? userEmail = value
              : (hintText == "Password")
                  ? userPassword = value
                  : "";
        })
      },
    );
  }

  Widget buildButtonContainer() {
    return Container(
      height: 56.0,
      width: 100.0,
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3.0),
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: FlatButton(
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 15.0,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          }),
    );
  }

  Widget gPlusButtonContainer() {
    return Container(
        height: 40.0,
        width: 100.0,
        // margin: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 3.0),
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Row(children: <Widget>[
          Icon(Icons.chevron_right, color: Colors.red),
          Text(
            "Google",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.0,
            ),
          ),
        ]));
  }

  Widget fbButtonContainer() {
    return Container(
      height: 40.0,
      width: 120.0,
      margin: EdgeInsets.only(left: 20.0),
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo, width: 3.0),
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Row(children: <Widget>[
        Icon(Icons.chevron_right, color: Colors.indigo),
        Text(
          "Facebook",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 16.0,
          ),
        ),
      ]),
    );
  }

  Widget nextButtonContainer(BuildContext context) {
    return CircularGradientButton(
      child: Icon(
        Icons.chevron_right,
        color: Colors.white,
      ),
      callback: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MainActivity()),
        // );
        loginUser(context);
      },
      gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft),
    );
  }

  _forgotPassword() {
    if (forgotEmail == null || forgotEmail == "") {
      showCustomToast("Please enter email");
      return;
    } else {
      showCustomToast("Coming soon");
    }
  }

  Widget showForgotDialog() {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(
            top: 20.0,
            left: 10.0,
            right: 10.0,
            bottom: 20.0,
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter email",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => {
                  forgotEmail = value,
                },
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _forgotPassword();
              },
              child: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
