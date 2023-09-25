class EmployeeModel {
    final int? id;
    final int? orgId;
    final String? firstName;
    final String? lastName;
    final String? email;
    final dynamic profilePic;
    final String? phone;
    final String? passwordHash;
    final bool? isAdmin;
    final String? refreshToken;
    final int? lunchCreditBalance;
    final dynamic bankNumber;
    final dynamic bankCode;
    final dynamic bankName;
    final String? createdAt;
    final String? updatedAt;

    EmployeeModel({
        this.id,
        this.orgId,
        this.firstName,
        this.lastName,
        this.email,
        this.profilePic,
        this.phone,
        this.passwordHash,
        this.isAdmin,
        this.refreshToken,
        this.lunchCreditBalance,
        this.bankNumber,
        this.bankCode,
        this.bankName,
        this.createdAt,
        this.updatedAt,
    });

    factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        orgId: json["org_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePic: json["profile_pic"],
        phone: json["phone"],
        passwordHash: json["password_hash"],
        isAdmin: json["is_admin"],
        refreshToken: json["refresh_token"],
        lunchCreditBalance: json["lunch_credit_balance"],
        bankNumber: json["bank_number"],
        bankCode: json["bank_code"],
        bankName: json["bank_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "org_id": orgId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_pic": profilePic,
        "phone": phone,
        "password_hash": passwordHash,
        "is_admin": isAdmin,
        "refresh_token": refreshToken,
        "lunch_credit_balance": lunchCreditBalance,
        "bank_number": bankNumber,
        "bank_code": bankCode,
        "bank_name": bankName,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
