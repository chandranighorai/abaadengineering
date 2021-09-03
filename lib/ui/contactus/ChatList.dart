import 'package:abaadengineering/ui/contactus/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  final MessageList chatModel;
  const ChatList({this.chatModel, Key key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return widget.chatModel.fromId == "0"
        ? Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            width: MediaQuery.of(context).size.width,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      shape: BoxShape.circle,
                      color: Colors.blue[50]),
                  child: Text(
                    "A",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontSize: MediaQuery.of(context).size.width * 0.06),
                  ),
                  // child: Icon(
                  //   Icons.person,
                  //   color: Colors.grey,
                  // )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Flexible(
                  child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.03),
                      decoration: BoxDecoration(
                          color: Colors.cyan[50],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(widget.chatModel.message.toString())),
                ),
              ],
            ))
        : Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    decoration: BoxDecoration(
                        //color: Colors.amber[100],
                        color: Colors.lightGreen[50],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      widget.chatModel.message.toString(),
                      //textAlign: TextAlign.end,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                    //width: MediaQuery.of(context).size.width * 0.15,
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        shape: BoxShape.circle,
                        color: Colors.teal[50]),
                    // child: Icon(
                    //   Icons.person,
                    //   color: Colors.grey,
                    // )
                    child: Text(
                      "Y",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: MediaQuery.of(context).size.width * 0.06),
                    )),
              ],
            ));
  }
}
