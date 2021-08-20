import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/PaymentModel.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/payment_collections/item_payment.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/styles/my_icons.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentCollectionList extends StatefulWidget {
  final Projects project;
  final String paymentType;
  final String pageTitle;
  final String projectMonth;
  final String projectYear;

  const PaymentCollectionList(
      {Key key,
      this.project,
      this.paymentType,
      this.pageTitle,
      this.projectMonth,
      this.projectYear})
      : super(key: key);
  @override
  _PaymentCollectionListState createState() => _PaymentCollectionListState();
}

class _PaymentCollectionListState extends State<PaymentCollectionList> {
  bool hasPayment = true;
  String serverMessage = "";
  String _projectId;
  String _paymentCategory;
  Future<PaymentModel> mListPayments;
  Future<PaymentModel> _getPayments() async {
    var projectRequestParam =
        "project_id=" + _projectId + "&payment_cat=" + _paymentCategory;
    var PROJECT_URL = Consts.CUST_PAYMENTS + "?" + projectRequestParam;
    final response = await http.get(Uri.parse(PROJECT_URL));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      var responseData = jsonDecode(response.body);
      print("paymentBody..." + responseData.toString());
      var serverStatus = responseData['status'];
      if (serverStatus == "success") {
        return PaymentModel.fromJson(responseData);
      } else {
        setState(() {
          hasPayment = false;
          serverMessage = responseData['message'];
        });
        showCustomToast("" + responseData['message']);
      }
    } else {
      setState(() {
        hasPayment = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _projectId = widget.project.propertyID;
    _paymentCategory = widget.paymentType;

    mListPayments = _getPayments();
  }

  @override
  Widget build(BuildContext context) {
    String _paymentType = widget.paymentType;
    String _pageTitle = widget.pageTitle;
    print("project month..." + widget.projectMonth.toString());
    print("project month..." + widget.projectYear.toString());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: <Widget>[
              // SizedBox(height: 140.0),
              Container(
                height: 75.0,
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
                        _pageTitle,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      // color: Colors.blueAccent,
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 110.0, 15.0),

                      // color: Colors.white,
                      // onPressed: _nextActivity,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
                height: 30.0,
              ),
              SvgPicture.asset(iconLogo,
                  matchTextDirection: false, height: 70.0, width: 68.0),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                initialData: null,
                future: mListPayments,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var listPayment = snapshot.data.paymentLists;
                    return listPayment.length == 0
                        ? Container(
                            color: Colors.white,
                            child: Text("No projects added yet"),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: listPayment.length,
                            itemBuilder: (context, int index) {
                              PaymentLists paymentLists = listPayment[index];
                              print("PaymentList..." + paymentLists.toString());
                              return ItemPayment(
                                paymentList: paymentLists,
                              );
                            });
                  } else {
                    return !hasPayment
                        ? Container(
                            child: Center(
                              child: Text(serverMessage),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                Color(0xFFFFC107),
                              ),
                            ),
                          );
                  }
                }),
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
}
