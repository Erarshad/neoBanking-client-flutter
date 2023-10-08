import 'package:expanse_manager_v2/const/const.dart';
import 'package:expanse_manager_v2/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Loader {
  static void show(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Loading...",style: smallBlack,),
      content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  CircularProgressIndicator(color: secondarythemeColor,),
            Padding(padding:  EdgeInsets.only(left: 30.sp),child: 
            Text("Please wait",style: smallBlack,))
          ]),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}
