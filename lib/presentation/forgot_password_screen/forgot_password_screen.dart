import 'package:colleage_thriver/core/utils/textfield_validation.dart';

import '../../widgets/custom_text_form_field.dart';
import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 27.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 66.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgRectangle593,
                        height: 169.v,
                        width: 162.h,
                        alignment: Alignment.center),
                    SizedBox(height: 55.v),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_forgot_password".tr,
                            style:
                                CustomTextStyles.titleLargeRobotoYellow80001)),
                    SizedBox(height: 23.v),
                    Padding(
                        padding: EdgeInsets.only(left: 11.h),
                        child: Text("lbl_email".tr,
                            style: theme.textTheme.bodyMedium)),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                        validator: Validator.validateEmail,
                        controller: controller.emailExampleController,
                        textInputAction: TextInputAction.done),
                    Spacer(),
                    Obx(
                      () => CustomElevatedButton(
                          isLoading: controller.isLoading.value,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.onTapForgotPassword();
                            }
                          },
                          text: "lbl_continue".tr),
                    ),
                    SizedBox(height: 30.v),
                    Center(
                      child: GestureDetector(
                          onTap: () {
                            onTapLoginScreen();
                          },
                          child: Text("lbl_login".tr,
                              style: CustomTextStyles.titleLargePrimary)),
                    ),
                  ])),
        ));
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapnewPasswordScreen() {
    Get.toNamed(
      AppRoutes.newPasswordScreen,
    );
  }

  onTapLoginScreen() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
