import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/ui/ProfileNVision.dart';
import 'package:abaadengineering/ui/consultant_profile/ConsultantModel.dart';

import 'package:abaadengineering/ui/consultant_profile/customerFeedback/CustomerFeedback.dart';
import 'package:abaadengineering/ui/consultant_profile/previousWork/PreviousWork.dart';
import 'package:abaadengineering/ui/consultant_profile/someOfOurDesign/SomeOfDesign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
// import 'package:abaadengineering/ui/OurLocation.dart';
// import 'package:abaadengineering/ui/ProfileAdnVision.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import '../contactus/ContactUsActivity.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultantProfile extends StatefulWidget {
  @override
  _ConsultantProfileState createState() => _ConsultantProfileState();
}

class _ConsultantProfileState extends State<ConsultantProfile> {
  Future<ConsultantProfileList> _constantData;
  var responseData;
  var profileDataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _constantData = _getConsultant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(height: 120.0),
            Container(
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
                      'Consultant \nProfile',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    // color: Colors.blueAccent,
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 140.0, 15.0),

                    // color: Colors.white,
                    // onPressed: _nextActivity,
                  ),
                ])),
            SizedBox(
              width: 15.0,
              height: 30.0,
            ),
            SvgPicture.asset(iconLogo,
                matchTextDirection: false, height: 70.0, width: 68.0),
            SizedBox(
              height: 60.0,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 60.0),
            Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFF700A81), Color(0xFFE91EA5)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileNVision(
                                    profileData: profileDataList)),
                          );
                        },
                        child: Row(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(iconVision),
                          ),
                          Text("View Our Profile And Vision",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              )),
                        ])))),
            SizedBox(height: 10.0),
            Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Container(
                    padding: EdgeInsets.all(18.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SomeOfDesign()),
                          );
                        },
                        child: Row(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(iconDesign),
                          ),
                          Text("View Some Of Our Designs",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              )),
                        ])))),
            SizedBox(height: 10.0),
            Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFC107), Color(0xFF03A9F4)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Container(
                    padding: EdgeInsets.all(18.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PreviousWork()),
                          );
                        },
                        child: Row(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(iconWork),
                          ),
                          Text("View Previous Work Done",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              )),
                        ])))),
            SizedBox(height: 10.0),
            Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerFeedback()),
                          );
                        },
                        child: Row(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(iconFeedback),
                          ),
                          Text("Our Valued Customers Feedback",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              )),
                        ])))),
            SizedBox(height: 10.0),
            Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFF700A81), Color(0xFFE91EA5)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsActivity()),
                          );
                        },
                        child: Row(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(iconContact),
                          ),
                          Text("Contact Us",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              )),
                        ])))),
            SizedBox(height: 10.0),
            Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Container(
                    padding: EdgeInsets.all(18.0),
                    child: GestureDetector(
                        onTap: () {
                          _viewOurLocation(responseData["consultant_profile"][0]
                                  ["map_link"]
                              .toString());
                        },
                        child: Row(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(iconMarker),
                          ),
                          Text("View Our Location",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              )),
                        ])))),
          ],
        )
      ])),
    );
  }

  List<String> options = [
    "Governmental Payments",
    "Office Payments",
    "Collections"
  ];

  Future<ConsultantProfileList> _getConsultant() async {
    try {
      var response = await http.get(Uri.parse(Consts.CONSULTANT_PROFILE));
      responseData = jsonDecode(response.body);
      if (responseData["status"] == "success") {
        var consultantProfile = responseData["consultant_profile"];
        for (int i = 0; i < consultantProfile.length; i++) {
          ConsultantProfileList profileData = new ConsultantProfileList();
          profileData.consultantName = consultantProfile[i]["consultant_name"];
          profileData.description = consultantProfile[i]["description"];
          profileData.emailId = consultantProfile[i]["email_id"];
          profileData.address = consultantProfile[i]["address"];
          profileData.phoneNumber = consultantProfile[i]["phone_number"];
          profileData.instagramId = consultantProfile[i]["instagram_id"];
          profileData.whatsappNumber = consultantProfile[i]["whatsapp_number"];
          profileDataList.add(profileData);
        }
        print("profiledata..." + profileDataList.toString());
      }
      //return ConsultantModel.fromJson(responseData);
    } on Exception catch (e) {
      print(e.toString());
      print("No Network");
    }
  }

  _viewOurLocation(String _mapLink) async {
    await launch(_mapLink);
  }
}
