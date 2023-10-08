import 'dart:convert';
import 'package:expanse_manager_v2/db/IndexedDB.dart';
import 'package:expanse_manager_v2/model/basic_detail_datatype.dart';
import 'package:expanse_manager_v2/model/transaction_data_model.dart';
import 'package:expanse_manager_v2/network/network.dart';
import 'package:expanse_manager_v2/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../util/loader.dart';

class DashBoardviewModel extends ChangeNotifier {
  int selectedNeoBankingMode = 0;
   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void setSelectedNeoBankingMode(int val) {
    selectedNeoBankingMode = val;
    notifyListeners();
  }

  final NetWork _netWork = NetWork();

  double? bankBalance;
  String? upiid;

  void addIntoBankBalance(double money) {
    bankBalance = (bankBalance ?? 0.0) + money;
    notifyListeners();
  }

  String getBankBalance() {
    var formatter = NumberFormat('#,##,000');
    return formatter.format(bankBalance ?? 0.0);
  }

  onPageLoad(BuildContext context) async {
    fetchDashBoardData(context);
  }

  void fetchDashBoardData(BuildContext context) async {
    String email = await IndexedDB.getEmail();
    String token = await IndexedDB.getToken();
    // ignore: use_build_context_synchronously
    Loader.show(context);
    var response = await _netWork.getDashBoardData(email, "bearer $token");

    if (response.statusCode == 200) {
      final basicDetails = basicDetailsFromJson(response.body);
      bankBalance = (basicDetails.wallet ?? 0.0).toDouble();
      upiid = basicDetails.upiId ?? "";
      transactions = (basicDetails.transactionObject ?? "").isNotEmpty
          ? transactionFromJson(
              jsonDecode(basicDetails.transactionObject ?? ""))
          : [];
      pendingtransactions =
          (basicDetails.pendingTransactionObject ?? "").isNotEmpty
              ? transactionFromJson(
                  jsonDecode(basicDetails.pendingTransactionObject ?? ""))
              : [];
      notifyListeners();
    } else {
      showToast("Some problem occoured at server end");
    }
    // ignore: use_build_context_synchronously
    Loader.dismiss(context);
  }

   List<Transaction> transactions = [];

   List<Transaction> pendingtransactions = [];

  void addTransaction(String? name, String? amount, BuildContext context,
      {bool? isPending}) {
    if (isPending == null || isPending == false) {
      if ((bankBalance ?? 0.0) - double.parse(amount ?? "0.0") >= 0) {
        transactions.add(Transaction(
            name: name,
            bankName: "Kotak Bank",
            timeStamp: DateTime.now(),
            transferredRupee: amount,
            isPending: false));

        bankBalance = (bankBalance ?? 0.0) - double.parse(amount ?? "0.0");
       
          notifyListeners();
        
      } else {
        
          showToast("Not sufficient balance in your account");
        
      }
    } else {
      pendingtransactions.add(
        Transaction(
            name: name,
            bankName: "Kotak Bank",
            timeStamp: DateTime.now(),
            transferredRupee: amount,
            isPending: true),
      );

     
        notifyListeners();
      
    }

     updateRecord(); //updating record
  }

  
  void updateRecord({bool? isTest}) async {
   
      Loader.show(scaffoldKey.currentContext);
    
    String email = await IndexedDB.getEmail();
    String token = await IndexedDB.getToken();
    var response = await _netWork.postRecord("bearer $token", email,
        bankBalance?.toInt(), transactions, pendingtransactions);
   
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)["status"] != 200) {
        showToast(jsonDecode(response.body)["message"] ??
            "Some problem occoured at server end while updating record");
      }
    }
    
   // ignore: use_build_context_synchronously
    Loader.dismiss(scaffoldKey.currentContext);
    
  }

  void removePendingTransaction(int indx) {
    pendingtransactions.removeAt(indx);
    notifyListeners();
  }
}
