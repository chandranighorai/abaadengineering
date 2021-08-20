import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/styles/my_icons.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class SummaryList extends StatefulWidget {
  const SummaryList({Key key}) : super(key: key);

  @override
  _SummaryListState createState() => _SummaryListState();
}

class _SummaryListState extends State<SummaryList> {
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
          )),
          Stack(
            children: [
              Row(
                children: <Widget>[
                  Flexible(
                    child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectsListScreen(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(iconHome,
                            matchTextDirection: false)),
                    flex: 1,
                  ),
                  Flexible(
                    child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountActivity(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(iconAccount,
                            matchTextDirection: false)),
                    flex: 1,
                  ),
                ],
              ),
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
            ],
          ),
        ],
      )),
    );
  }
}
