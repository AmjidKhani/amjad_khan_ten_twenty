import 'package:amjad_khan_ten_twenty/view/utils/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void showToast(String message,
      {Color backgroundColor = grey, Color textColor = Colors.white}) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0.sp,
    );
  }
}
