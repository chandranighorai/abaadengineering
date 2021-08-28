import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/styles/my_icons.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/ui/payment_collections/PaymentsAndCollections.dart';
import 'package:abaadengineering/ui/payment_collections/SummeryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
//import 'package:date_format/date_format.dart';

class PaymentMonthList extends StatefulWidget {
  final Projects project;
  const PaymentMonthList({Key key, this.project}) : super(key: key);

  @override
  _PaymentMonthListState createState() => _PaymentMonthListState();
}

class _PaymentMonthListState extends State<PaymentMonthList> {
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
    var formatter = new DateFormat('yyyy');
    String formattedDate = formatter.format(now);
    print("Now..." + formattedDate.toString());
    if (formattedDate != null) {
      int currentYear = int.parse(formattedDate);
      setState(() {
        selectedYear = "$currentYear";
      });
      mList.add("$currentYear");
      for (var i = 1; i < 15; i++) {
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
                          'Payments \nand Collections',
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
            //flex: 1,
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 8.00, right: 8.00),
              itemCount: 12,
              //shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.2,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
                    showReport(context,arrMonths[index]["name"],arrMonths[index]["monthNumber"], index);
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
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            arrMonths[index]["name"],
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
          // Expanded(
          //     child: Column(
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         print("Button click..");
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => SummaryList()));
          //       },
          //       child: Container(
          //           alignment: Alignment.center,
          //           margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          //           width: MediaQuery.of(context).size.width,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //             gradient: LinearGradient(
          //                 colors: [Color(arrColor[3]), Color(arrColor[11])],
          //                 begin: Alignment.centerRight,
          //                 end: Alignment.centerLeft),
          //           ),
          //           //height: 85,
          //           padding: EdgeInsets.all(
          //               MediaQuery.of(context).size.width * 0.04),
          //           child: Text(
          //             "Summary",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: MediaQuery.of(context).size.width * 0.04,
          //                 fontWeight: FontWeight.bold),
          //           )),
          //     ),
          //   ],
          // )),
          //Text("Summary"),
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
    {"name": "January", "monthNumber": "01"},
    {"name": "February", "monthNumber": "02"},
    {"name": "March", "monthNumber": "03"},
    {"name": "April", "monthNumber": "04"},
    {"name": "May", "monthNumber": "05"},
    {"name": "June", "monthNumber": "06"},
    {"name": "July", "monthNumber": "07"},
    {"name": "August", "monthNumber": "08"},
    {"name": "September", "monthNumber": "09"},
    {"name": "October", "monthNumber": "10"},
    {"name": "November", "monthNumber": "11"},
    {"name": "December", "monthNumber": "12"},
  ];

  void showReport(BuildContext context,String arrMonthName, String arrMonth, int index) {
    // var now = DateTime.now();
    // print("month..." + now.toString());
    // final formatted = formatDate(now, [mm]);
    //int current_mon = now.month;
    print("month..." + arrMonth.toString());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentsAndCollections(
          project: widget.project,
          monthName: arrMonthName,
          monthNumber: arrMonth,
          year: selectedYear,
        ),
      ),
    );
  }
}
