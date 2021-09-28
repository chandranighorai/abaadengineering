import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/ui/consultant_profile/someOfOurDesign/DesignModel.dart';
import 'package:abaadengineering/ui/consultant_profile/someOfOurDesign/SomeDesignList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class SomeOfDesign extends StatefulWidget {
  const SomeOfDesign({Key key}) : super(key: key);

  @override
  _SomeOfDesignState createState() => _SomeOfDesignState();
}

class _SomeOfDesignState extends State<SomeOfDesign> {
  Future<DesignModel> _designList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _designList = _getDesignList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30.0),
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
                          'Some Of Our \nDesign',
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
                  margin: EdgeInsets.only(top: 40.0),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 114.0,
              //color: Colors.red,
              //padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              // decoration: BoxDecoration(
              //     ),
              child: FutureBuilder(
                  initialData: null,
                  future: _designList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var imageList = snapshot.data.viewDesignList;
                      return imageList.length == 0
                          ? Center(
                              child: Text("No Data"),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: imageList.length,
                              itemBuilder: (BuildContext context, index) {
                                ViewDesignList viewDesign = imageList[index];
                                return SomeDesignList(viewDesign: viewDesign);
                              });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<DesignModel> _getDesignList() async {
    try {
      var response = await http.get(Uri.parse(Consts.SOME_OF_OUR_DESIGN));
      print("Response..." + response.body.toString());
      var responseData = jsonDecode(response.body);
      return DesignModel.fromJson(responseData);
    } on Exception catch (e) {
      print(e.toString());
      print("Network Error");
    }
  }
}
