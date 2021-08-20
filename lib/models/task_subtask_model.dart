class ProjectTasksModel {
  String status;
  String message;
  List<TaskLists> taskLists;

  ProjectTasksModel({this.status, this.message, this.taskLists});

  ProjectTasksModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['task_lists'] != null) {
      taskLists = new List<TaskLists>();
      json['task_lists'].forEach((v) {
        taskLists.add(new TaskLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.taskLists != null) {
      data['task_lists'] = this.taskLists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskLists {
  String taskId;
  String projectId;
  String name;
  String description;
  String percentage;
  String status;
  String dateAdded;
  List<SubtaskList> subtaskList;

  TaskLists(
      {this.taskId,
      this.projectId,
      this.name,
      this.description,
      this.percentage,
      this.status,
      this.dateAdded,
      this.subtaskList});

  TaskLists.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    projectId = json['project_id'];
    name = json['name'];
    description = json['description'];
    percentage = json['percentage'];
    status = json['status'];
    dateAdded = json['date_added'];
    if (json['subtask_list'] != null) {
      subtaskList = new List<SubtaskList>();
      json['subtask_list'].forEach((v) {
        subtaskList.add(new SubtaskList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['project_id'] = this.projectId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['percentage'] = this.percentage;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    if (this.subtaskList != null) {
      data['subtask_list'] = this.subtaskList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubtaskList {
  String name;
  String description;
  String percentage;

  SubtaskList({this.name, this.description, this.percentage});

  SubtaskList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['percentage'] = this.percentage;
    return data;
  }
}
