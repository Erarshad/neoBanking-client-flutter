import 'package:expanse_manager_v2/util/toast.dart';
import 'package:expanse_manager_v2/views/DashBoard/DashBoard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/const.dart';
import '../style/text_style.dart';

String? _money;
String? _name;
String? _upiid;
Widget upiTransfer(BuildContext context,DashBoardviewModel viewModel ,{String? value}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.36,
    padding: leftRightPadding,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "UPI Transfer",
                style: smallerBlack,
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 15.sp,
          ),
          TextFormField(
              style: blacklite,
              onChanged: (val) {
                _name = val;
              },
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter name of reciepient account",
                  hintStyle: blacklite,
                  filled: true,
                  fillColor: themeColor, //

                  focusedBorder: border,
                  border: border)),
          SizedBox(
            height: 10.sp,
          ),
          TextFormField(
              initialValue: value ?? "",
              style: blacklite,
              onChanged: (val) {
                _upiid = val;
              },
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter UPI id/Mobile",
                  hintStyle: blacklite,
                  filled: true,
                  fillColor: themeColor, //

                  focusedBorder: border,
                  border: border)),
          SizedBox(
            height: 10.sp,
          ),
          TextFormField(
              keyboardType: TextInputType.number,
              style: blacklite,
              onChanged: (val) {
                _money = val;
              },
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter amount",
                  hintStyle: blacklite,
                  filled: true,
                  fillColor: themeColor, //

                  focusedBorder: border,
                  border: border)),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                   if ((_money ?? "").isNotEmpty &&
                      (_name ?? "").isNotEmpty &&
                      ((_upiid ?? "").isNotEmpty || (value??"").isNotEmpty)) {
                      viewModel.addTransaction(_name, _money,context,isPending: false);
                    _money = "";
                    _name = "";
                    _upiid = "";
                     Navigator.of(context).pop();

                  } else {
                    showToast("Please enter necessary detail to continue");
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(secondarythemeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side:
                                const BorderSide(color: secondarythemeColor)))),
                child: Text(
                  "Pay",
                  style: smallBlack,
                ),
              )
            ],
          )
        ]),
  );
}
