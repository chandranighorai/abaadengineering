class ChatModel {
  // String id;
  // String fromId;
  // String toId;
  // String message;
  // String status;
  // String addDate;
  String status;
  String message;
  List<MessageList> messageList;

  ChatModel({this.status, this.message, this.messageList});

  ChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['message_list'] != null) {
      messageList = new List<MessageList>();
      json['message_list'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.messageList != null) {
      data['message_list'] = this.messageList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageList {
  String id;
  String fromId;
  String toId;
  String message;
  String status;
  String addDate;

  MessageList(
      {this.id,
      this.fromId,
      this.toId,
      this.message,
      this.status,
      this.addDate});

  MessageList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromId = json['from_id'];
    toId = json['to_id'];
    message = json['message'];
    status = json['status'];
    addDate = json['add_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_id'] = this.fromId;
    data['to_id'] = this.toId;
    data['message'] = this.message;
    data['status'] = this.status;
    data['add_date'] = this.addDate;
    return data;
  }
}
