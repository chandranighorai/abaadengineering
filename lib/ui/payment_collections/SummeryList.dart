import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/styles/my_icons.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/ui/payment_collections/ItemSummerlyReport.dart';
import 'package:abaadengineering/ui/payment_collections/SummeryModel.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;

class SummaryList extends StatefulWidget {
  final Projects project;
  final String projectYear;
  final String projectMonth;
  const SummaryList(
      {this.project, this.projectYear, this.projectMonth, Key key})
      : super(key: key);
  //SummaryList(this.project, this.projectYear, this.projectMonth);
  @override
  _SummaryListState createState() => _SummaryListState();
}

class _SummaryListState extends State<SummaryList> {
  Future<List<SummeryList>> summeryList;
  List<SummeryList> summerListReport;
  bool loadReport = false;
  String serverMessage = "";
  @override
  void initState() {
    // TODO: implement initState
    summeryList = getSummeryList();
    summerListReport = [];
    super.initState();
  }

  Future<List<SummeryList>> getSummeryList() async {
    List<SummeryList> summeryReport = [];
    var requestParam = "project_id=" +
        widget.project.propertyID +
        "&year=" +
        widget.projectYear +
        "&month=" +
        widget.projectMonth;
    var PROJECT_URL = Consts.VIEW_SUMMERY_LIST + "?" + requestParam;
    final response = await http.get(Uri.parse(PROJECT_URL));
    var responseBody = jsonDecode(response.body);
    var serverStatus = responseBody["status"];
    serverMessage = responseBody["message"];
    var summeryList = responseBody["summery_list"];
    print("response bode..." + responseBody.toString());
    if (responseBody["status"] == "success") {
      //SummeryModel.fromJson(responseBody);
      for (int i = 0; i < summeryList.length; i++) {
        var itemData = summeryList[i];
        SummeryList sumList = new SummeryList();
        sumList.id = itemData["id"];
        sumList.projectId = itemData["project_id"];
        sumList.reportName = itemData["report_name"];
        sumList.year = itemData["year"];
        sumList.month = itemData["month"];
        sumList.files = itemData["files"];
        sumList.status = itemData["status"];
        sumList.addDate = itemData["add_date"];
        sumList.projectName = itemData["project_name"];
        sumList.reportFiles = itemData["report_files"];
        summeryReport.add(sumList);
        setState(() {
          loadReport = true;
        });
      }
    } else {
      showCustomToast(responseBody["message"].toString());
    }
    return summeryReport;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                          'Summary List',
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
              future: summeryList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && loadReport) {
                  summerListReport = snapshot.data;
                  print("length..." + summerListReport.length.toString());
                  return summerListReport.length == 0
                      ? Container(
                          color: Colors.white,
                          child: Text("No projects added yet"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              itemCount: summerListReport.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: width / height,
                              ),
                              itemBuilder: (context, int index) {
                                return ItemSummerlyReport(
                                  itemMonthlyReport: summerListReport[index],
                                );
                              }),
                        );
                } else {
                  return !loadReport
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
          )),
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
      )),
    );
  }
}
