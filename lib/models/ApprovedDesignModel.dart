class ApprovedDesignModel {
  String status;
  String message;
  List<ApprovedDrawingsList> approvedDrawingsList;

  ApprovedDesignModel({this.status, this.message, this.approvedDrawingsList});

  ApprovedDesignModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['approved_drawings_list'] != null) {
      approvedDrawingsList = new List<ApprovedDrawingsList>();
      json['approved_drawings_list'].forEach((v) {
        approvedDrawingsList.add(new ApprovedDrawingsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.approvedDrawingsList != null) {
      data['approved_drawings_list'] =
          this.approvedDrawingsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApprovedDrawingsList {
  String drawingID;
  String customerId;
  String projectId;
  String drawingTitle;
  String drawingsImage;
  String status;
  String modificationDate;
  String addDate;
  String propertyTitle;
  String name;

  ApprovedDrawingsList(
      {this.drawingID,
      this.customerId,
      this.projectId,
      this.drawingTitle,
      this.drawingsImage,
      this.status,
      this.modificationDate,
      this.addDate,
      this.propertyTitle,
      this.name});

  ApprovedDrawingsList.fromJson(Map<String, dynamic> json) {
    drawingID = json['drawing_ID'];
    customerId = json['customer_id'];
    projectId = json['project_id'];
    drawingTitle = json['drawing_title'];
    drawingsImage = json['drawings_image'];
    status = json['status'];
    modificationDate = json['modification_date'];
    addDate = json['add_date'];
    propertyTitle = json['property_title'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drawing_ID'] = this.drawingID;
    data['customer_id'] = this.customerId;
    data['project_id'] = this.projectId;
    data['drawing_title'] = this.drawingTitle;
    data['drawings_image'] = this.drawingsImage;
    data['status'] = this.status;
    data['modification_date'] = this.modificationDate;
    data['add_date'] = this.addDate;
    data['property_title'] = this.propertyTitle;
    data['name'] = this.name;
    return data;
  }
}
