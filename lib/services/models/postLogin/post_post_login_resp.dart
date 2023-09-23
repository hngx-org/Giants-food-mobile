class PostPostLoginResp {
  int? code;
  String? message;

  PostPostLoginResp({this.code, this.message});

  PostPostLoginResp.fromJson(Map<String, dynamic> json) {
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
