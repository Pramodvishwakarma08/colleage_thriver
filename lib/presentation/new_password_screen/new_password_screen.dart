import 'controller/new_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class NewPasswordScreen extends GetWidget<NewPasswordController> {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 26.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 67.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle593,
                          height: 169.v,
                          width: 162.h,
                          alignment: Alignment.center),
                      SizedBox(height: 52.v),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("msg_create_new_password".tr,
                              style: CustomTextStyles
                                  .titleLargeRobotoYellow80001)),
                      SizedBox(height: 26.v),
                      Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: Text("lbl_new_password".tr,
                              style: theme.textTheme.bodyMedium)),
                      SizedBox(height: 9.v),
                      Obx(() => CustomTextFormField(
                          controller: controller.sVGController,
                          suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword.value =
                                    !controller.isShowPassword.value;
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 14.v, 10.h, 14.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgSvg,
                                      height: 16.v,
                                      width: 18.h))),
                          suffixConstraints: BoxConstraints(maxHeight: 44.v),
                          obscureText: controller.isShowPassword.value)),
                      SizedBox(height: 30.v),
                      Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: Text("msg_confirm_password".tr,
                              style: theme.textTheme.bodyMedium)),
                      SizedBox(height: 10.v),
                      Obx(() => CustomTextFormField(
                          controller: controller.sVGController1,
                          textInputAction: TextInputAction.done,
                          suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword1.value =
                                    !controller.isShowPassword1.value;
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 14.v, 10.h, 14.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgSvg,
                                      height: 16.v,
                                      width: 18.h))),
                          suffixConstraints: BoxConstraints(maxHeight: 44.v),
                          obscureText: controller.isShowPassword1.value)),
                      Spacer(),
                      CustomElevatedButton(text: "lbl_continue".tr),
                      SizedBox(height: 16.v),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtBackToLogin();
                              },
                              child: Text("lbl_back_to_login".tr,
                                  style: CustomTextStyles.titleLargePrimary)))
                    ]))));
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtBackToLogin() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
