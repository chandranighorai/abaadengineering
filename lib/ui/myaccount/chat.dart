import 'package:flutter/material.dart';
// import 'package:flutter_chat/chatWidget.dart';
// import 'package:flutter_chat/chatData.dart';

class Chat extends StatefulWidget {
  const Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    // TODO: implement initState
    //ChatData.init("Just Chat", context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.pink[50],
        //child: ChatWidget.widgetWelcomeScreen(context),
      ),
    );
  }
}
