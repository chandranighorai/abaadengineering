// class SummeryModel {
//   String status;
//   String message;
//   List<SummeryList> summeryList;

//   SummeryModel({this.status, this.message, this.summeryList});

//   SummeryModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['summery_list'] != null) {
//       summeryList = new List<SummeryList>();
//       json['summery_list'].forEach((v) {
//         summeryList.add(new SummeryList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.summeryList != null) {
//       data['summery_list'] = this.summeryList.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class SummeryList {
  String id;
  String projectId;
  String reportName;
  String year;
  String month;
  String files;
  String status;
  String addDate;
  String projectName;
  String reportFiles;

  // SummeryList(
  //     {this.id,
  //     this.projectId,
  //     this.reportName,
  //     this.year,
  //     this.month,
  //     this.files,
  //     this.status,
  //     this.addDate,
  //     this.projectName,
  //     this.reportFiles});

  // SummeryList.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   projectId = json['project_id'];
  //   reportName = json['report_name'];
  //   year = json['year'];
  //   month = json['month'];
  //   files = json['files'];
  //   status = json['status'];
  //   addDate = json['add_date'];
  //   projectName = json['project_name'];
  //   reportFiles = json['report_files'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['project_id'] = this.projectId;
  //   data['report_name'] = this.reportName;
  //   data['year'] = this.year;
  //   data['month'] = this.month;
  //   data['files'] = this.files;
  //   data['status'] = this.status;
  //   data['add_date'] = this.addDate;
  //   data['project_name'] = this.projectName;
  //   data['report_files'] = this.reportFiles;
  //   return data;
  // }
}
