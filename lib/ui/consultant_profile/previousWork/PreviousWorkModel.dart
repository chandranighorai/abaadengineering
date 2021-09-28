class PreviousWorkModel {
  String status;
  String message;
  List<PreviousWorkList> previousWorkList;

  PreviousWorkModel({this.status, this.message, this.previousWorkList});

  PreviousWorkModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['previous_work_list'] != null) {
      previousWorkList = new List<PreviousWorkList>();
      json['previous_work_list'].forEach((v) {
        previousWorkList.add(new PreviousWorkList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.previousWorkList != null) {
      data['previous_work_list'] =
          this.previousWorkList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreviousWorkList {
  String id;
  String projectName;
  String prevworksSlug;
  String prevworksImage;
  String completionDate;
  String status;
  String modificationDate;
  String addDate;

  PreviousWorkList(
      {this.id,
      this.projectName,
      this.prevworksSlug,
      this.prevworksImage,
      this.completionDate,
      this.status,
      this.modificationDate,
      this.addDate});

  PreviousWorkList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
    prevworksSlug = json['prevworks_slug'];
    prevworksImage = json['prevworks_image'];
    completionDate = json['completion_date'];
    status = json['status'];
    modificationDate = json['modification_date'];
    addDate = json['add_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    data['prevworks_slug'] = this.prevworksSlug;
    data['prevworks_image'] = this.prevworksImage;
    data['completion_date'] = this.completionDate;
    data['status'] = this.status;
    data['modification_date'] = this.modificationDate;
    data['add_date'] = this.addDate;
    return data;
  }
}
