import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter Email",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: (value) {
                setState(() {});
                print("Value..." + value.toString());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Container(
              height: 56.0,
              width: 100.0,
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFFC107), width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: FlatButton(
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15.0,
                  ),
                ),
                onPressed: () {
                  showCustomToast("Forgot");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
