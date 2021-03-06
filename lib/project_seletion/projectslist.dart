import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/models/userdata.dart';
import 'package:abaadengineering/project_seletion/item_projects.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/example.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class ProjectsListScreen extends StatefulWidget {
  final UserData userData;
  final String userType;
  const ProjectsListScreen({Key key, this.userData, this.userType})
      : super(key: key);
  @override
  _ProjectsListScreenState createState() => _ProjectsListScreenState();
}

class _ProjectsListScreenState extends State<ProjectsListScreen> {
  int _selectedIndex = 0;

  Future<ProjectsModel> mListprojects;
  var serverStatus;

  Future<ProjectsModel> _getProjects() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = (prefs.getString('userid') ?? '');
    print("userId..." + userId.toString());
    var projectRequestParam = "user_id=" + userId;
    var PROJECT_URL = Consts.GET_PROJECT_LIST + "?" + projectRequestParam;
    print("project_url..." + PROJECT_URL.toString());
    final response = await http.get(Uri.parse(PROJECT_URL));
    print("Status code ${response.body}");
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      setState(() {
        serverStatus = responseData['status'];
      });
      if (serverStatus == "success") {
        return ProjectsModel.fromJson(responseData);
      } else {
        showCustomToast("" + responseData['message']);
      }
    } else {
      showCustomToast("Something went worng");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mListprojects = _getProjects();
  }

  @override
  void dispose() {
    super.dispose();
  }

  DateTime currentBackPressTime;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tap again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = widget.userData;
    print("UserType......in projectList..." + widget.userType.toString());
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _onWillPop,
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
                              'Projects',
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

                  //  SizedBox(height: 60.0,),
                ],
              ),
              Expanded(
                child: serverStatus.toString() == "failed"
                    ? Center(
                        child: Text("No Data"),
                      )
                    : FutureBuilder(
                        initialData: null,
                        future: mListprojects,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            var listProjects = snapshot.data.projectLists;
                            print("ListProjects..." + listProjects.toString());
                            return listProjects.length == 0
                                ? Container(
                                    color: Colors.white,
                                    child: Text("No projects added yet"),
                                  )
                                : ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    //itemCount: 12,
                                    itemCount: listProjects.length,
                                    itemBuilder: (context, int index) {
                                      Projects projects = listProjects[index];
                                      return ItemProjects(
                                          projects: projects,
                                          userType: widget.userType);
                                    });
                          } else {
                            print("sfsdfsfs...." + snapshot.hasData.toString());
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
              ),
              //Spacer(),

              //bottom design modification

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
                              Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: SvgPicture.asset(
                                    iconHome,
                                    matchTextDirection: false,
                                    fit: BoxFit.fill,
                                  )),
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
                            DateTime now = DateTime.now();
                            if (currentBackPressTime == null ||
                                now.difference(currentBackPressTime) >
                                    Duration(seconds: 2)) {
                              currentBackPressTime = now;
                              Fluttertoast.showToast(msg: "Tap again to exit");
                            } else {
                              SystemNavigator.pop();
                            }
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
              ),

              // Stack(
              //   children: [
              //     Row(
              //       children: <Widget>[
              //         Flexible(
              //           child: new GestureDetector(
              //               onTap: () {},
              //               child: SvgPicture.asset(iconHome,
              //                   //fit: BoxFit.fitHeight,
              //                   matchTextDirection: false)),
              //           flex: 1,
              //           //flex: 0,
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
              //                   //fit: BoxFit.fitHeight,
              //                   matchTextDirection: false)),
              //           //flex: 0,
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
              //             DateTime now = DateTime.now();
              //             if (currentBackPressTime == null ||
              //                 now.difference(currentBackPressTime) >
              //                     Duration(seconds: 2)) {
              //               currentBackPressTime = now;
              //               Fluttertoast.showToast(msg: "Tap again to exit");
              //             } else {
              //               SystemNavigator.pop();
              //             }
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
}
