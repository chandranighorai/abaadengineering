class ProjectsModel {
  String status;
  String message;
  List<Projects> projectLists;

  ProjectsModel({this.status, this.message, this.projectLists});

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['project_lists'] != null) {
      projectLists = new List<Projects>();
      json['project_lists'].forEach((v) {
        projectLists.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.projectLists != null) {
      data['project_lists'] = this.projectLists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  String propertyID;
  String userId;
  String catId;
  String propertyTitle;
  String propertySlug;
  String propertyPrice;
  String description;
  String streetAddr;
  String city;
  String state;
  String country;
  String zip;
  String featuredImage;
  String mapLink;
  String status;
  String modificationDate;
  String addDate;
  String categoryName;

  Projects(
      {this.propertyID,
      this.userId,
      this.catId,
      this.propertyTitle,
      this.propertySlug,
      this.propertyPrice,
      this.description,
      this.streetAddr,
      this.city,
      this.state,
      this.country,
      this.zip,
      this.featuredImage,
      this.mapLink,
      this.status,
      this.modificationDate,
      this.addDate,
      this.categoryName});

  Projects.fromJson(Map<String, dynamic> json) {
    propertyID = json['property_ID'];
    userId = json['user_id'];
    catId = json['cat_id'];
    propertyTitle = json['property_title'];
    propertySlug = json['property_slug'];
    propertyPrice = json['property_price'];
    description = json['description'];
    streetAddr = json['street_addr'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    featuredImage = json['featured_image'];
    mapLink = json['map_link'];
    status = json['status'];
    modificationDate = json['modification_date'];
    addDate = json['add_date'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property_ID'] = this.propertyID;
    data['user_id'] = this.userId;
    data['cat_id'] = this.catId;
    data['property_title'] = this.propertyTitle;
    data['property_slug'] = this.propertySlug;
    data['property_price'] = this.propertyPrice;
    data['description'] = this.description;
    data['street_addr'] = this.streetAddr;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['featured_image'] = this.featuredImage;
    data['map_link'] = this.mapLink;
    data['status'] = this.status;
    data['modification_date'] = this.modificationDate;
    data['add_date'] = this.addDate;
    data['category_name'] = this.categoryName;
    return data;
  }
}
