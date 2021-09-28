import 'package:abaadengineering/ui/consultant_profile/previousWork/PreviousWorkModel.dart';
import 'package:flutter/material.dart';

class PreviousWorkModelList extends StatefulWidget {
  PreviousWorkList workList;
  PreviousWorkModelList({Key key, this.workList}) : super(key: key);

  @override
  _PreviousWorkModelListState createState() => _PreviousWorkModelListState();
}

class _PreviousWorkModelListState extends State<PreviousWorkModelList> {
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
                image: NetworkImage(widget.workList.prevworksImage),
                fit: BoxFit.fill)),
      ),
    );
  }
}
