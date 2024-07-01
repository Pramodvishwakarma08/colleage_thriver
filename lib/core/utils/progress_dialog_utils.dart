import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:colleage_thriver/core/app_export.dart';

class AppDialogUtils {
  static bool isProgressVisible = true;

  static Future<void> showProgressDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              theme.colorScheme.primary,
            ),
          ),
        );
      },
    );
  }

  static void hideProgressDialog(context) {
    Navigator.of(context).pop();
  }

  Future<void> showAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Cancel booking'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to cancel booking?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showErroDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineMedium,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ///common method for showing progress dialog
  // static void showProgressDialog({isCancellable = false}) async {
  //   if (!isProgressVisible) {
  //     Get.dialog(
  //       Center(
  //         child: CircularProgressIndicator.adaptive(
  //           strokeWidth: 4,
  //           valueColor: AlwaysStoppedAnimation<Color>(
  //             Colors.white,
  //           ),
  //         ),
  //       ),
  //       barrierDismissible: isCancellable,
  //     );
  //     isProgressVisible = true;
  //   }
  // }

  ///common method for hiding progress dialog
  // static void hideProgressDialog() {
  //   if (isProgressVisible) Get.back();
  //   isProgressVisible = false;
  // }

  static void showToast({
    required String message,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.purple,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: Color(0xff7A62A3),
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
