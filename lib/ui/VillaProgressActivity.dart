import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'RadialPainter.dart';

class VillaProgressActivity extends StatefulWidget {
  @override
  _VillaProgressState createState() => _VillaProgressState();
}

class _VillaProgressState extends State<VillaProgressActivity> {
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
                var expanded = Expanded;
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
                    child: ExpansionTile(
                      title: Text(options[index]),
                      initiallyExpanded: true,
                      children: <Widget>[
                        // Expanded(
                        //     flex: 2,
                        //child:
                        Container(
                          width: 100.0,
                          height: 100.0,
                          margin: EdgeInsets.all(20.0),
                          child: CircularPercentIndicator(
                            radius: 70.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: completed[index],
                            center: new Text(
                              (completed[index] * 100).toString() + "%",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                            // footer: new Text(
                            //   "Sales this week",
                            //   style:
                            //   new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                            // ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.purple,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Icon(Icons.radio_button_checked),
                              Container(
                                width: 50.0,
                                height: 1.0,
                                // margin: EdgeInsets.only(right: 360.0),
                                color: Colors.black,
                              ),
                              Icon(Icons.radio_button_checked),
                              Container(
                                width: 50.0,
                                height: 1.0,
                                // margin: EdgeInsets.only(right: 360.0),
                                color: Colors.black,
                              ),
                              Icon(Icons.radio_button_checked),
                              Container(
                                width: 50.0,
                                height: 1.0,

                                // margin: EdgeInsets.only(right: 360.0),
                                color: Colors.black,
                              ),
                              Icon(Icons.radio_button_off),
                              Container(
                                width: 50.0,
                                height: 1.0,
                                // margin: EdgeInsets.only(right: 360.0),
                                color: Colors.black,
                              ),
                              Icon(Icons.radio_button_checked),
                            ],
                          ),
                        ),

                        Container(
                          // padding:
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Electrical\nWork",
                                  style: TextStyle(fontSize: 12.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text("Electrical\nWork",
                                    style: TextStyle(fontSize: 12.0),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text("Electrical\nWork",
                                    style: TextStyle(fontSize: 12.0),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text("Electrical\nWork",
                                    style: TextStyle(fontSize: 12.0),
                                    textAlign: TextAlign.center),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text("Electrical\nWork",
                                    style: TextStyle(fontSize: 12.0),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        )
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
