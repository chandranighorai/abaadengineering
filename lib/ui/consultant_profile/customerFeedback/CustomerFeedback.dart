import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/ui/consultant_profile/customerFeedback/FeedBackModelList.dart';
import 'package:abaadengineering/ui/consultant_profile/customerFeedback/FeedbackModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_widgets/gradient_widgets.dart';

class CustomerFeedback extends StatefulWidget {
  const CustomerFeedback({Key key}) : super(key: key);

  @override
  _CustomerFeedbackState createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {
  Future<FeedbackModel> _feedbackModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _feedbackModel = _getFeedbackList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                      //margin: EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF700A81), Color(0xFFE91EA5)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft),
                      ),
                      child: Row(children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Customer \nFeedback',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          // color: Colors.blueAccent,
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 120.0, 15.0),
                          // color: Colors.white,
                          // onPressed: _nextActivity,
                        ),
                      ])),
                  SizedBox(width: 15.0),

                  Container(
                    //margin: EdgeInsets.only(top: 40.0),
                    child: SvgPicture.asset(
                      iconLogo,
                      matchTextDirection: false,
                      height: 70.0,
                      width: 68.0,
                    ),
                  )

                  //  SizedBox(height: 60.0,),
                ],
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 114.0,
                  child: FutureBuilder(
                      initialData: null,
                      future: _feedbackModel,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var feedBack = snapshot.data.testimonialList;
                          return feedBack.length == 0
                              ? Center(
                                  child: Text("No Feedback Yet"),
                                )
                              : ListView.builder(
                                  itemCount: feedBack.length,
                                  itemBuilder: (BuildContext context, index) {
                                    TestimonialList list = feedBack[index];
                                    return FeedBackModelList(
                                        testimonialList: list);
                                  });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ),
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
          ),
        ),
      ),
    );
  }

  Future<FeedbackModel> _getFeedbackList() async {
    try {
      var response = await http.get(Uri.parse(Consts.FEEDBACK_LIST));
      var responseData = jsonDecode(response.body);
      return FeedbackModel.fromJson(responseData);
    } on Exception catch (e) {
      print(e.toString());
      print("Network Error");
    }
  }
}
