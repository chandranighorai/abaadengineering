class DesignModel {
  String status;
  String message;
  List<ViewDesignList> viewDesignList;

  DesignModel({this.status, this.message, this.viewDesignList});

  DesignModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['view_design_list'] != null) {
      viewDesignList = new List<ViewDesignList>();
      json['view_design_list'].forEach((v) {
        viewDesignList.add(new ViewDesignList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.viewDesignList != null) {
      data['view_design_list'] =
          this.viewDesignList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViewDesignList {
  String id;
  String designTitle;
  String designSlug;
  String designImage;
  String status;
  String modificationDate;
  String addDate;

  ViewDesignList(
      {this.id,
      this.designTitle,
      this.designSlug,
      this.designImage,
      this.status,
      this.modificationDate,
      this.addDate});

  ViewDesignList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designTitle = json['design_title'];
    designSlug = json['design_slug'];
    designImage = json['design_image'];
    status = json['status'];
    modificationDate = json['modification_date'];
    addDate = json['add_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['design_title'] = this.designTitle;
    data['design_slug'] = this.designSlug;
    data['design_image'] = this.designImage;
    data['status'] = this.status;
    data['modification_date'] = this.modificationDate;
    data['add_date'] = this.addDate;
    return data;
  }
}
