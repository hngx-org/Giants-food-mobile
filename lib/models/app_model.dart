// import 'dart:convert';

// List<UserLogin> userLoginFromJson(String str) =>
//     List<UserLogin>.from(json.decode(str).map((x) => UserLogin.fromJson(x)));

// String userLoginToJson(List<UserLogin> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UserLogin {
//   User? user;
//   Tokens? tokens;

//   UserLogin({this.user, this.tokens});

//   UserLogin.fromJson(Map<String, dynamic> json) {
//     user = (json['user'] as Map<String, dynamic>?) != null
//         ? User.fromJson(json['user'] as Map<String, dynamic>)
//         : null;
//     tokens = (json['tokens'] as Map<String, dynamic>?) != null
//         ? Tokens.fromJson(json['tokens'] as Map<String, dynamic>)
//         : null;

//     // user = json['user'] != null ? User.fromJson(json['user']) : null;
//     // tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = user!.toJson();
//     }
//     if (tokens != null) {
//       data['tokens'] = this.tokens!.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   String? orgId;
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? profilePicture;
//   String? phoneNumber;
//   bool? isAdmin;
//   int? lunchCreditBalance;
//   int? bankNumber;
//   int? bankCode;
//   String? bankName;

//   User(
//       {this.orgId,
//       this.id,
//       this.firstName,
//       this.lastName,
//       this.email,
//       this.profilePicture,
//       this.phoneNumber,
//       this.isAdmin,
//       this.lunchCreditBalance,
//       this.bankNumber,
//       this.bankCode,
//       this.bankName});

//   User.fromJson(Map<String, dynamic> json) {
//     orgId = json['org_id'];
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     profilePicture = json['profile_picture'];
//     phoneNumber = json['phone_number'];
//     isAdmin = json['is_admin'];
//     lunchCreditBalance = json['lunch_credit_balance'];
//     bankNumber = json['bank_number'];
//     bankCode = json['bank_code'];
//     bankName = json['bank_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['org_id'] = this.orgId;
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email'] = this.email;
//     data['profile_picture'] = this.profilePicture;
//     data['phone_number'] = this.phoneNumber;
//     data['is_admin'] = this.isAdmin;
//     data['lunch_credit_balance'] = this.lunchCreditBalance;
//     data['bank_number'] = this.bankNumber;
//     data['bank_code'] = this.bankCode;
//     data['bank_name'] = this.bankName;
//     return data;
//   }
// }

// class Tokens {
//   Access? access;
//   Access? refresh;

//   Tokens({this.access, this.refresh});

//   Tokens.fromJson(Map<String, dynamic> json) {
//     access = json['access'] != null ? Access.fromJson(json['access']) : null;
//     refresh = json['refresh'] != null ? Access.fromJson(json['refresh']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (this.access != null) {
//       data['access'] = this.access!.toJson();
//     }
//     if (this.refresh != null) {
//       data['refresh'] = this.refresh!.toJson();
//     }
//     return data;
//   }
// }

// class Access {
//   String? token;
//   String? expires;

//   Access({this.token, this.expires});

//   Access.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     expires = json['expires'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['token'] = this.token;
//     data['expires'] = this.expires;
//     return data;
//   }
// }

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  User? user;
  Tokens? tokens;

  UserModel({this.user, this.tokens});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (tokens != null) {
      data['tokens'] = tokens!.toJson();
    }
    return data;
  }
}

class User {
  String? orgId;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePicture;
  String? phoneNumber;
  bool? isAdmin;
  int? lunchCreditBalance;
  String? bankNumber;
  String? bankCode;
  String? bankName;

  User({
    this.orgId,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePicture,
    this.phoneNumber,
    this.isAdmin,
    this.lunchCreditBalance,
    this.bankNumber,
    this.bankCode,
    this.bankName,
  });

  User.fromJson(Map<String, dynamic> json) {
    orgId = json['org_id'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    phoneNumber = json['phone_number'];
    isAdmin = json['is_admin'];
    lunchCreditBalance = json['lunch_credit_balance'];
    bankNumber = json['bank_number'];
    bankCode = json['bank_code'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['org_id'] = orgId;
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['profile_picture'] = profilePicture;
    data['phone_number'] = phoneNumber;
    data['is_admin'] = isAdmin;
    data['lunch_credit_balance'] = lunchCreditBalance;
    data['bank_number'] = bankNumber;
    data['bank_code'] = bankCode;
    data['bank_name'] = bankName;
    return data;
  }
}

class Tokens {
  Access? access;
  Access? refresh;

  Tokens({this.access, this.refresh});

  Tokens.fromJson(Map<String, dynamic> json) {
    access = json['access'] != null ? Access.fromJson(json['access']) : null;
    refresh = json['refresh'] != null ? Access.fromJson(json['refresh']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (access != null) {
      data['access'] = access!.toJson();
    }
    if (refresh != null) {
      data['refresh'] = refresh!.toJson();
    }
    return data;
  }
}

class Access {
  String? token;
  String? expires;

  Access({this.token, this.expires});

  Access.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expires'] = expires;
    return data;
  }
}
