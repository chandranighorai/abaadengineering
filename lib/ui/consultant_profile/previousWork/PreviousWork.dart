import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/ui/consultant_profile/previousWork/PreviousWorkList.dart';
import 'package:abaadengineering/ui/consultant_profile/previousWork/PreviousWorkModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;

class PreviousWork extends StatefulWidget {
  @override
  _PreviousWorkState createState() => _PreviousWorkState();
}

class _PreviousWorkState extends State<PreviousWork> {
  Future<PreviousWorkModel> _previousWork;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _previousWork = _getPreviousWork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    //margin: EdgeInsets.only(top: 30.0),
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
                          'Previous Work \nDone',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),

                        // color: Colors.blueAccent,
                        padding: EdgeInsets.fromLTRB(15.0, 15.0, 120.0, 15.0),

                        // color: Colors.white,
                        // onPressed: _nextActivity,
                      ),
                    ])),
                SizedBox(width: 15.0),

                Container(
                  //margin: EdgeInsets.only(top: 40.0),
                  child: SvgPicture.asset(
                    iconLogo,
                    matchTextDirection: false,
                    height: 70.0,
                    width: 68.0,
                  ),
                )

                //  SizedBox(height: 60.0,),
              ],
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height - 114.0,
                  //  color: Colors.grey,
                  child: FutureBuilder(
                    initialData: null,
                    future: _previousWork,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var workList = snapshot.data.previousWorkList;
                        return workList.length == 0
                            ? Center(
                                child: Text("No Data"),
                              )
                            : ListView.builder(
                                // padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                padding: EdgeInsets.all(0),
                                itemCount: workList.length,
                                itemBuilder: (context, index) {
                                  PreviousWorkList previousWorkList =
                                      workList[index];
                                  return PreviousWorkModelList(
                                      workList: previousWorkList);
                                },
                              );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
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
          ]),
        ),
      ),
    );
  }

  final options = [
    "images/img_1.jpg",
    "images/img_1.jpg",
    "images/img_2.jpg",
    "images/img_3.jpg",
    "images/img_4.jpg",
    "images/img_5.jpg",
    "images/img_6.jpg",
    "images/img_7.jpg",
    "images/img_8.jpg",
    "images/img_9.jpg",
    "images/img_10.jpg",
    "images/img_11.jpg",
    "images/img_12.jpg",
    "images/img_13.jpg",
    "images/img_14.jpg",
    "images/img_15.jpg",
    "images/img_16.jpg",
    "images/img_17.jpg",
    "images/img_18.jpg",
    "images/img_19.jpg",
    "images/img_20.jpg",
    "images/img_21.jpg",
    "images/img_22.jpg",
    "images/img_23.jpg",
    "images/img_24.jpg",
    "images/img_25.jpg",
    "images/img_26.jpg",
    "images/img_27.jpg",
    "images/img_28.jpg",
    "images/img_29.jpg",
    "images/img_30.jpg",
    "images/img_31.jpg",
    "images/img_32.jpg",
    "images/img_33.jpg",
    "images/img_34.jpg",
    "images/img_35.jpg",
    "images/img_36.jpg",
    "images/img_37.jpg",
    "images/img_38.jpg",
    "images/img_39.jpg",
    "images/img_40.jpg",
    "images/img_41.jpg",
    "images/img_42.jpg",
    "images/img_43.jpg",
    "images/img_44.jpg",
  ];

  Future<PreviousWorkModel> _getPreviousWork() async {
    try {
      var response = await http.get(Uri.parse(Consts.VIEW_PREVIOUS_WORK));
      var responseData = jsonDecode(response.body);
      return PreviousWorkModel.fromJson(responseData);
    } on Exception catch (e) {
      print(e.toString());
      print("Network error");
    }
  }
}
