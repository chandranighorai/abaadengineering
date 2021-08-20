import 'dart:convert';
import 'dart:io';

// import 'package:image_picker/image_picker.dart';
import 'package:abaadengineering/consts/app_colors.dart';
import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/project_seletion/projectslist.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:abaadengineering/util/CustomProgressDialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadActivity extends StatefulWidget {
  final userID;
  final Projects project;

  const UploadActivity({Key key, this.userID, this.project}) : super(key: key);
  @override
  _UploadActivityState createState() => _UploadActivityState();
}

class _UploadActivityState extends State<UploadActivity> {
  String userID = "";
  Projects selectedProject;
  bool _isUploading = false;
  final ImagePicker _picker = ImagePicker();
  // Future<File> imageFile;
  File _mImageFile;
  String _encodedImage;
  String _mimeType;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedProject = widget.project;
    userID = widget.userID;
  }

  _openGallery() async {
    // List<int> imageBytes;
    // final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    // setState(() {
    //   if (pickedFile != null) {
    //     final mimeType = lookupMimeType(pickedFile.path);
    //     print('mimeType : ' + mimeType);
    //     _mImageFile = File(pickedFile.path);
    //     imageBytes = _mImageFile.readAsBytesSync();
    //     _encodedImage = base64Encode(imageBytes);
    //   } else {
    //     print('No image selected.');
    //   }
    // });

    // FilePickerResult result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['jpg', 'pdf', 'doc', 'docx'],
    // );
    // if (result != null) {
    //   setState(() {
    //     _mImageFile = File(result.files.single.path);
    //     _mimeType = lookupMimeType(_mImageFile.path);
    //     print('mimeType : ' + _mimeType);
    //   });
    // } else {
    //   // User canceled the picker
    // }

    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      //  PlatformFile file = result.files.first;
      File file = File(result.files.single.path);
      //  print(file.name);
      //  print(file.bytes);
      //  print(file.size);
      //  print(file.extension);
      //  print(file.path);

      setState(() {
        _mImageFile = file;
        _mimeType = lookupMimeType(_mImageFile.path);
        print('mimeType : ' + _mimeType);
      });
    } else {
      // User canceled the picker
    }
    // if (mFile != null) {
    //   setState(() {
    //     _mImageFile = mFile;
    //     _mimeType = lookupMimeType(_mImageFile.path);
    //     print('mimeType : ' + _mimeType);
    //   });
    // } else {
    //   // User canceled the picker
    // }
  }

  _openCamera() async {
    List<int> imageBytes;
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _mImageFile = File(pickedFile.path);
        _mimeType = lookupMimeType(_mImageFile.path);
        imageBytes = _mImageFile.readAsBytesSync();
        _encodedImage = base64Encode(imageBytes);
      } else {
        print('No image selected.');
      }
    });
  }

  //============== UPLOAD FILE ========
  _uploadFile(BuildContext context) async {
    if (_mImageFile == null) {
      showCustomToast("Please select a file");
      return;
    }
    showProgressDialog(context, "Please wait...");
    // CREATING REQUEST
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(Consts.CUST_UPLOAD_DOC),
    )
      ..fields['user_id'] = userID
      ..fields['project_id'] = selectedProject.propertyID
      ..files.add(await http.MultipartFile.fromPath(
        'uploadedimages',
        _mImageFile.path,
      ));
    // SENDING REQUEST TO SERVER
    request.send().then((response) async {
      // setState(() {
      //   _isUploading = false;
      // });
      if (response.statusCode == 200) {
        print(response.statusCode);
        Navigator.pop(context);
        final respStr = await response.stream.bytesToString();
        var responseData = jsonDecode(respStr);
        if (responseData['status'] == "success") {
          setState(() {
            _mImageFile = null;
            _mimeType = null;
          });
          showCustomToast(responseData['message']);
        } else {
          showCustomToast(responseData['message']);
        }
        // print(respStr);
        // {"status":"success","message":"File uploaded successfully","task_lists":true}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
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
                              'Upload\nAnd Download',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),

                            // color: Colors.blueAccent,

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
              // SizedBox(
              //   height: 70.0,
              // ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedImageView(context),
                    _mImageFile == null
                        ? Center(
                            child: Text(
                              "Let’s upload documents",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 17.0),
                            ),
                          )
                        : Container(),
                    _mImageFile == null
                        ? Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "Add documents from your phone or Open camera to scan new documents.",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 14.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(
                                colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft),
                          ),
                          child: FlatButton.icon(
                            onPressed: () {
                              _openGallery();
                            },
                            icon: SvgPicture.asset(
                              iconGallery,
                              matchTextDirection: false,
                              width: 25.0,
                              height: 25.0,
                            ),
                            label: Text("Open Gallery",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(
                                colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft),
                          ),
                          child: FlatButton.icon(
                            onPressed: () {
                              _openCamera();
                            },
                            icon: SvgPicture.asset(
                              iconGallery,
                              matchTextDirection: false,
                              width: 25.0,
                              height: 25.0,
                            ),
                            label: Text("Open Camera",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        right: 20.0,
                        left: 20.0,
                      ),
                      child: _mImageFile != null
                          ? InkWell(
                              onTap: () {
                                _uploadFile(context);
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFE91E63),
                                          Color(0xFFFFC107)
                                        ],
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 7.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.cloud_upload,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                        SizedBox(
                                          width: 9.0,
                                        ),
                                        Text("Upload",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  )
                                  // FlatButton.icon(
                                  //   onPressed: () {},
                                  //   icon: Icon(
                                  //     Icons.cloud_upload,
                                  //     color: Colors.white,
                                  //     size: 35.0,
                                  //   ),
                                  //   label: Text("Upload",
                                  //       style: TextStyle(
                                  //         fontSize: 14.0,
                                  //         color: Colors.white,
                                  //       )),
                                  // ),
                                  ),
                            )
                          : Container(),
                    ),
                  ],
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
          ),
        ),
      ),
    );
  }

  final options = [
    "Basic Information",
    "Change Password",
    "Settings",
    "Legal Information",
    "Send Feedback",
    "Logout"
  ];

  Widget selectedImageView(BuildContext context) {
    if (_mImageFile == null && _mimeType == null) {
      return SvgPicture.asset(
        iconCloud,
        matchTextDirection: false,
        height: 170.0,
        width: 98.0,
      );
    } else if (_mImageFile != null && _mimeType == "image/jpeg") {
      return Container(
        height: 240,
        child: Image.file(_mImageFile),
      );
    } else if (_mimeType != null && _mimeType == "application/pdf") {
      return Container(
        child: Column(
          children: [
            Icon(
              Icons.file_present,
              size: 70,
              color: Colors.grey[350],
            ),
            // SvgPicture.asset(
            //   iconCloud,
            //   matchTextDirection: false,
            //   height: 170.0,
            //   width: 98.0,
            // ),
            Text(basename(_mImageFile.path)),
          ],
        ),
      );
    } else if (_mimeType != null &&
        (_mimeType ==
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document" ||
            _mimeType == "application/msword")) {
      return Container(
        child: Column(
          children: [
            Icon(
              Icons.file_present,
              size: 70,
              color: Colors.grey[350],
            ),
            // SvgPicture.asset(
            //   iconCloud,
            //   matchTextDirection: false,
            //   height: 170.0,
            //   width: 98.0,
            // ),
            Text(basename(_mImageFile.path)),
          ],
        ),
      );
    }
  }
}
