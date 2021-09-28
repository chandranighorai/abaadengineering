class FeedbackModel {
  String status;
  String message;
  List<TestimonialList> testimonialList;

  FeedbackModel({this.status, this.message, this.testimonialList});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['testimonial_list'] != null) {
      testimonialList = new List<TestimonialList>();
      json['testimonial_list'].forEach((v) {
        testimonialList.add(new TestimonialList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.testimonialList != null) {
      data['testimonial_list'] =
          this.testimonialList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TestimonialList {
  String id;
  String customerName;
  String testimonialSlug;
  String testimonial;
  String status;
  String modificationDate;
  String addDate;

  TestimonialList(
      {this.id,
      this.customerName,
      this.testimonialSlug,
      this.testimonial,
      this.status,
      this.modificationDate,
      this.addDate});

  TestimonialList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    testimonialSlug = json['testimonial_slug'];
    testimonial = json['testimonial'];
    status = json['status'];
    modificationDate = json['modification_date'];
    addDate = json['add_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_name'] = this.customerName;
    data['testimonial_slug'] = this.testimonialSlug;
    data['testimonial'] = this.testimonial;
    data['status'] = this.status;
    data['modification_date'] = this.modificationDate;
    data['add_date'] = this.addDate;
    return data;
  }
}
