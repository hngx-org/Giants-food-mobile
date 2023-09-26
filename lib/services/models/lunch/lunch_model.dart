class LunchsModel {
  String? id;
  String? senderId;
  String? receiverId;
  String? quantity;
  String? note;
  bool? redeemed;
  String? orgId;
  String? createdAt;

  LunchsModel(
      {this.id,
      this.senderId,
      this.receiverId,
      this.quantity,
      this.note,
      this.redeemed,
      this.orgId,
      this.createdAt});

  LunchsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    senderId = json['sender_id'].toString();
    receiverId = json['receiver_id'].toString();
    quantity = json['quantity'].toString();
    note = json['note'];
    redeemed = json['redeemed'];
    orgId = json['org_id'].toString();
    createdAt = json['created_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['quantity'] = quantity;
    data['note'] = note;
    data['redeemed'] = redeemed;
    data['org_id'] = orgId;
    data['created_at'] = createdAt;
    return data;
  }
}
