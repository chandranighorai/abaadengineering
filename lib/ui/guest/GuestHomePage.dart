import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/ui/consultant_profile/ConsultantProfile.dart';
import 'package:abaadengineering/ui/contactus/ContactUsActivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class GuestHomePage extends StatefulWidget {
  const GuestHomePage({Key key}) : super(key: key);

  @override
  _GuestHomePageState createState() => _GuestHomePageState();
}

class _GuestHomePageState extends State<GuestHomePage> {
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.only(right: 75.0, top: 15.0, left: 10),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.04),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome",
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.start,
                        ),
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(left: 0.0, top: 8.0),
                      //   child: Text(
                      //     "${_name}",
                      //     style: TextStyle(fontSize: 16.0),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // ),
                      // SizedBox(height: 10.0,),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10.0, left: 110.0),
                      child: SvgPicture.asset(
                        iconLogo,
                        matchTextDirection: false,
                        height: 60.0,
                        width: 60.0,
                      )),
                ],
              ),
            ),
            Expanded(
                child: GridView.count(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04),
              crossAxisCount: 2,
              crossAxisSpacing: 40.0,
              mainAxisSpacing: 6.0,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              shrinkWrap: true,
              children: <Widget>[
                GestureDetector(
                  child: SvgPicture.asset(
                    iconContact_us,
                    matchTextDirection: false,
                    height: 150.0,
                    width: 150.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ContactUsActivity(userType: "Guest"),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    iconConsultant_profile,
                    matchTextDirection: false,
                    height: 150.0,
                    width: 150.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConsultantProfile(),
                      ),
                    );
                  },
                )
              ],
            )),
            Stack(children: [
              Center(
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
            ]),
          ],
        ),
      )),
    );
  }
}
