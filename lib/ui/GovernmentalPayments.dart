import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'RadialPainter.dart';

class GovernmentalPayments extends StatefulWidget {
  @override
  _GovernmentalPaymentsState createState() => _GovernmentalPaymentsState();
}

class _GovernmentalPaymentsState extends State<GovernmentalPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 114.0,
            //  color: Colors.grey,
            child: ListView.builder(
              // padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Row(children: [
                  // Expanded(
                  //   flex:2,
                  //   child: Container(
                  //       margin: EdgeInsets.all(20.0),
                  //       child:
                  //       Text(options[index],
                  //         style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),))
                  //   ),

                  Expanded(
                    flex: 1,
                    child: ExpansionTile(
                      title: Text(options[index]),
                      children: <Widget>[
                        Container(
                          // padding:
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text("Electrical Work",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                    Expanded(
                                      child: Text("Electrical Work",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text("Electrical Work",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                    Expanded(
                                      child: Text("Electrical Work",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: 20.0, bottom: 30.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text("Electrical Work",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                    Expanded(
                                      child: Text("Electrical Work",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                              ),

                              // Container(
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         flex:1,
                              //         child: Text("Electrical\nWork", style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
                              //       ),
                              //
                              //       Expanded(
                              //         flex:1,
                              //         child: Text("Electrical\nWork", style: TextStyle(fontSize: 12.0),textAlign: TextAlign.center),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         flex:1,
                              //         child: Text("Electrical\nWork", style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
                              //       ),
                              //
                              //       Expanded(
                              //         flex:1,
                              //         child: Text("Electrical\nWork", style: TextStyle(fontSize: 12.0),textAlign: TextAlign.center),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         flex:1,
                              //         child: Text("Electrical\nWork", style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
                              //       ),
                              //
                              //       Expanded(
                              //         flex:1,
                              //         child: Text("Electrical\nWork", style: TextStyle(fontSize: 12.0),textAlign: TextAlign.center),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        )

                        // Column(
                        //   children: [
                        //
                        //     Row(
                        //       children: [
                        //         Icon(Icons.radio_button_checked),
                        //         Container(
                        //           width: 50.0,
                        //           height: 1.0,
                        //           // margin: EdgeInsets.only(right: 360.0),
                        //           color: Colors.black,
                        //
                        //         )
                        //       ],
                        //     ),
                        //     Text("Electrical Work"),
                        //   ],
                        // )
                        // ),
                      ],
                    ),
                  )
                ]));
              },
            ))
      ])),
    );
  }

  List<String> options = ["Living Room", "Bedroom", "Kitchen", "Bath"];
  List<double> completed = [0.5, 0.65, 0.7, 0.85];
}
