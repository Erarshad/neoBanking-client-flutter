import 'dart:convert';

import 'package:expanse_manager_v2/const/assets.dart';
import 'package:expanse_manager_v2/const/const.dart';
import 'package:expanse_manager_v2/modal_sheets/add_money.dart';
import 'package:expanse_manager_v2/modal_sheets/money_transfer.dart';
import 'package:expanse_manager_v2/modal_sheets/upi_transfer.dart';
import 'package:expanse_manager_v2/util/dateUtil.dart';
import 'package:expanse_manager_v2/util/toast.dart';
import 'package:expanse_manager_v2/views/DashBoard/expanse.dart';
import 'package:expanse_manager_v2/widgets/menu_blocks.dart';
import 'package:expanse_manager_v2/widgets/tag_block.dart';
import 'package:expanse_manager_v2/widgets/tile_blocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../modal_sheets/qr_code.dart';
import '../../style/text_style.dart';
import 'DashBoard_view_model.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DashBoardviewModel viewModel =
        Provider.of<DashBoardviewModel>(context, listen: false);
    viewModel.onPageLoad(context);
  }

  @override
  Widget build(BuildContext context) {
    DashBoardviewModel viewModel = Provider.of<DashBoardviewModel>(context);
    return Scaffold(
      key: viewModel.scaffoldKey,
      backgroundColor: themeColor,
      appBar: AppBar(
        leadingWidth: 0.0,
        backgroundColor: themeColor,
        scrolledUnderElevation: 0.0,
        leading: Padding(
            padding: onlyLeftPadding,
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 25.0,
            )),
        actions: [
          Padding(
              padding: onlyRightPadding,
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        width: 10.sp,
                        height: 10.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ))
                ],
              )),
          Padding(
              padding: onlyRightPadding,
              child: const Icon(
                Icons.help_outline,
                color: Colors.black,
                size: 25.0,
              )),
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: SingleChildScrollView(
              padding: leftRightPadding,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: viewModel.selectedNeoBankingMode == 0
                              ? tagSolid("Account")
                              : tagOutLine("Account"),
                          onTap: () {
                            viewModel.setSelectedNeoBankingMode(0);
                          },
                        ),
                        SizedBox(width: 10.sp),
                        InkWell(
                          child: viewModel.selectedNeoBankingMode == 1
                              ? tagSolid("Debit Card")
                              : tagOutLine("Debit Card"),
                          onTap: () {
                            viewModel.setSelectedNeoBankingMode(1);
                          },
                        ),
                        SizedBox(width: 10.sp),
                        InkWell(
                          child: viewModel.selectedNeoBankingMode == 2
                              ? tagSolid("Loans")
                              : tagOutLine("Loans"),
                          onTap: () {
                            viewModel.setSelectedNeoBankingMode(2);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Container(
                        height: 60.sp,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            gradient: LinearGradient(
                              colors: [anotherthemeColor, secondarythemeColor],
                              stops: [0, 0.5],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 10.0),
                                    height: 35.sp,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        gradient: LinearGradient(
                                          colors: [Colors.white54, pinkColor],
                                          stops: [0, 0.5],
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Wallet Balance",
                                          style: small,
                                        ),
                                        Text(
                                          "\$${viewModel.getBankBalance()}",
                                          style: normalBold,
                                        )
                                      ],
                                    ))),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 33.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "UPI ID: ${viewModel.upiid ?? "fetching..."}",
                                      style: small,
                                    ),
                                    SizedBox(
                                      width: 4.sp,
                                    ),
                                    Icon(
                                      Icons.copy_outlined,
                                      color: Colors.white,
                                      size: 15.sp,
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 33.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: themeColor,
                                      isScrollControlled: true,
                                      //   constraints: BoxConstraints.loose(Size(
                                      // MediaQuery.of(context).size.width,
                                      // MediaQuery.of(context).size.height*0.4),),

                                      builder: (context) => Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: addMoney(context, viewModel)),
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  color: Colors.black)))),
                                  child: SizedBox(
                                      width: 38.sp,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Add Money",
                                            style: smallBold,
                                          ),
                                          SizedBox(
                                            width: 3.sp,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 15.sp,
                                          )
                                        ],
                                      )),
                                ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: themeColor,
                                    isScrollControlled: true,
                                    builder: (context) => Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child:
                                            moneyTransfer(context, viewModel)),
                                  );
                                },
                                child: menu(
                                    false, bankLogo, null, "Bank Transfer")),
                            InkWell(
                              child: menu(true, bankLogo, Icons.qr_code,
                                  "Scan QR Code"),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: themeColor,
                                  isScrollControlled: true,
                                  builder: (context) => Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: qRpay(context, viewModel)),
                                );
                              },
                            ),
                            InkWell(
                              child:
                                  menu(false, atTheRate, null, "UPI transfer"),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: themeColor,
                                  isScrollControlled: true,
                                  builder: (context) => Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: upiTransfer(context, viewModel)),
                                );
                              },
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Expanse(data: viewModel.transactions),
                                  ));
                                },
                                child: menu(true, bankLogo, Icons.attach_money,
                                    "View Expanses")),
                          ],
                        )),
                    Text(
                      "Recent Transaction",
                      style: smallerBlack,
                    ),
                    const Divider(),
                    MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            reverse: true,
                            key: Key("${viewModel.transactions.length}"),
                            itemBuilder: (context, index) {
                              return  tile(
                                      viewModel.transactions[index].name,
                                      "${formattedTime(viewModel.transactions[index].timeStamp)}, From ${viewModel.transactions[index].bankName}",
                                      "${(viewModel.transactions[index].isAdd == null || viewModel.transactions[index].isAdd == false) ? "-" : "+"}\$${viewModel.transactions[index].transferredRupee}",
                                      null);
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: viewModel.transactions.length)),
                    const Divider(),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      "Payments Pending",
                      style: smallerBlack,
                    ),
                    const Divider(),
                    MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            reverse: true,
                            key: Key("${viewModel.pendingtransactions.length}"),
                            itemBuilder: (context, index) {
                              return tile(
                                  viewModel.pendingtransactions[index].name,
                                  "${formattedTime(viewModel.pendingtransactions[index].timeStamp)}, From ${viewModel.pendingtransactions[index].bankName}",
                                  null,
                                  ElevatedButton(
                                    onPressed: () {
                                      viewModel.addTransaction(
                                          viewModel
                                              .pendingtransactions[index].name,
                                          viewModel.pendingtransactions[index]
                                              .transferredRupee,
                                          context);
                                      showToast("Transferred the amount");
                                      viewModel.removePendingTransaction(index);
                                    },
                                    child: Text(
                                      "Send Money",
                                      style: smallBlack,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                themeColor),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: BorderSide(
                                                    color: Colors.black)))),
                                  ));
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: viewModel.pendingtransactions.length)),
                    viewModel.pendingtransactions.isNotEmpty
                        ? const Divider()
                        : const SizedBox(),
                  ]))),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 10.sp),
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: themeColor,
                  isScrollControlled: true,
                  builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: qRpay(context, viewModel)),
                );
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.black)))),
              child: SizedBox(
                  width: 42.sp,
                  height: 27.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        "Scan & Pay",
                        style: small,
                      )
                    ],
                  )))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
