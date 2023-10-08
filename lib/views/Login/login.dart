import 'package:expanse_manager_v2/style/text_style.dart';
import 'package:expanse_manager_v2/views/Login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../const/assets.dart';
import '../../const/const.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: leftRightPadding,
              child: Stack(children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.sp,
                  ),
                  Image.asset(authentication,
                      height: 60.sp, width: MediaQuery.of(context).size.width),
                  SizedBox(
                    height: 30.sp,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Email",
                      style: smallBlack,
                    ),
                  ]),
                  SizedBox(
                    height: 2.sp,
                  ),
                  TextFormField(
                      style: blacklite,
                      controller: viewModel.email,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Email",
                          hintStyle: blacklite,
                          filled: true,
                          fillColor: themeColor, //

                          focusedBorder: border,
                          border: border)),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Password",
                      style: smallBlack,
                    ),
                  ]),
                  TextFormField(
                      style: blacklite,
                      obscureText: true,
                      controller: viewModel.pwd,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Password",
                          hintStyle: blacklite,
                          filled: true,
                          fillColor: themeColor, //

                          focusedBorder: border,
                          border: border)),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          viewModel.validateAndMove(context);
                        },
                        child: Text(
                          "Login",
                          style: smallBlack,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(themeColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.black)))),
                      )
                    ],
                  )
                ],
              ),
               viewModel.isBusy?const Center(child: CircularProgressIndicator(color: secondarythemeColor,),):const SizedBox()
              ],)
              
              )),
    );
  }
}
