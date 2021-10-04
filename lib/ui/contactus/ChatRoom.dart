import 'dart:convert';

import 'package:abaadengineering/consts/app_consts.dart';
import 'package:abaadengineering/styles/my_icons.dart';
import 'package:abaadengineering/ui/contactus/ChatList.dart';
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
  String userId;
  TextEditingController messageText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList = getChatList();
    print("ChatList..." + chatList.toString());
    messageText = new TextEditingController();
  }

  Future<ChatModel> getChatList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = (prefs.getString('userid') ?? '');
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

  _sendMessage(String messagesText) async {
    print("MessagText..." + messageText.toString());
    try {
      var requestParams =
          "from_id=" + userId + "&to_id=0" + "&message=" + messagesText;
      var projectUrl = Consts.SEND_MESSAGE + "?" + requestParams;
      print("responseData..." + projectUrl.toString());
      var response = await http.get(Uri.parse(projectUrl));
      var responseData = jsonDecode(response.body);
      print("responseData..." + responseData.toString());
      setState(() {
        chatList = getChatList();
        messageText.clear();
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Row(
              //   children: <Widget>[
              //     //SizedBox(height: 140.0),
              //     Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //               topRight: Radius.circular(10.0),
              //               bottomRight: Radius.circular(10.0)),
              //           gradient: LinearGradient(
              //               colors: [Color(0xFFFFC107), Color(0xFF03A9F4)],
              //               begin: Alignment.centerRight,
              //               end: Alignment.centerLeft),
              //         ),
              //         child: Row(children: <Widget>[
              //           FlatButton(
              //             child: Text(
              //               'Chat Room',
              //               style: TextStyle(fontSize: 20.0, color: Colors.white),
              //             ),
              //             // color: Colors.blueAccent,
              //             padding: EdgeInsets.fromLTRB(15.0, 15.0, 170.0, 15.0),

              //             // color: Colors.white,
              //             // onPressed: _nextActivity,
              //           ),
              //         ])),
              //     // SizedBox(
              //     //   width: 15.0,
              //     //   height: 30.0,
              //     // ),
              //     SvgPicture.asset(iconLogo,
              //         matchTextDirection: false, height: 70.0, width: 68.0),
              //     SizedBox(
              //       height: 60.0,
              //     ),
              //   ],
              // ),
              Row(
                children: <Widget>[
                  //SizedBox(height: 140.0),
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
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          // color: Colors.blueAccent,
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 170.0, 15.0),

                          // color: Colors.white,
                          // onPressed: _nextActivity,
                        ),
                      ])),
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
                              right: MediaQuery.of(context).size.width * 0.02,
                              // top: MediaQuery.of(context).size.width * 0.00,
                              // bottom: MediaQuery.of(context).size.width * 0.00,
                            ),
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: chatList.length,
                            itemBuilder: (context, int index) {
                              MessageList chatModel = chatList[index];
                              return ChatList(chatModel: chatModel);
                            });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
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
                        controller: messageText,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Write message",
                        ),
                        onChanged: (value) {
                          print("val..." + value.toString());
                        },
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          if (messageText.text.length == 0) {
                          } else {
                            _sendMessage(messageText.text);
                          }
                        },
                        child: Icon(Icons.send))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
