// To parse this JSON data, do
//
//     final signUp1Response = signUp1ResponseFromJson(jsonString);

import 'dart:convert';

SignUp1Response signUp1ResponseFromJson(String str) => SignUp1Response.fromJson(json.decode(str));

String signUp1ResponseToJson(SignUp1Response data) => json.encode(data.toJson());

class SignUp1Response {
    User user;
    Tokens tokens;

    SignUp1Response({
        required this.user,
        required this.tokens,
    });

    factory SignUp1Response.fromJson(Map<String, dynamic> json) => SignUp1Response(
        user: User.fromJson(json["user"]),
        tokens: Tokens.fromJson(json["tokens"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "tokens": tokens.toJson(),
    };
}

class Tokens {
    Access access;
    Access refresh;

    Tokens({
        required this.access,
        required this.refresh,
    });

    factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: Access.fromJson(json["access"]),
        refresh: Access.fromJson(json["refresh"]),
    );

    Map<String, dynamic> toJson() => {
        "access": access.toJson(),
        "refresh": refresh.toJson(),
    };
}

class Access {
    String token;
    DateTime expires;

    Access({
        required this.token,
        required this.expires,
    });

    factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json["token"],
        expires: DateTime.parse(json["expires"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires.toIso8601String(),
    };
}

class User {
    String id;
    bool isAdmin;
    int lunchCreditBalance;
    String email;
    String firstName;
    String lastName;
    String phoneNumber;

    User({
        required this.id,
        required this.isAdmin,
        required this.lunchCreditBalance,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        isAdmin: json["is_admin"],
        lunchCreditBalance: json["lunch_credit_balance"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_admin": isAdmin,
        "lunch_credit_balance": lunchCreditBalance,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
    };
}
