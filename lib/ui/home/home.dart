import 'dart:io';

import 'package:abaadengineering/ui/accounts/loginPage.dart';
import 'package:abaadengineering/ui/guest/GuestHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaffoldExample extends StatelessWidget {
  _tappedButton() {
    debugPrint("Tapped Button!");
  }

  // _nextActivity(BuildContext context) {
  //   //LoginPage;
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => GuestHomePage()));
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Flutter AppBar"),
        //   centerTitle: true,
        //   backgroundColor: Colors.lightBlueAccent,
        //   actions: <Widget>[
        //     IconButton(icon: Icon(Icons.email), onPressed: () => debugPrint("Email Tapped")),
        //     IconButton(icon: Icon(Icons.access_alarm), onPressed: _tappedButton )
        //   ],
        // ),

        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   child: SvgPicture.asset("images/icon.svg",matchTextDirection: false,),
                // ),
                Image.asset('images/Icon Set_page_30.png',
                    height: 200, width: 200),
                SizedBox(height: 50.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Customer",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(100.0, 3.0, 100.0, 3.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft),
                  ),
                  child: FlatButton(
                    child: Text(
                      'Guest',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    // color: Colors.blueAccent,
                    padding: EdgeInsets.fromLTRB(117.0, 3.0, 117.0, 3.0),

                    textColor: Colors.white,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GuestHomePage())),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Center(
          child: Text(
        "Hello flutter!",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 50,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      )),
    );
    // return Center(
    //   child: Text("Hello Flutter!", textDirection: TextDirection.ltr),
    // );
  }
}
