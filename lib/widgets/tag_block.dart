import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../style/text_style.dart';

Widget tagSolid(String? title) {
  return Container(
    height: 22.sp,
    width: 37.sp,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        shape: BoxShape.rectangle,
        color: Colors.black),
    child: Padding(padding: const EdgeInsets.only(left: 3.0,right: 3.0),child: 
    Text(title ?? "", style: small)),
  );
}

Widget tagOutLine(String? title) {
  return Container(
    height: 22.sp,
    width: 37.sp,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        shape: BoxShape.rectangle,
        color: Colors.transparent),
    child: Padding(padding: const EdgeInsets.only(left: 3.0,right: 3.0),child: 
     Text(title ?? "", style: smallBlack)),
  );
}
