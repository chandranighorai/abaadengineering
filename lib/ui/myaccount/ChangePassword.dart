import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_widgets/gradient_widgets.dart';

class ChangePassword extends StatefulWidget {
  final String option;
  final String userId;
  ChangePassword({Key key, this.option, this.userId}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPassword, newPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldPassword = new TextEditingController();
    newPassword = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF700A81), Color(0xFFE91EA5)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              widget.option.toString(),
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),

                            // color: Colors.blueAccent,
                            // padding: EdgeInsets.fromLTRB(15.0, 15.0, 120.0, 15.0),
                            // color: Colors.white,
                            // onPressed: _nextActivity,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    width: 100,
                    child: SvgPicture.asset(
                      iconLogo,
                      matchTextDirection: false,
                      height: 50.0,
                      width: 50.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: oldPassword,
                  decoration: InputDecoration(hintText: "Old Password"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: newPassword,
                  decoration: InputDecoration(hintText: "New Password"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFC7D5EF), Color(0xFFC78FC0)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.width * 0.02))),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () => _passwordChage(
                          oldPassword.text.trim().toString(),
                          newPassword.text.trim().toString()),
                      child: Text(
                        "Submit".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 50,
                      height: 50,
                      //color: Colors.red,
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
              ),
            ],
          ),
        ),
      )),
    );
  }

  _passwordChage(String oldPass, String newPass) async {
    print("userId..." + widget.userId.toString());
    try {
      if (oldPass.length == 0 || newPass.length == 0) {
        showCustomToast("Field should not empty");
      } else {
        var requestParam = "user_id=" +
            widget.userId.toString() +
            "&old_password=" +
            oldPass +
            "&new_password=" +
            newPass;
        var changePassUrl = Consts.CHANGE_PASSWORD + "?" + requestParam;
        var response = await http.get(Uri.parse(changePassUrl));
        var responseData = jsonDecode(response.body);
        print("response_body..." + responseData["message"].toString());
        showCustomToast(responseData["message"].toString());
        oldPassword.text = "";
        newPassword.text = "";
      }
    } on Exception catch (e) {
      print(e.toString());
      showCustomToast("No Network");
    }
  }
}
