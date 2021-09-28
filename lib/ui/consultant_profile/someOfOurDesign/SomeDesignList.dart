import 'package:abaadengineering/ui/consultant_profile/someOfOurDesign/DesignModel.dart';
import 'package:flutter/material.dart';

class SomeDesignList extends StatefulWidget {
  final ViewDesignList viewDesign;
  SomeDesignList({Key key, this.viewDesign}) : super(key: key);

  @override
  _SomeDesignListState createState() => _SomeDesignListState();
}

class _SomeDesignListState extends State<SomeDesignList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.7,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02)),
            image: DecorationImage(
                image: NetworkImage(widget.viewDesign.designImage),
                fit: BoxFit.fill)),
      ),
    );
  }
}
