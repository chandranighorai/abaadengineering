import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/ui/contactus/ChatModel.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Future<ChatModel> chatList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList = getChatList();
    print("ChatList..." + chatList.toString());
  }

  Future<ChatModel> getChatList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = (prefs.getString('userid') ?? '');
    print("userId..." + userId.toString());
    var requestParam = "from_id=" + userId + "&to_id=0";
    var ProjectUrl = Consts.VIEW_MESSAGE + "?" + requestParam;
    var response = await http.get(Uri.parse(ProjectUrl));
    print("response statusCode..." + response.statusCode.toString());
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var serverMessage = responseData["message"];
      var serverStatus = responseData["status"];
      if (serverStatus == "success") {
        return ChatModel.fromJson(responseData);
      }
    } else {
      showCustomToast("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(height: 140.0),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFFC107), Color(0xFF03A9F4)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                    ),
                    child: Row(children: <Widget>[
                      FlatButton(
                        child: Text(
                          'Chat Room',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        // color: Colors.blueAccent,
                        padding: EdgeInsets.fromLTRB(15.0, 15.0, 170.0, 15.0),

                        // color: Colors.white,
                        // onPressed: _nextActivity,
                      ),
                    ])),
                // SizedBox(
                //   width: 15.0,
                //   height: 30.0,
                // ),
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
              future: chatList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var chatList = snapshot.data.messageList;
                  return chatList.length == 0
                      ? Container(
                          color: Colors.white,
                          child: Text("No message yet"),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02,
                              right: MediaQuery.of(context).size.width * 0.02),
                          itemCount: chatList.length,
                          itemBuilder: (context, int index) {
                            MessageList chatModel = chatList[index];
                            return Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.03),
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[100]),
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                        decoration: BoxDecoration(
                                            color: Colors.amber[100],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child:
                                            Text(chatModel.message.toString())),
                                  ],
                                ));
                          });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    //color: Colors.red,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Write message",
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.send)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
