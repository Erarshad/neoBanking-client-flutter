import 'package:expanse_manager_v2/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/const.dart';
import '../style/text_style.dart';
import '../views/DashBoard/DashBoard_view_model.dart';

String? _money;
Widget addMoney(BuildContext context, DashBoardviewModel viewModel) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
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
                "Add Money",
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
              keyboardType: TextInputType.number,
              style: blacklite,
              initialValue: _money,
              onChanged: (val) {
                _money = val;
              },
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter amount which you like to add.",
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
                  if ((_money ?? "").isNotEmpty) {
                    viewModel.addIntoBankBalance(double.parse(_money ?? "0.0"));
                    _money = "";
                    Navigator.of(context).pop();
                  } else {
                    showToast("Please enter money to add");
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
                  "Add to account",
                  style: smallBlack,
                ),
              )
            ],
          )
        ]),
  );
}
