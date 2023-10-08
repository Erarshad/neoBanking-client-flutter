// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(
    json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  String? name;
  String? transferredRupee;
  String? bankName;
  bool? isPending;
  bool? isAdd;
  DateTime? timeStamp;

  Transaction({
    this.name,
    this.transferredRupee,
    this.bankName,
    this.isPending,
    this.timeStamp,
    this.isAdd
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        name: json["name"],
        transferredRupee: json["transferredRupee"],
        bankName: json["bankName"],
        isPending: json["isPending"],
        isAdd: json["isAdd"]??false,
        timeStamp: json["timeStamp"] == null
            ? null
            : DateTime.parse(json["timeStamp"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "transferredRupee": transferredRupee,
        "bankName": bankName,
        "isPending": isPending,
        "isAdd":isAdd,
        "timeStamp": timeStamp?.toIso8601String(),
      };
}
