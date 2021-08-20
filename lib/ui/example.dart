import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/consultant_profile/ConsultantProfile.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/contactus/ContactUsActivity.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/payment_collections/PaymentsAndCollections.dart';
//import 'package:abaadengineering/ui/VillaLocation.dart';
import 'package:abaadengineering/ui/VillaProgressActivity.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/accounts/loginPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:abaadengineering/styles/my_icons.dart';

class MainActivity extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 50.0, top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 50.0, top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Welcome",
                            style: TextStyle(fontSize: 12.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Abdulrahman Aljarah",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        iconLogo,
                        matchTextDirection: false,
                        height: 60.0,
                        width: 60.0,
                      )
                    ],
                  ),
                ),
                Container(
                    child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
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
                              builder: (context) => VillaProgressActivity()),
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
                              builder: (context) => VillaProgressActivity()),
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
                              builder: (context) => VillaProgressActivity()),
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
                              builder: (context) => VillaProgressActivity()),
                        );
                      },
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(iconVillalocation,
                          matchTextDirection: false,
                          height: 150.0,
                          width: 150.0),

                      // onTap: (){
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => VillaLocation()),
                      //   );
                      //
                      // },
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
                              builder: (context) => PaymentsAndCollections()),
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
                              builder: (context) => ContactUsActivity()),
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
                              builder: (context) => ConsultantProfile()),
                        );
                      },
                    ),

                    //Image.network("https://placeimg.com/500/500/any"),
                  ],
                )
                    // child:  GridView.builder(
                    //     itemCount: images.length,
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 2,
                    //       crossAxisSpacing: 4.0,
                    //         mainAxisSpacing: 8.0,
                    //     ),
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Image.asset(images[index]);
                    //     },
                    //   ),

                    )
              ],
            ),
          )
        ])));
  }

  List<String> images = [
    "assets/flowers.jpg",
    "assets/nature.jpg",
    "assets/parrot.jpg",
    "assets/road.jpg",
    "assets/flowers.jpg",
    "assets/nature.jpg",
    "assets/parrot.jpg",
    "assets/road.jpg",
  ];
}
