import 'package:expanse_manager_v2/util/toast.dart';
import 'package:expanse_manager_v2/views/DashBoard/DashBoard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/const.dart';
import '../style/text_style.dart';

String? _money;
String? _name;
String? _ac;
Widget moneyTransfer(BuildContext context, DashBoardviewModel viewModel) {
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
                "Bank Transfer",
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
              style: blacklite,
              onChanged: (val) {
                _ac = val;
              },
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter a/c number",
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
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if ((_money ?? "").isNotEmpty &&
                      (_name ?? "").isNotEmpty &&
                      (_ac ?? "").isNotEmpty) {
                    viewModel.addTransaction(_name, _money,context,isPending: false);
                    _money = "";
                    _name = "";
                    _ac = "";
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
                  "Transfer now",
                  style: smallBlack,
                ),
              )
            ],
          )
        ]),
  );
}
