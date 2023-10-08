import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../style/text_style.dart';

Widget tile(String? name, String? detail, String? postfix, Widget? postfixWidget) {
  return ListTile(
    dense: true,
    contentPadding: EdgeInsets.zero,
    leading: Avatar(
      name: name ?? "",
      shape: AvatarShape.circle(15),
      placeholderColors: const [anotherthemeColor],
    ),
    title: Text(name ?? "", style: smallBlack),
    subtitle: Text(
      detail ?? "",
      style: graytinest,
    ),
    trailing: postfix!=null? Text(
      postfix,
      style: smallBlackBold,
    ):postfixWidget
  );
}
