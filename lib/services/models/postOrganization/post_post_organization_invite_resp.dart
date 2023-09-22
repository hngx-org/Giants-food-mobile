class PostPostOrganizationInviteResp {
  int? code;
  String? message;

  PostPostOrganizationInviteResp({this.code, this.message});

  PostPostOrganizationInviteResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (code != null) {
      data['code'] = code;
    }
    if (message != null) {
      data['message'] = message;
    }
    return data;
  }
}
