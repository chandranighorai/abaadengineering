import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/ui/consultant_profile/ConsultantModel.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/ui/payment_collections/PaymentMonthList.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/monthlyreports/MonthsList.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/approved_drawings/ViewApprovedDrawings.dart';
import 'package:abaadengineering/ui/project_tasks/project_task_screen.dart';
import 'package:abaadengineering/ui/upload_download/UploadDownload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/consultant_profile/ConsultantProfile.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/contactus/ContactUsActivity.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/payment_collections/PaymentsAndCollections.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class MainActivity extends StatefulWidget {
  final Projects projects;
  final String userType;
  const MainActivity({Key key, this.projects, this.userType}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainActivity> {
  int _currentIndex = 0;

  ScrollController _controller = new ScrollController();

  String _userID = '';
  String _fname = '';

  String _lname = '';
  //String _name = '';
  String _email = '';
  var responseData;
  var profileDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserDetails();
    debugPrint(_email + _fname + _lname);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userID = (prefs.getString('userid') ?? '');
      _fname = (prefs.getString('fname') ?? '');
      _lname = (prefs.getString('lname') ?? '');
      //_name = (prefs.getString('name') ?? '');
      _email = (prefs.getString('email') ?? '');
    });
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
  }

  @override
  Widget build(BuildContext context) {
    Projects project = widget.projects;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: Column(children: <Widget>[
            Expanded(
              //margin: EdgeInsets.only(right: 10.0,top: 10.0,left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  right: 75.0, top: 15.0, left: 10),
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.04),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Welcome",
                                style: TextStyle(fontSize: 14.0),
                                textAlign: TextAlign.start,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 0.0, top: 8.0),
                              child: Text(
                                "${_fname + " " + _lname}",
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.start,
                              ),
                            ),
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
                    //   child: SingleChildScrollView(

                    child:
                        //Column(
                        //children: <Widget>[
                        GridView.count(
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
                          child: SvgPicture.asset(iconVillaProgress,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectTasksScreen(
                                  projects: project,
                                ),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(iconMonthly_report,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MonthsListActivity(
                                  project: project,
                                ),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(iconApproved_drawings,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewApprovedDrawings(
                                  project: project,
                                ),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(iconUploads_n_documents,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadDownload(
                                  userID: _userID,
                                  project: project,
                                ),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(iconVillalocation,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => VillaLocation()),
                            // );
                            _launchUrl(project.mapLink);
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(iconPayments_n_collection,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentMonthList(project: project)
                                  // PaymentsAndCollections(
                                  //   project: project,
                                  // ),
                                  ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(iconContact_us,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
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
                          child: SvgPicture.asset(iconConsultant_profile,
                              matchTextDirection: false,
                              height: 150.0,
                              width: 150.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConsultantProfile(
                                        userTypeConsultant: widget.userType,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                    // ],
                    // ),

                    //   )
                  ),
                  // Container(
                  //   child: nextButtonContainer(),),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.25,
                    //color: Colors.amber,
                    child: Stack(
                      children: [
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.04,
                            bottom: MediaQuery.of(context).size.height * 0.00,
                            left: MediaQuery.of(context).size.width * 0.00,
                            right: MediaQuery.of(context).size.width * 0.00,
                            child: Container(
                              //height: MediaQuery.of(context).size.width * 0.16,
                              //color: Colors.red,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProjectsListScreen()));
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: SvgPicture.asset(
                                          iconHome,
                                          matchTextDirection: false,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AccountActivity(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: SvgPicture.asset(
                                          iconAccount,
                                          matchTextDirection: false,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  //)
                                ],
                              ),
                            )),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.01,
                          bottom: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.00,
                          right: MediaQuery.of(context).size.width * 0.00,
                          //child: //       Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            //color: Colors.amber,
                            child: CircularGradientButton(
                              child: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                              ),
                              callback: () {
                                Navigator.pop(context);
                              },
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFE91E63),
                                    Color(0xFFFFC107)
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  )

                  // Container(
                  //   color: Colors.red,
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         color: Colors.teal,
                  //         child: Row(
                  //           children: <Widget>[
                  //             Container(
                  //               width: MediaQuery.of(context).size.width / 2,
                  //               //height: MediaQuery.of(context).size.width * 0.05,
                  //               color: Colors.amber,
                  //               child: new GestureDetector(
                  //                   onTap: () {},
                  //                   child: SvgPicture.asset(iconHome,
                  //                       matchTextDirection: false)),
                  //               //flex: 1,
                  //             ),
                  //             Flexible(
                  //               child: new GestureDetector(
                  //                   onTap: () {
                  //                     Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                         builder: (context) =>
                  //                             AccountActivity(),
                  //                       ),
                  //                     );
                  //                   },
                  //                   child: SvgPicture.asset(iconAccount,
                  //                       matchTextDirection: false)),
                  //               flex: 1,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Center(
                  //         child: Container(
                  //           width: 50,
                  //           height: 50,
                  //           child: CircularGradientButton(
                  //             child: Icon(
                  //               Icons.chevron_left,
                  //               color: Colors.white,
                  //             ),
                  //             callback: () {
                  //               Navigator.pop(context);
                  //             },
                  //             gradient: LinearGradient(
                  //                 colors: [
                  //                   Color(0xFFE91E63),
                  //                   Color(0xFFFFC107)
                  //                 ],
                  //                 begin: Alignment.centerRight,
                  //                 end: Alignment.centerLeft),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )
          ])),
        ));
  }

  Widget nextButtonContainer() {
    return CircularGradientButton(
      child: Icon(
        Icons.chevron_left,
        color: Colors.white,
      ),
      callback: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainActivity()),
        );
      },
      gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft),
    );
  }

  // List<String> images = [
  //   "assets/flowers.jpg",
  //   "assets/nature.jpg",
  //   "assets/parrot.jpg",
  //   "assets/road.jpg",
  //   "assets/flowers.jpg",
  //   "assets/nature.jpg",
  //   "assets/parrot.jpg",
  //   "assets/road.jpg",
  // ];

  _launchUrl(String mapLink) async {
    print("button click..." + mapLink.toString());
    // var url =
    //     "https://www.google.com/maps/place/S.D.F./@22.5691124,88.4287278,17z/data=!3m1!4b1!4m5!3m4!1s0x3a0275adfab28d3f:0xa6158f942cea5e42!8m2!3d22.5691124!4d88.4309165";
    await launch(mapLink);
  }
}
