class PaymentModel {
  String status;
  String message;
  List<PaymentLists> paymentLists;

  PaymentModel({this.status, this.message, this.paymentLists});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['payment_lists'] != null) {
      paymentLists = new List<PaymentLists>();
      json['payment_lists'].forEach((v) {
        paymentLists.add(new PaymentLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.paymentLists != null) {
      data['payment_lists'] = this.paymentLists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentLists {
  String paymentID;
  String projectId;
  String paymentCat;
  String paymentTitle;
  String paymentSlug;
  String paymentDate;
  String description;
  String amount;
  String vat;
  String totalPayment;
  String status;
  String modificationDate;
  String addDate;
  String propertyTitle;

  PaymentLists(
      {this.paymentID,
      this.projectId,
      this.paymentCat,
      this.paymentTitle,
      this.paymentSlug,
      this.paymentDate,
      this.description,
      this.amount,
      this.vat,
      this.totalPayment,
      this.status,
      this.modificationDate,
      this.addDate,
      this.propertyTitle});

  PaymentLists.fromJson(Map<String, dynamic> json) {
    paymentID = json['payment_ID'];
    projectId = json['project_id'];
    paymentCat = json['payment_cat'];
    paymentTitle = json['payment_title'];
    paymentSlug = json['payment_slug'];
    paymentDate = json['payment_date'];
    description = json['description'];
    amount = json['amount'];
    vat = json['vat'];
    totalPayment = json['total_payment'];
    status = json['status'];
    modificationDate = json['modification_date'];
    addDate = json['add_date'];
    propertyTitle = json['property_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_ID'] = this.paymentID;
    data['project_id'] = this.projectId;
    data['payment_cat'] = this.paymentCat;
    data['payment_title'] = this.paymentTitle;
    data['payment_slug'] = this.paymentSlug;
    data['payment_date'] = this.paymentDate;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['vat'] = this.vat;
    data['total_payment'] = this.totalPayment;
    data['status'] = this.status;
    data['modification_date'] = this.modificationDate;
    data['add_date'] = this.addDate;
    data['property_title'] = this.propertyTitle;
    return data;
  }
}
