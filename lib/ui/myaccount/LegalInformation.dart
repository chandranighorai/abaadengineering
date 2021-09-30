import 'dart:convert';
import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

class LegalInformation extends StatefulWidget {
  final String option;
  LegalInformation({Key key, this.option}) : super(key: key);

  @override
  _LegalInformationState createState() => _LegalInformationState();
}

class _LegalInformationState extends State<LegalInformation> {
  var responseData;
  bool _dataLoad;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLegalInformation();
    _dataLoad = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
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
                          colors: [Color(0xFF700A81), Color(0xFFE91EA5)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            widget.option.toString(),
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
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
                child: _dataLoad == false
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.05),
                        child: SingleChildScrollView(
                          child: Html(
                              data: responseData["legal_information"]
                                  ["content"]),
                        ),
                      ))
          ],
        ),
      )),
    );
  }

  _getLegalInformation() async {
    try {
      var response = await http.get(Uri.parse(Consts.LEGAL_INFORMATION));
      print("Response body..." + response.body);
      responseData = jsonDecode(response.body);
      setState(() {
        _dataLoad = true;
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
