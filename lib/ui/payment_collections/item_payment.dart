import 'package:abaadengineering/consts/app_colors.dart';
import 'package:abaadengineering/models/PaymentModel.dart';
import 'package:flutter/material.dart';

class ItemPayment extends StatefulWidget {
  final PaymentLists paymentList;

  const ItemPayment({Key key, this.paymentList}) : super(key: key);
  @override
  _ItemPaymentState createState() => _ItemPaymentState();
}

class _ItemPaymentState extends State<ItemPayment> {
  TextStyle _textStyleDetails = TextStyle(
    fontSize: 14.0,
    color: MColors.paymentDetailsTextColor,
  );

  @override
  Widget build(BuildContext context) {
    PaymentLists _payment = widget.paymentList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          child: Theme(
            data: ThemeData.light().copyWith(
              accentColor: MColors.paymentDetailsTextColor,
            ),
            child: ExpansionTile(
              title: Text(
                _payment.paymentTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              initiallyExpanded: true,
              expandedAlignment: Alignment.topLeft,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 17.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 120.0,
                            child: Text(
                              "Date",
                              style: _textStyleDetails,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _payment.paymentDate,
                              style: _textStyleDetails,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120.0,
                            child: Text(
                              "Description",
                              style: _textStyleDetails,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _payment.description,
                              style: _textStyleDetails,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120.0,
                            child: Text(
                              "Amount",
                              style: _textStyleDetails,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _payment.amount,
                              style: _textStyleDetails,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
