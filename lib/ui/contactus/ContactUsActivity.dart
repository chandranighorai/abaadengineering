import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/contactus/ChatRoom.dart';
import 'package:abaadengineering/ui/consultant_profile/ConsultantModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:open_whatsapp/open_whatsapp.dart';

class ContactUsActivity extends StatefulWidget {
  var userType;
  var profileData;
  ContactUsActivity({this.userType, this.profileData});
  @override
  _ContactUsActivityState createState() => _ContactUsActivityState();
}

class _ContactUsActivityState extends State<ContactUsActivity> {
  ConsultantProfileList profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profile = widget.profileData[0];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //widget.userType.clear();
  }

  @override
  Widget build(BuildContext context) {
    print("UserType..." + widget.userType.toString());
    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(height: 140.0),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFC107), Color(0xFF03A9F4)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Row(children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Contact \nUs',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    // color: Colors.blueAccent,
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 170.0, 15.0),

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
        Expanded(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.0),
              Container(
                  margin: EdgeInsets.only(left: 15.0, right: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    gradient: LinearGradient(
                        colors: [Color(0xFF700A81), Color(0xFFE91EA5)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft),
                  ),
                  child: Row(children: <Widget>[
                    FlatButton.icon(
                      onPressed: null,
                      //icon: Icon(Icons.phone, color: Colors.white),
                      icon: Icon(Icons.person, color: Colors.white),
                      //label: Text("+971 92 37 3305",
                      label:
                          //Text("${profile.consultantName}",
                          Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text("${profile.consultantName}",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            )),
                      ),
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    )
                  ])),
              SizedBox(height: 10.0),
              InkWell(
                onTap: () {
                  _directCall(profile.phoneNumber.toString());
                },
                child: Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      gradient: LinearGradient(
                          colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                    ),
                    child: Row(children: <Widget>[
                      FlatButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.phone, color: Colors.white),
                        label: Text("${profile.phoneNumber}",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            )),
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      )
                    ])),
              ),
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
                  child: Row(children: <Widget>[
                    FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.email_outlined, color: Colors.white),
                      label: Text("${profile.emailId}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          )),
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    )
                  ])),
              SizedBox(height: 10.0),
              InkWell(
                onTap: () {
                  _whatsappOpen(profile.whatsappNumber.toString());
                },
                child: Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      gradient: LinearGradient(
                          colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                    ),
                    child: Row(children: <Widget>[
                      FlatButton.icon(
                        onPressed: null,
                        icon: Icon(FontAwesomeIcons.whatsapp,
                            color: Colors.white),
                        label: Text("${profile.whatsappNumber}",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            )),
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      )
                    ])),
              ),
              SizedBox(height: 40.0),
              widget.userType == "Guest"
                  ? SizedBox()
                  : Text(
                      "Or Let’s Have A Chat Here",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
              SizedBox(height: 20.0),
              widget.userType == "Guest"
                  ? SizedBox()
                  : Container(
                      margin: EdgeInsets.only(left: 100.0, right: 120.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Row(children: <Widget>[
                        FlatButton.icon(
                          onPressed: () {
                            print("ChatRoom Clicked...");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatRoom()));
                          },
                          icon: Icon(Icons.chat_outlined, color: Colors.white),
                          label: Text("CHAT ROOM",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              )),
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        )
                      ])),
            ],
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
      ])),
    );
  }

  List<String> options = [
    "Governmental Payments",
    "Office Payments",
    "Collections"
  ];
}

_directCall(String phoneNumber) async {
  print("Phone Number..." + phoneNumber);
  FlutterPhoneDirectCaller.callNumber(phoneNumber);
}

_whatsappOpen(String whatsappNumber) {
  FlutterOpenWhatsapp.sendSingleMessage(whatsappNumber, "Hello");
}
