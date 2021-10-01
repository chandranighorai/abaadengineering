import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/ui/monthlyreports/ItemMonthlyReport.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gradient_widgets/gradient_widgets.dart';

//import '../AccountActivity.dart';
import 'MonthReportModel.dart';

class MonthlyReportScreen extends StatefulWidget {
  final Projects project;
  final String monthName;
  final String year;

  const MonthlyReportScreen({Key key, this.project, this.monthName, this.year})
      : super(key: key);
  @override
  _MonthlyReportScreenState createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
  bool hasReports = true;
  String serverMessage = "";
  String _projectId;
  String _monthName;
  String _yearSelected;
  String _finalPath;
  Future<List<MonthlyReportModel>> mListDesigns;
  List<MonthlyReportModel> mListReport;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _projectId = widget.project.propertyID;
    _monthName = widget.monthName;
    _yearSelected = widget.year;
    mListReport = [];

    mListDesigns = _getDesigns();
  }

  Future<List<MonthlyReportModel>> _getDesigns() async {
    List<MonthlyReportModel> arrReport = [];
    var projectRequestParam = "project_id=" + _projectId;
    projectRequestParam += "&year=" + _yearSelected;
    projectRequestParam += "&month=" + _monthName;
    var PROJECT_URL =
        Uri.parse(Consts.VIEW_MONTHLY_RFEPORTS + "?" + projectRequestParam);
    final response = await http.get(PROJECT_URL);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      var responseData = jsonDecode(response.body);
      var serverStatus = responseData['status'];
      var serverMessage = responseData['message'];
      var reportList = responseData['reports_list'];
      print("ReportList..." + reportList.toString());
      if (serverStatus == "success") {
        for (int i = 0; i < reportList.length; i++) {
          var itemData = reportList[i];
          MonthlyReportModel monthlyReportModel = new MonthlyReportModel();
          monthlyReportModel.id = itemData['id'];
          monthlyReportModel.projectId = itemData['project_id'];
          monthlyReportModel.reportName = itemData['report_name'];
          monthlyReportModel.year = itemData['year'];
          monthlyReportModel.month = itemData['month'];
          monthlyReportModel.files = itemData['files'];
          monthlyReportModel.files = itemData['files'];
          monthlyReportModel.status = itemData['status'];
          monthlyReportModel.status = itemData['status'];
          monthlyReportModel.projectName = itemData['project_name'];
          monthlyReportModel.reportFiles = itemData['report_files'];

          arrReport.add(monthlyReportModel);
        }
      }
    } else {
      setState(() {
        hasReports = false;
      });
    }
    debugPrint("${arrReport.length}");
    return arrReport;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
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
                          '$_monthName $_yearSelected\nReport',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
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
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
              ),
              child: FutureBuilder(
                initialData: null,
                future: mListDesigns,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && hasReports) {
                    mListReport = snapshot.data;
                    return mListReport.length == 0
                        ? Container(
                            //color: Colors.white,
                            child: Center(child: Text("No projects added yet")),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                itemCount: mListReport.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: width / height,
                                ),
                                itemBuilder: (context, int index) {
                                  return ItemMonthlyReport(
                                    itemMonthlyReport: mListReport[index],
                                  );
                                }),
                          );
                  } else {
                    return !hasReports
                        ? Container(
                            child: Center(
                              child: Text(serverMessage),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                Color(0xFFFFC107),
                              ),
                            ),
                          );
                  }
                },
              ),
            ),
          ),

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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjectsListScreen(),
                                ),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2,
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
                                width: MediaQuery.of(context).size.width / 2,
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
          ),

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
      )),
    );
  }
}
