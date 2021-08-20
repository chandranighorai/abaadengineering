import 'package:flutter/material.dart';

showProgressDialog(
  BuildContext context,
  String message,
) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        CircularProgressIndicator(),
        message != ""
            ? Container(
                margin: EdgeInsets.only(left: 7),
                child: Text(message),
              )
            : Container(),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () {},
        child: alert,
      );
    },
  );
}
