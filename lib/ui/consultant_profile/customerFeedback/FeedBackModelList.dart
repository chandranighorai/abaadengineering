import 'package:abaadengineering/ui/consultant_profile/customerFeedback/FeedbackModel.dart';
import 'package:flutter/material.dart';

class FeedBackModelList extends StatefulWidget {
  TestimonialList testimonialList;
  FeedBackModelList({Key key, this.testimonialList}) : super(key: key);

  @override
  _FeedBackModelListState createState() => _FeedBackModelListState();
}

class _FeedBackModelListState extends State<FeedBackModelList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
          top: MediaQuery.of(context).size.width * 0.02,
          bottom: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        //height: MediaQuery.of(context).size.width * 0.4,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
            top: MediaQuery.of(context).size.width * 0.06,
            bottom: MediaQuery.of(context).size.width * 0.06),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.02)),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 7.0)]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.testimonialList.testimonial}"),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              "- ${widget.testimonialList.customerName}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
