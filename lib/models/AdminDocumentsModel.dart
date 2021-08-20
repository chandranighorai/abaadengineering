class AdminDocumentsModel {
  String status;
  String message;
  List<AdminDocumentsList> adminDocumentsList;

  AdminDocumentsModel({this.status, this.message, this.adminDocumentsList});

  AdminDocumentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['admin_documents_list'] != null) {
      adminDocumentsList = new List<AdminDocumentsList>();
      json['admin_documents_list'].forEach((v) {
        adminDocumentsList.add(new AdminDocumentsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.adminDocumentsList != null) {
      data['admin_documents_list'] =
          this.adminDocumentsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdminDocumentsList {
  String adocumentID;
  String customerId;
  String projectId;
  String adocumentTitle;
  String adocumentsImage;
  String status;
  String modificationDate;
  String addDate;
  String propertyTitle;
  String name;

  AdminDocumentsList(
      {this.adocumentID,
      this.customerId,
      this.projectId,
      this.adocumentTitle,
      this.adocumentsImage,
      this.status,
      this.modificationDate,
      this.addDate,
      this.propertyTitle,
      this.name});

  AdminDocumentsList.fromJson(Map<String, dynamic> json) {
    adocumentID = json['adocument_ID'];
    customerId = json['customer_id'];
    projectId = json['project_id'];
    adocumentTitle = json['adocument_title'];
    adocumentsImage = json['adocuments_image'];
    status = json['status'];
    modificationDate = json['modification_date'];
    addDate = json['add_date'];
    propertyTitle = json['property_title'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adocument_ID'] = this.adocumentID;
    data['customer_id'] = this.customerId;
    data['project_id'] = this.projectId;
    data['adocument_title'] = this.adocumentTitle;
    data['adocuments_image'] = this.adocumentsImage;
    data['status'] = this.status;
    data['modification_date'] = this.modificationDate;
    data['add_date'] = this.addDate;
    data['property_title'] = this.propertyTitle;
    data['name'] = this.name;
    return data;
  }
}
