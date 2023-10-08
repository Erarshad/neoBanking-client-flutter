import 'package:expanse_manager_v2/const/const.dart';
import 'package:expanse_manager_v2/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget menu(bool gicon,String path,IconData? ic,String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Container(
              height: 30.sp,
              width: 30.sp,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  shape: BoxShape.rectangle,
                  color: themeColor),
              child: gicon==false?
              Image.asset(
                path,
                height: 20.sp,
                width: 20.sp,
              ):Icon(ic,color: Colors.black,size: 20.sp,)),
         SizedBox(height: 10.sp,),
      SizedBox(
          height: 30.sp,
          width: 30.sp,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: graytinest,
          ))
    ],
  );
}
