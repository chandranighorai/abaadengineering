import 'package:abaadengineering/project_seletion/projectslist.dart';
import 'package:abaadengineering/styles/my_icons.dart';
//import 'package:abaadengineering/ui/AccountActivity.dart';
import 'package:abaadengineering/ui/myaccount/AccountActivity.dart';
import 'package:abaadengineering/util/alertdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:abaadengineering/models/projects_model.dart';
import 'package:abaadengineering/models/task_subtask_model.dart';
import 'package:abaadengineering/consts/app_consts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'item_task.dart';

class ProjectTasksScreen extends StatefulWidget {
  final Projects projects;

  const ProjectTasksScreen({Key key, this.projects}) : super(key: key);
  @override
  _ProjectTasksScreen createState() => _ProjectTasksScreen();
}

class _ProjectTasksScreen extends State<ProjectTasksScreen> {
  Future<ProjectTasksModel> projecTaskModel;
  bool hasPorject = true;
  String serverMessage = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projecTaskModel = _getProjectTask(widget.projects.propertyID);
  }

  Future<ProjectTasksModel> _getProjectTask(String projectId) async {
    var PROJECT_TASK_URL =
        Consts.GET_PROJECT_TASKS + "?project_id=" + projectId;

    final response = await http.get(Uri.parse(PROJECT_TASK_URL));
    if (response.statusCode == 200) {
      debugPrint("Response : ${response.body}");
      var responseData = jsonDecode(response.body);
      var serverStatus = responseData['status'];
      if (serverStatus == "success") {
        return ProjectTasksModel.fromJson(responseData);
      } else {
        showCustomToast("" + responseData['message']);
        setState(() {
          hasPorject = false;
          serverMessage = responseData['message'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Projects project = widget.projects;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
              ),
              child: FutureBuilder(
                  future: projecTaskModel,
                  initialData: null,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<TaskLists> taskSubTask = snapshot.data.taskLists;
                      return taskSubTask.length > 0
                          ? ListView.separated(
                              // padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                              itemCount: taskSubTask.length,
                              itemBuilder: (context, index) {
                                return ItemTask(
                                  taskList: taskSubTask[index],
                                  postion: index,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10.0,
                                );
                              },
                            )
                          : Container(
                              color: Colors.red,
                              child: Center(
                                child:
                                    Text("No task found for selected project."),
                              ),
                            );
                    } else {
                      return !hasPorject
                          ? Container(
                              child: Center(
                                child: Text(serverMessage),
                              ),
                            )
                          : SizedBox(
                              height: 150.0,
                              width: 150.0,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                    Color(0xFFFFC107),
                                  ),
                                ),
                              ),
                            );
                    }
                  }),
            ),
          ),
          Stack(
            children: [
              Row(
                children: <Widget>[
                  Flexible(
                    child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectsListScreen(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(iconHome,
                            matchTextDirection: false)),
                    flex: 1,
                  ),
                  Flexible(
                    child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountActivity(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(iconAccount,
                            matchTextDirection: false)),
                    flex: 1,
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: 50,
                  height: 50,
                  child: CircularGradientButton(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    callback: () {
                      Navigator.pop(context);
                    },
                    gradient: LinearGradient(
                        colors: [Color(0xFFE91E63), Color(0xFFFFC107)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
