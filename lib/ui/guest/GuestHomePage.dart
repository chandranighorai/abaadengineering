import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/ui/consultant_profile/ConsultantModel.dart';
import 'package:abaadengineering/ui/consultant_profile/ConsultantProfile.dart';
import 'package:abaadengineering/ui/contactus/ContactUsActivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;

class GuestHomePage extends StatefulWidget {
  String userType;
  GuestHomePage({this.userType, Key key}) : super(key: key);

  @override
  _GuestHomePageState createState() => _GuestHomePageState();
}

class _GuestHomePageState extends State<GuestHomePage> {
  ScrollController _controller = new ScrollController();
  var responseData;
  var profileDataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserDetails();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("UserType......in Guest..." + widget.userType.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.only(right: 75.0, top: 15.0, left: 10),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome",
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.start,
                        ),
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(left: 0.0, top: 8.0),
                      //   child: Text(
                      //     "${_name}",
                      //     style: TextStyle(fontSize: 16.0),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // ),
                      // SizedBox(height: 10.0,),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10.0, left: 110.0),
                      child: SvgPicture.asset(
                        iconLogo,
                        matchTextDirection: false,
                        height: 60.0,
                        width: 60.0,
                      )),
                ],
              ),
            ),
            Expanded(
                child: GridView.count(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04),
              crossAxisCount: 2,
              crossAxisSpacing: 40.0,
              mainAxisSpacing: 6.0,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              shrinkWrap: true,
              children: <Widget>[
                GestureDetector(
                  child: SvgPicture.asset(
                    iconContact_us,
                    matchTextDirection: false,
                    height: 150.0,
                    width: 150.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactUsActivity(
                            userType: widget.userType,
                            profileData: profileDataList),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    iconConsultant_profile,
                    matchTextDirection: false,
                    height: 150.0,
                    width: 150.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConsultantProfile(
                                userTypeConsultant: widget.userType,
                              )),
                    );
                  },
                )
              ],
            )),
            Stack(children: [
              Center(
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
            ]),
          ],
        ),
      )),
    );
  }

  void _getUserDetails() async {
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
    } on Exception catch (e) {}
  }
}
