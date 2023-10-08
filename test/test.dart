// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:convert';
import 'package:expanse_manager_v2/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group("Login test", () {
    test("Login check attempt 1", () async {
      //1. setup
      NetWork _network = NetWork();
      //2. do
      http.Response response = await _network.login("test@mail.com", "123");

      //3. Test
      expect(jsonDecode(response.body)["status"], 200);
    });
    test("Login check attempt 2", () async {
      //1. setup
      NetWork _network = NetWork();
      //2. do
      http.Response response = await _network.login("test@mai.com", "123@jjd");

      //3. Test
      expect(jsonDecode(response.body)["status"], 402);
    });
    test("Login check attempt 3", () async {
      //1. setup
      NetWork _network = NetWork();
      //2. do
      http.Response response = await _network.login("", "");

      //3. Test
      expect(jsonDecode(response.body)["status"], 402);
    });
  });

 
}
