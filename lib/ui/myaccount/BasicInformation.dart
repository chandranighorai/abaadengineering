import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicInformation extends StatefulWidget {
  final option;
  final fname;
  final lname;
  // final name;
  final email;
  const BasicInformation(
      {this.option, this.fname, this.lname, this.email, Key key})
      : super(key: key);

  @override
  _BasicInformationState createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  @override
  Widget build(BuildContext context) {
    //print("Strinf...." + widget.option.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("lName..." + widget.lname.toString());
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
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    //padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.04,
                        bottom: MediaQuery.of(context).size.width * 0.04),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFFC107), Color(0xFF03A9F4)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.02))),
                    child: Text(widget.fname.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.042))),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Container(
                    //padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.04,
                        bottom: MediaQuery.of(context).size.width * 0.04),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFFC107), Color(0xFF03A9F4)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.02))),
                    child: Text(widget.lname.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.042))),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Container(
                    //padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.04,
                        bottom: MediaQuery.of(context).size.width * 0.04),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFFC107), Color(0xFF03A9F4)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.02))),
                    child: Text(widget.email.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                        ))),
              ],
            ),
          )),
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
        ],
      )),
    );
  }
}
