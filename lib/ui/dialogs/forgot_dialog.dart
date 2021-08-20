import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/material.dart';

class ForgotPasswordDialog extends StatefulWidget {
  @override
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 18.0,
            ),
            margin: EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => {
                        setState(() {
                          userEmail = value;
                        }),
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        alignment: Alignment.center,
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0) //

                              ),
                        ),
                        child: FlatButton(
                            minWidth: 100,
                            height: 50,
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16.0,
                              ),
                            ),
                            onPressed: () {
                              debugPrint("Hello");
                              //_forgotPasswordEmail();
                            }),
                      ),
                    ],
                  ),
                ),

                // InkWell(
                //   child:
                //   Container(
                //     width: 50.0,
                //     height: 100.0,
                //     alignment: Alignment.centerRight,
                //     padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(16.0),
                //           bottomRight: Radius.circular(16.0)),
                //     ),
                //     child: Text(
                //       "OK",
                //       style: TextStyle(color: Colors.blue, fontSize: 25.0),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // )
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _forgotPasswordEmail() {
    if (userEmail == null || userEmail == "") {
      showCustomToast("Please enter email");
      return;
    } else {
      showCustomToast("Coming soon");
      // Navigator.pop(context);
    }
  }
}

class DialogExample extends StatefulWidget {
  @override
  _DialogExampleState createState() => new _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  String _text = "initial";
  TextEditingController _c;
  @override
  initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(_text),
          new RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: AlertDialog(
                        title: Text(
                          "Forgot password",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        content: StatefulBuilder(
                          // You need this, notice the parameters below:
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              height: 100,
                              color: Colors.black,
                            );
                          },
                        ),
                      ),
                    );
                  });
            },
            child: new Text("Show Dialog"),
          )
        ],
      )),
    );
  }
}
