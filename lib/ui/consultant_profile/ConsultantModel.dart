class ConsultantModel {
  String status;
  String message;
  List<ConsultantProfile> consultantProfile;

  ConsultantModel({this.status, this.message, this.consultantProfile});

  ConsultantModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['consultant_profile'] != null) {
      consultantProfile = new List<ConsultantProfile>();
      json['consultant_profile'].forEach((v) {
        consultantProfile.add(new ConsultantProfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.consultantProfile != null) {
      data['consultant_profile'] =
          this.consultantProfile.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConsultantProfile {
  String id;
  String consultantName;
  String consultantSlug;
  String description;
  String emailId;
  String address;
  String phoneNumber;
  String instagramId;
  String whatsappNumber;
  String mapLink;
  String modificationDate;

  ConsultantProfile(
      {this.id,
      this.consultantName,
      this.consultantSlug,
      this.description,
      this.emailId,
      this.address,
      this.phoneNumber,
      this.instagramId,
      this.whatsappNumber,
      this.mapLink,
      this.modificationDate});

  ConsultantProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultantName = json['consultant_name'];
    consultantSlug = json['consultant_slug'];
    description = json['description'];
    emailId = json['email_id'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    instagramId = json['instagram_id'];
    whatsappNumber = json['whatsapp_number'];
    mapLink = json['map_link'];
    modificationDate = json['modification_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consultant_name'] = this.consultantName;
    data['consultant_slug'] = this.consultantSlug;
    data['description'] = this.description;
    data['email_id'] = this.emailId;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['instagram_id'] = this.instagramId;
    data['whatsapp_number'] = this.whatsappNumber;
    data['map_link'] = this.mapLink;
    data['modification_date'] = this.modificationDate;
    return data;
  }
}
