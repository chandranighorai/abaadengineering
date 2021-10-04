import 'package:abaadengineering/models/projects_model.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/payment_collections/PaymentCollection.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/Collections.dart';
import 'package:abaadengineering/ui/GovernmentalPayments.dart';
import 'package:abaadengineering/ui/OfficePayments.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/ui/payment_collections/SummeryList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class PaymentsAndCollections extends StatefulWidget {
  final Projects project;
  var monthName;
  var monthNumber;
  var year;

  PaymentsAndCollections(
      {Key key, this.project, this.monthName, this.monthNumber, this.year})
      : super(key: key);
  @override
  _PaymentsAndCollectionsState createState() => _PaymentsAndCollectionsState();
}

class _PaymentsAndCollectionsState extends State<PaymentsAndCollections> {
  var projectMonth, projectYear, projectMonthNumber;
  @override
  Widget build(BuildContext context) {
    Projects _porject = widget.project;
    projectMonthNumber = widget.monthNumber;
    projectMonth = widget.monthName.toString();
    projectYear = widget.year.toString();

    //print("monthName..." + widget.monthName.toString());
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // SizedBox(height: 140.0),
                  Container(
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
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Payments \nand Collections of\n' +
                                widget.monthName.toString() +
                                " " +
                                widget.year.toString(),
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          // color: Colors.blueAccent,
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 110.0, 15.0),

                          // color: Colors.white,
                          // onPressed: _nextActivity,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 15.0,
                  //   height: 30.0,
                  // ),
                  SvgPicture.asset(iconLogo,
                      matchTextDirection: false, height: 70.0, width: 68.0),
                  SizedBox(
                    height: 60.0,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentCollectionList(
                                    project: _porject,
                                    paymentType: 'Government Payments',
                                    pageTitle: 'Government \nPayments',
                                    projectMonth: widget.monthNumber,
                                    projectYear: widget.year),
                              ),
                            );
                          },
                          child: Text(
                            'Government Payments',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          // color: Colors.blueAccent,

                          // color: Colors.white,
                          // onPressed: _nextActivity,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentCollectionList(
                                    project: _porject,
                                    paymentType: 'Office Payments',
                                    pageTitle: 'Office \nPayments',
                                    projectMonth: widget.monthNumber,
                                    projectYear: widget.year),
                              ),
                            );
                          },
                          child: Text(
                            'Office Payments',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          // color: Colors.blueAccent,

                          // color: Colors.white,
                          // onPressed: _nextActivity,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentCollectionList(
                                    project: _porject,
                                    paymentType: 'Collections',
                                    pageTitle: 'Collections',
                                    projectMonth: widget.monthNumber,
                                    projectYear: widget.year),
                              ),
                            );
                          },
                          child: Text(
                            'Collections',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          // color: Colors.blueAccent,

                          // color: Colors.white,2
                          // onPressed: _nextActivity,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF2196F3), Color(0xFF38068f)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryList(
                                    project: _porject,
                                    projectYear: widget.year,
                                    projectMonth: widget.monthName),
                              ),
                            );
                          },
                          child: Text(
                            'Summary',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          // color: Colors.blueAccent,

                          // color: Colors.white,2
                          // onPressed: _nextActivity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.25,
                //color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.04,
                        bottom: MediaQuery.of(context).size.height * 0.00,
                        left: MediaQuery.of(context).size.width * 0.00,
                        right: MediaQuery.of(context).size.width * 0.00,
                        child: Container(
                          //height: MediaQuery.of(context).size.width * 0.16,
                          //color: Colors.red,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProjectsListScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: SvgPicture.asset(
                                      iconHome,
                                      matchTextDirection: false,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AccountActivity(),
                                    ),
                                  );
                                },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: SvgPicture.asset(
                                      iconAccount,
                                      matchTextDirection: false,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              //)
                            ],
                          ),
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.05,
                      left: MediaQuery.of(context).size.width * 0.00,
                      right: MediaQuery.of(context).size.width * 0.00,
                      //child: //       Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        //color: Colors.amber,
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
                    // )
                  ],
                ),
              )
              // Stack(
              //   children: [
              //     Row(
              //       children: <Widget>[
              //         Flexible(
              //           child: new GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => ProjectsListScreen(),
              //                   ),
              //                 );
              //               },
              //               child: SvgPicture.asset(iconHome,
              //                   matchTextDirection: false)),
              //           flex: 1,
              //         ),
              //         Flexible(
              //           child: new GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => AccountActivity(),
              //                   ),
              //                 );
              //               },
              //               child: SvgPicture.asset(iconAccount,
              //                   matchTextDirection: false)),
              //           flex: 1,
              //         ),
              //       ],
              //     ),
              //     Center(
              //       child: Container(
              //         width: 50,
              //         height: 50,
              //         child: CircularGradientButton(
              //           child: Icon(
              //             Icons.chevron_left,
              //             color: Colors.white,
              //           ),
              //           callback: () {
              //             Navigator.pop(context);
              //           },
              //           gradient: LinearGradient(
              //               colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
              //               begin: Alignment.centerRight,
              //               end: Alignment.centerLeft),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
