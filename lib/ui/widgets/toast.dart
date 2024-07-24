import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class Toast {
  show(
          {required BuildContext context,
          required bool isFailure,
          required String message,
          r}) =>
      showToast(
        message,
        textStyle: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
        textPadding: const EdgeInsets.all(12.0),
        position: const ToastPosition(align: Alignment.topCenter),
        margin: EdgeInsets.only(
          left: 20.0,
          top: MediaQuery.of(context).padding.top + 16.0,
          right: 20.0,
        ),
        backgroundColor: isFailure
            ? Theme.of(context).disabledColor
            : Theme.of(context).primaryColor,
        duration: const Duration(seconds: 5),
        animationCurve: Curves.easeInOut,
      );
}
