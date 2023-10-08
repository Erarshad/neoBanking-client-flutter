import 'package:avatars/avatars.dart';
import 'package:expanse_manager_v2/const/const.dart';
import 'package:expanse_manager_v2/model/transaction_data_model.dart';
import 'package:expanse_manager_v2/style/text_style.dart';
import 'package:flutter/material.dart';

import '../../util/dateUtil.dart';

// ignore: must_be_immutable
class Expanse extends StatefulWidget {
  List<Transaction> data;
  Expanse({super.key, required this.data});

  @override
  State<Expanse> createState() => _ExpanseState();
}

class _ExpanseState extends State<Expanse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Expanse History",
            style: largeBlacklite,
          ),
        ),
        body: ListView.builder(
          padding: leftRightPadding,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Avatar(
                  name: widget.data[index].name ?? "",
                  shape: AvatarShape.circle(15),
                  placeholderColors: const [anotherthemeColor],
                ),
                title: Text(widget.data[index].name ?? "", style: smallBlack),
                subtitle: Text(
                  "${formattedTime(widget.data[index].timeStamp)}, From ${widget.data[index].bankName}",
                  style: graytinest,
                ),
                trailing: Text(
                  "+₹${widget.data[index].transferredRupee}",
                  style: smallBlackBold,
                ));
          },
        ));
  }
}
