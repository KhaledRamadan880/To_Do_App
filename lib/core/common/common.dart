import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../util/colors.dart';

void navigator({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void showToast({required String massage, required ToastStates state}) {
  Fluttertoast.showToast(
    msg: massage,
    backgroundColor: getState(state),
    textColor: AppColors.white,
    fontSize: 15,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}

enum ToastStates { success, warning, error }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      return AppColors.green;
    case ToastStates.warning:
      return AppColors.orange;
    case ToastStates.error:
      return AppColors.red;
  }
}
