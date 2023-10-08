import 'package:expanse_manager_v2/const/const.dart';
import 'package:expanse_manager_v2/db/indexeddb.dart';
import 'package:expanse_manager_v2/views/DashBoard/DashBoard.dart';
import 'package:expanse_manager_v2/views/Login/login.dart';
import 'package:expanse_manager_v2/views/Login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'views/DashBoard/DashBoard_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool isLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStatus();
  }

  void fetchStatus() async {
    isLogin = await IndexedDB.getLoginStatus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DashBoardviewModel()),
            ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: appName,
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
                  useMaterial3: true,
                  fontFamily: fontFamily),
              home: isLogin == false ? const Login() : const DashBoard()));
    });
  }
}
