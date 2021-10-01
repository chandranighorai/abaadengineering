import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'DownloadActivity.dart';
import 'UploadActivity.dart';

class UploadDownload extends StatefulWidget {
  final String userID;
  final Projects project;

  const UploadDownload({Key key, this.userID, this.project}) : super(key: key);
  @override
  _UploadDownloadState createState() => _UploadDownloadState();
}

class _UploadDownloadState extends State<UploadDownload> {
  @override
  Widget build(BuildContext context) {
    var userID = widget.userID;
    Projects project = widget.project;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
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
                            colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Upload\nAnd Download',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),

                            // color: Colors.blueAccent,

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

                  //  SizedBox(height: 60.0,),
                ],
              ),
              // SizedBox(
              //   height: 70.0,
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadActivity(
                              userID: userID,
                              project: project,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        iconDownload,
                        matchTextDirection: false,
                        height: 150.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DownloadActivity(
                              project: project,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset(iconUpload,
                          matchTextDirection: false, height: 150.0),
                    )
                  ],
                ),
                flex: 1,
                //   margin: EdgeInsets.only(top: 30.0),
              ),

              //design Modification
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
                                          ProjectsListScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
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
                                      builder: (context) => AccountActivity(),
                                    ),
                                  );
                                },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
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
                              colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft),
                        ),
                      ),
                    ),
                    // )
                  ],
                ),
              )

              // Stack(
              //   children: [
              //     Row(
              //       children: <Widget>[
              //         Flexible(
              //           child: new GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => ProjectsListScreen(),
              //                   ),
              //                 );
              //               },
              //               child: SvgPicture.asset(iconHome,
              //                   matchTextDirection: false)),
              //           flex: 1,
              //         ),
              //         Flexible(
              //           child: new GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => AccountActivity(),
              //                   ),
              //                 );
              //               },
              //               child: SvgPicture.asset(iconAccount,
              //                   matchTextDirection: false)),
              //           flex: 1,
              //         ),
              //       ],
              //     ),
              //     Center(
              //       child: Container(
              //         width: 50,
              //         height: 50,
              //         child: CircularGradientButton(
              //           child: Icon(
              //             Icons.chevron_left,
              //             color: Colors.white,
              //           ),
              //           callback: () {
              //             Navigator.pop(context);
              //           },
              //           gradient: LinearGradient(
              //               colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
              //               begin: Alignment.centerRight,
              //               end: Alignment.centerLeft),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  final options = [
    "Basic Information",
    "Change Password",
    "Settings",
    "Legal Information",
    "Send Feedback",
    "Logout"
  ];
}
