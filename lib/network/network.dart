import 'dart:convert';
import 'dart:io';
import 'package:expanse_manager_v2/const/const.dart';
import 'package:expanse_manager_v2/util/toast.dart';
import 'package:http/http.dart' as http;

import '../model/transaction_data_model.dart';

class NetWork {
  Future<http.Response> login(String? email, String? pass) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/login"),
          headers: {
            // "Authorization": "",
            "Content-Type": "application/json",
            "Accept": "*/*"
          },
          body: jsonEncode({"email": email, "password": pass}));

      return response;
    } on SocketException {
      showToast("No internet found.");
    }
    return http.Response("", 404);
  }

   Future<http.Response> getDashBoardData(String? email,String token) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/getBasicDetails"),
          headers: {
            "Authorization":token,
            "Content-Type": "application/json",
            "Accept": "*/*"
          },
          body: jsonEncode({"email": email}));

      return response;
    } on SocketException {
      showToast("No internet found.");
    }
    return http.Response("", 404);
  }

   Future<http.Response> postRecord(String token,String email,int? wallet,List<Transaction> transaction,List<Transaction> pendingTransaction) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/transactionDeduct"),
          headers: {
            "Authorization":token,
            "Content-Type": "application/json",
            "Accept": "*/*"
          },
          body: jsonEncode({
            "email":email,
            "amount":wallet,
            "transactions":jsonEncode(transaction),
            "pendingTransactions":jsonEncode(pendingTransaction)
          }));

      return response;
    } on SocketException {
      showToast("No internet found.");
    }
    return http.Response("", 404);
  }
}
