import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/ui/monthlyreports/MonthlyReportScreen.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MonthsListActivity extends StatefulWidget {
  final Projects project;

  const MonthsListActivity({Key key, this.project}) : super(key: key);
  @override
  _MonthsListActivityState createState() => _MonthsListActivityState();
}

class _MonthsListActivityState extends State<MonthsListActivity> {
  List<String> yearsList;
  var selectedYear;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yearsList = _getYears();
  }

  List<String> _getYears() {
    List<String> mList = [];
    var now = new DateTime.now();
    //print("Now..." + now.toString());
    var formatter = new DateFormat('yyyy');
    String formattedDate = formatter.format(now);
    print("Now..." + formattedDate.toString());
    if (formattedDate != null) {
      int currentYear = int.parse(formattedDate);
      setState(() {
        selectedYear = "$currentYear";
      });
      mList.add("$currentYear");
      for (var i = 1; i < 10; i++) {
        var year = currentYear - i;
        mList.add("$year");
        print("Year...$year");
      }
      return mList;
    }
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
                        colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Monthly\nReport',
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
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              bottom: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      "View By Month",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: 150.0,
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                    value: selectedYear,
                    items: yearsList.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 7.0,
                ),
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.2,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 2.0,
                  ),
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        showReport(arrMonths[index], index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 8.0,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          color: Color(arrColor[index]),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                arrMonths[index],
                                style: TextStyle(
                                  color: Color(0XFF5A626F),
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
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

  var arrColor = [
    0xFFC6EAFA,
    0xFFC7D5EF,
    0xFFC7C4E1,
    0xFFC7D5EF,
    0xFFC7C4E1,
    0xFFC8B2D6,
    0xFFC7C4E1,
    0xFFC8B2D6,
    0xFFC6A0C9,
    0xFFC8B2D6,
    0xFFC6A0C9,
    0xFFC78FC0,
  ];
  var arrMonths = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  void showReport(String monthName, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MonthlyReportScreen(
          project: widget.project,
          monthName: monthName,
          year: selectedYear,
        ),
      ),
    );
  }
}
