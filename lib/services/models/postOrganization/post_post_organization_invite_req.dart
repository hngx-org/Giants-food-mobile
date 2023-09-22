class PostPostOrganizationInviteReq {
  String? email;

  PostPostOrganizationInviteReq({this.email});

  PostPostOrganizationInviteReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    return data;
  }
}
