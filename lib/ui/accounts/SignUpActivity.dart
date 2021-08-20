import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/ui/mainActivity.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userPassword = "";
  String confirmPassword = "";

  void signUpUser(BuildContext context) async {
    if (userName == "") {
      showCustomToast("Please enter username.");
      return;
    }
    if (userEmail == "") {
      showCustomToast("Please enter email.");
      return;
    }
    if (userMobile == "") {
      showCustomToast("Please enter mobile number.");
      return;
    }
    if (userPassword == "") {
      showCustomToast("Pleaase enter password");
      return;
    }
    if (confirmPassword != userPassword) {
      showCustomToast("Pleaase enter same password");
      return;
    }
    var requestRegister = jsonEncode(<String, String>{
      'action': 'create_user',
      'email': userEmail.toString(),
      'passeword': userPassword.toString(),
    });
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
            buildTextFieldUser("Username"),
            SizedBox(
              height: 20.0,
            ),
            buildTextFieldEmail(
              "Email",
            ),
            SizedBox(
              height: 20.0,
            ),
            buildTextFieldMobile("Mobile"),
            SizedBox(
              height: 20.0,
            ),
            buildTextFieldPass("Password"),
            SizedBox(
              height: 20.0,
            ),
            buildTextFieldPass("Re-Type Password"),
            SizedBox(
              height: 20.0,
            ),
            nextButtonContainer(context),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldUser(String hintText) {
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
            hintText == "Username" ? Icon(Icons.person) : Icon(Icons.vpn_key),
      ),
      onChanged: (value) => {
        setState(
          () {
            userName = value;
          },
        ),
      },
    );
  }

  Widget buildTextFieldEmail(String hintText) {
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
            hintText == "Email" ? Icon(Icons.email) : Icon(Icons.vpn_key),
      ),
      onChanged: (value) => {
        setState(
          () {
            userEmail = value;
          },
        ),
      },
    );
  }

  Widget buildTextFieldMobile(String hintText) {
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
        prefixIcon: hintText == "Mobile"
            ? Icon(Icons.phone_android)
            : Icon(Icons.vpn_key),
      ),
      onChanged: (value) => {
        setState(
          () {
            userMobile = value;
          },
        ),
      },
    );
  }

  Widget buildTextFieldPass(String hintText) {
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
        prefixIcon: hintText == "Password" || hintText == "Re-Type Password"
            ? Icon(Icons.vpn_key_outlined)
            : Icon(Icons.vpn_key),
      ),
      obscureText: true,
      onChanged: (value) => {
        setState(
          () {
            hintText == "Password"
                ? userPassword = value
                : (hintText == "Re-Type Password")
                    ? confirmPassword = value
                    : "";
          },
        ),
      },
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
        signUpUser(context);
      },
      gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft),
    );
  }
}
