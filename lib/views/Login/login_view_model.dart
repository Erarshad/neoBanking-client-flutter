import 'dart:convert';

import 'package:expanse_manager_v2/db/indexeddb.dart';
import 'package:expanse_manager_v2/network/network.dart';
import 'package:expanse_manager_v2/util/toast.dart';
import 'package:expanse_manager_v2/views/DashBoard/DashBoard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  // String? defaultemail = "test@mail.com";
  // String? defaultpwd = "123";
  bool isBusy = false;
  setBusy(bool val) {
    isBusy = val;
    notifyListeners();
  }

  final NetWork _network = NetWork();
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  void validateAndMove(BuildContext context) {
    if (email.text.isNotEmpty && pwd.text.isNotEmpty) {
      makeLogin(context);
    } else {
      showToast("Please enter the credential");
    }
  }

  void makeLogin(BuildContext context) async {
    setBusy(true);
    http.Response response = await _network.login(email.text, pwd.text);
    var decodedResponseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (decodedResponseBody["status"] == 200) {
        String secretToken = decodedResponseBody["accessToken"];

        IndexedDB.setToken(secretToken);
        IndexedDB.setLoginStatus(true);
        IndexedDB.setEmail(email.text);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ));
      } else if (decodedResponseBody["status"] == 401 ||
          decodedResponseBody["status"] == 402) {
        showToast(decodedResponseBody["message"]);
      } else {
        showToast("Some problem occoured at server end");
      }
    } else {
      showToast("Some problem occoured at server end");
    }

    setBusy(false);
  }
  
  
}
