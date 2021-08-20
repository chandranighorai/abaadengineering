import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/AdminDocumentsModel.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/ui/admin_documents/item_admin_documents.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/consultant_profile/ConsultantProfile.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/contactus/ContactUsActivity.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/payment_collections/PaymentsAndCollections.dart';
// import 'package:abaadengineering/ui/ProfileView.dart';
// import 'package:abaadengineering/ui/UploadDownload.dart';
// import 'package:abaadengineering/ui/VillaLocation.dart';
import 'package:abaadengineering/ui/VillaProgressActivity.dart';
import 'file:///E:/Azharuddin/flutter-projects/abaadengineering/lib/ui/accounts/loginPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'UploadDownload.dart';
import '../mainActivity.dart';

class DownloadActivity extends StatefulWidget {
  final Projects project;

  const DownloadActivity({Key key, this.project}) : super(key: key);
  @override
  _DownloadActivityState createState() => _DownloadActivityState();
}

class _DownloadActivityState extends State<DownloadActivity> {
  bool hasDesigns = true;
  String serverMessage = "";
  String _projectId;
  Future<AdminDocumentsModel> mListDocuments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _projectId = widget.project.propertyID;

    mListDocuments = _getDocuments();
  }

  Future<AdminDocumentsModel> _getDocuments() async {
    var projectRequestParam = "project_id=" + _projectId;
    var PROJECT_URL = Consts.VIEW_ADMIN_DESIGNS + "?" + projectRequestParam;
    final response = await http.get(Uri.parse('' + PROJECT_URL));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      var responseData = jsonDecode(response.body);
      var serverStatus = responseData['status'];
      if (serverStatus == "success") {
        return AdminDocumentsModel.fromJson(responseData);
      } else {
        setState(() {
          hasDesigns = false;
          serverMessage = responseData['message'];
        });
        showCustomToast("" + responseData['message']);
      }
    } else {
      setState(() {
        hasDesigns = false;
      });
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
                          'Download\nDocuments',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
              ),
              child: FutureBuilder(
                initialData: null,
                future: mListDocuments,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var listDesigns = snapshot.data.adminDocumentsList;
                    return listDesigns.length == 0
                        ? Container(
                            color: Colors.white,
                            child: Text("No projects added yet"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                itemCount: listDesigns.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: width / height,
                                ),
                                itemBuilder: (context, int index) {
                                  AdminDocumentsList adminDocuments =
                                      listDesigns[index];
                                  return ItemAdminDocuments(
                                    adminDocumentsList: adminDocuments,
                                  );
                                  // return ItemApproveDrawings(
                                  //   approvedDrawingsList: appRovedDesign,
                                  // );
                                }),
                          );
                  } else {
                    return !hasDesigns
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
                },
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
}
