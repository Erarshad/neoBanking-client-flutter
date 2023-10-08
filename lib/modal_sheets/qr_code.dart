import 'package:expanse_manager_v2/modal_sheets/upi_transfer.dart';
import 'package:expanse_manager_v2/views/DashBoard/DashBoard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../const/const.dart';
import '../style/text_style.dart';

Widget qRpay(BuildContext context,DashBoardviewModel viewModel) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.80,
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
                "Scan QR",
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
          SizedBox(
              height: 95.sp,
              child: MobileScanner(
                onDetect: (capture, data) {
                  print(capture.rawValue);
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                                context: context,
                                backgroundColor: themeColor,
                                isScrollControlled: true,
                                
                                builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: upiTransfer(context,viewModel,value: capture.rawValue)),
                              );
                },
              )),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            "Please scan QR code to send money",
            style: graysmall,
          )
        ]),
  );
}
