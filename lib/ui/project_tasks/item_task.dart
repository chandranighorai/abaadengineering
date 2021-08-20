import 'dart:ffi';

import 'package:abaadengineering/consts/app_colors.dart';
import 'package:abaadengineering/models/task_subtask_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ItemTask extends StatefulWidget {
  final TaskLists taskList;
  final int postion;

  const ItemTask({Key key, this.taskList, this.postion}) : super(key: key);
  @override
  _ItemTaskState createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TaskLists task = widget.taskList;
    List<SubtaskList> subtaskList = task.subtaskList;
    int index = widget.postion;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            // color: Color(0XCCF5F5F5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0X99D5D5D5),
                // color: Colors.grey[300],
                spreadRadius: 0.6,
                blurRadius: 0.9,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            border: Border.all(color: Color(0XCCF2F2F2))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 20.0,
                    ),
                    child: Text(
                      task.name, // MAIN TASK NAME
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 120.0,
                  height: 120.0,
                  child: CircularPercentIndicator(
                    radius: 90.0,
                    lineWidth: 9.0,
                    backgroundWidth: 13.0,
                    animation: true,
                    percent: double.parse(task.percentage) / 100,
                    center: new Text(
                      "${task.percentage}%",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    // footer: new Text(
                    //   "Sales this week",
                    //   style:
                    //   new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    // ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                    backgroundColor: Color(0XFFea1ea4),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: List.generate(
                        subtaskList.length,
                        (index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              index == subtaskList.length - 1
                                  ? Icon(
                                      Icons.radio_button_checked,
                                      color: MColors.taskCheckboxColor,
                                    )
                                  : Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.radio_button_checked,
                                          color: MColors.taskCheckboxColor,
                                        ),
                                        Container(
                                          height: 60,
                                          width: 1.0,
                                          // margin: EdgeInsets.only(right: 360.0),
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4.0,
                                  left: 8.0,
                                ),
                                child: Container(
                                  width: 150.0,
                                  child: Text(
                                    subtaskList[index].name, // Name of Subtask
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(subtaskList.length, (index) {
                        return Container(
                          width: 120.0,
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            child: CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 6.0,
                              animation: true,
                              backgroundWidth: 9.0,
                              percent:
                                  double.parse(subtaskList[index].percentage) /
                                      100,
                              center: new Text(
                                "${subtaskList[index].percentage}%",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              // footer: new Text(
                              //   "Sales this week",
                              //   style:
                              //   new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                              // ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor:
                                  MColors.subTaskProgressHighlightedColor,
                              backgroundColor: MColors.subTaskProgressColor,
                            ),
                          ),
                        );
                      })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
