import 'package:flutter/material.dart';

import 'constance.dart';

class NotiBar {
  static void showSnackBar(BuildContext context, String text,
      {NotificationStatusEnum? status}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: status == null
            ? cPrimaryColor
            : status == NotificationStatusEnum.success
                ? cDoneColor
                : status == NotificationStatusEnum.warning
                    ? cWarning
                    : cErrorColor,
        content: Text(text),

      ));
  }
}
