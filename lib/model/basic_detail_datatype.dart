// To parse this JSON data, do
//
//     final basicDetails = basicDetailsFromJson(jsonString);

import 'dart:convert';

BasicDetails basicDetailsFromJson(String str) => BasicDetails.fromJson(json.decode(str));

String basicDetailsToJson(BasicDetails data) => json.encode(data.toJson());

class BasicDetails {
    int? id;
    String? email;
    int? wallet;
    String? upiId;
    String? transactionObject;
    String? pendingTransactionObject;

    BasicDetails({
        this.id,
        this.email,
        this.wallet,
        this.upiId,
        this.transactionObject,
        this.pendingTransactionObject,
    });

    factory BasicDetails.fromJson(Map<String, dynamic> json) => BasicDetails(
        id: json["id"],
        email: json["email"],
        wallet: json["wallet"],
        upiId: json["upiId"],
        transactionObject: json["transactionObject"],
        pendingTransactionObject: json["pendingTransactionObject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "wallet": wallet,
        "upiId": upiId,
        "transactionObject": transactionObject,
        "pendingTransactionObject": pendingTransactionObject,
    };
}
