import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FeedBack extends StatefulWidget {
  final String option;
  FeedBack({Key key, this.option}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController feedbackText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    feedbackText = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
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
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 2.0),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.width * 0.03))),
                  child: TextFormField(
                    controller: feedbackText,
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                        hintText: "Give Your Feedback...",
                        border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFC7D5EF), Color(0xFFC78FC0)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.03))),
                    child: TextButton(
                        onPressed: () =>
                            _feedbackSubmit(feedbackText.text.trim()),
                        child: Text(
                          "Submit".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ))),
              )
            ],
          ),
        ),
      )),
    );
  }

  _feedbackSubmit(String feedbackText) async {
    try {
      if (feedbackText.length == 0) {
        showCustomToast("Please give feedback");
      } else {
        SharedPreferences pref = await SharedPreferences.getInstance();
        var fName = pref.getString("fname");
        var lName = pref.getString("lname");
        var email = pref.getString("email");
        var phoneNumber = pref.getString("userPhone");
        var name = fName + " " + lName;
        // print("bbcvb" + name.toString());
        // //print("bbcvb" + lName.toString());
        // print("bbcvb" + email.toString());
        // print("bbcvb" + phoneNumber.toString());
        var requestParam = "name=" +
            name +
            "&email=" +
            email +
            "&phone=" +
            phoneNumber +
            "&msg=" +
            feedbackText;
        var feedbackUrl = Consts.SEND_FEEDBACK + "?" + requestParam;
        var response = await http.get(Uri.parse(feedbackUrl));
        print("response..." + response.body.toString());
        var responseData = jsonDecode(response.body);
        showCustomToast(responseData["message"].toString());
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
