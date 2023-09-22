class PostPostLoginReq {
  String? email;
  String? passwordHash;

  PostPostLoginReq({this.email, this.passwordHash});

  PostPostLoginReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    passwordHash = json['password_hash'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    if (passwordHash != null) {
      data['password_hash'] = passwordHash;
    }
    return data;
  }
}
