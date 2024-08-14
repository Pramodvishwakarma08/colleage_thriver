import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/signup_screen/models/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';

/// A controller class for the SignupScreen.
///
/// This class manages the state of the SignupScreen, including the
/// current signupModelObj
class SignupController extends GetxController {
  TextEditingController firstNameValueController = TextEditingController();

  TextEditingController lastNameValueController = TextEditingController();

  TextEditingController emailValueController = TextEditingController();

  TextEditingController passWordValueController = TextEditingController();
  TextEditingController cpassWordValueController = TextEditingController();

  Rx<SignupModel> signupModelObj = SignupModel().obs;

  Rx<bool> isShowPassword = true.obs;
  Rx<bool> cisShowPassword = true.obs;

  Rx<bool> isChecked = false.obs;

  Rx<bool> isLoading = false.obs;

  @override
  void onClose() {
    super.onClose();
    firstNameValueController.dispose();
    lastNameValueController.dispose();
    emailValueController.dispose();
    passWordValueController.dispose();
  }


  // Future<void> onTapSignUp() async{
  //   isLoading.value = true;
  //   var data = {
  //     'email': '${emailValueController.text.trim()}',
  //     'password': '${passWordValueController.text}',
  //     'name': '${firstNameValueController.text.trim()}',
  //     'lname': '${lastNameValueController.text.trim()}',
  //   };
  //
  //   try {
  //     var response = await ApiClient().postRequest(endPoint: AppUrls.signup, body: data);
  //     isLoading.value = false;
  //     if (response.statusCode == 200) {
  //       Get.back();
  //       AppDialogUtils.showToast(message: "${response.data["message"]}");
  //     }else{
  //       AppDialogUtils.showToast(message: "${response.data["message"]}");
  //
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     AppDialogUtils.showToast(message: '${e.toString()}');
  //     print("catch(e)==>${e.toString()}");
  //   }
  // }

  final _auth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailValueController.text.trim(),
        password: passWordValueController.text.trim(),
      );
      await _auth.currentUser?.updateDisplayName('${firstNameValueController.text.trim()} ${lastNameValueController.text.trim()}');
       await _auth.currentUser?.sendEmailVerification();
   //  _auth.currentUser?.emailVerified;
      if(_auth.currentUser != null) {
        isLoading.value = false;
        AppDialogUtils.showToast(message: "Account created successfully and Verification email sent. Please check your email.",toastLength: Toast.LENGTH_LONG);
        Get.toNamed(AppRoutes.loginScreen);
      }

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        AppDialogUtils.showToast(message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        AppDialogUtils.showToast(message: "Email address already being in use");

      }else{

        AppDialogUtils.showToast(message: "${e.message}");
      }
    } catch (e) {
      isLoading.value = false;
      AppDialogUtils.showToast(message: "${e.toString()}");
      rethrow;
    }
  }






}
