import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/new_password_screen/models/new_password_model.dart';import 'package:flutter/material.dart';/// A controller class for the NewPasswordScreen.
///
/// This class manages the state of the NewPasswordScreen, including the
/// current newPasswordModelObj
class NewPasswordController extends GetxController {TextEditingController sVGController = TextEditingController();

TextEditingController sVGController1 = TextEditingController();

Rx<NewPasswordModel> newPasswordModelObj = NewPasswordModel().obs;

Rx<bool> isShowPassword = true.obs;

Rx<bool> isShowPassword1 = true.obs;

@override void onClose() { super.onClose(); sVGController.dispose(); sVGController1.dispose(); } 
 }
