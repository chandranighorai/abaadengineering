import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:fluttertoast/fluttertoast.dart';

showAlertDialog(BuildContext context, String message, Function onOKPressed) {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'AEC',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: onOKPressed,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(_packageInfo.appName),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showCustomToast(String message, [Color mColor]) {
  mColor ??= Color(0x99000000);
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 16.0,
    backgroundColor: mColor,
    textColor: Colors.white,
  );
}

showAlertWithOkCancel(BuildContext context, String message,
    Function onOKPressed, Function onCancel) {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'AEC',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: onOKPressed,
  );
  // set up the button
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: onCancel,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(_packageInfo.appName),
    content: Text(message),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
