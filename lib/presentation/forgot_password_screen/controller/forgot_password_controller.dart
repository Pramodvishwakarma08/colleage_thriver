import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';

/// A controller class for the ForgotPasswordScreen.
///
/// This class manages the state of the ForgotPasswordScreen, including the
/// current forgotPasswordModelObj
///
class ForgotPasswordController extends GetxController {
  TextEditingController emailExampleController = TextEditingController();


  @override
  void onClose() {
    super.onClose();
    emailExampleController.dispose();
  }
  Rx<bool> isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> onTapForgotPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: '${emailExampleController.text}');
      AppDialogUtils.showToast(message: "Password reset email sent");
    } catch (e) {
      print(e);
      AppDialogUtils.showToast(message: "Password reset email sent");

    }
  }

  //
  //
  // Future<void> onTapForgotPassword() async{
  //   print("checkInternetConnection==}");
  //
  //   isLoading.value = true;
  //   var data = {'email': '${emailExampleController.text}', };
  //   try {
  //     var response = await ApiClient().postRequest(endPoint: AppUrls.forgetPassword, body: data);
  //     isLoading.value = false;
  //     print(response.toString());
  //     if (response.statusCode == 200) {
  //       emailExampleController.clear();
  //       AppDialogUtils.showToast(message: "${response.data["message"]}",toastLength: Toast.LENGTH_LONG);
  //     }else if(response.statusCode == 400){
  //       AppDialogUtils.showToast(message: "${response.data["message"]}",toastLength: Toast.LENGTH_LONG);
  //
  //     }
  //   } catch (e,stackTrace) {
  //     isLoading.value = false;
  //     AppDialogUtils.showToast(message: '${e.toString()}');
  //     print("catch(e)==>${e.toString()}");
  //     // ignore: unnecessary_brace_in_string_interps
  //     print("stackTrace:${stackTrace}");
  //   }
  // }


}
