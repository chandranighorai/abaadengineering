import 'package:abaadengineering/ui/consultant_profile/ConsultantModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:open_whatsapp/open_whatsapp.dart';

class VisionProfileList extends StatefulWidget {
  ConsultantProfileList visionList;
  VisionProfileList({Key key, this.visionList}) : super(key: key);

  @override
  _VisionProfileListState createState() => _VisionProfileListState();
}

class _VisionProfileListState extends State<VisionProfileList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03,
        ),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4.0)],
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text(
                    "Consultant name : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Text("${widget.visionList.consultantName}")),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text(
                    "Email Id : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Text("${widget.visionList.emailId}")),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text(
                    "Phone Number : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                InkWell(
                    onTap: () {
                      _directCall(widget.visionList.phoneNumber);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Text("${widget.visionList.phoneNumber}"))),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text(
                    "Instragram Id : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Text("${widget.visionList.instagramId}")),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text("Whatsapp Number : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                InkWell(
                    onTap: () {
                      _whatsappOpen(widget.visionList.whatsappNumber);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Text("${widget.visionList.whatsappNumber}"))),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text("Address : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Text("${widget.visionList.address}")),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 2.7,
                  child: Text("Vision : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Text("${widget.visionList.description}")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_directCall(String phoneNumber) async {
  print("Phone Number..." + phoneNumber);
  FlutterPhoneDirectCaller.callNumber(phoneNumber);
}

_whatsappOpen(String whatsappNumber) {
  FlutterOpenWhatsapp.sendSingleMessage(whatsappNumber, "Hello");
}
