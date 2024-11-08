import 'package:colleage_thriver/core/utils/textfield_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/utils/text_field_input_formatters.dart';
import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  final _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Form(
          key: _formKeyLogin,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60.v),
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle593,
                    height: 139.v,
                    // width: 162.h,
                    alignment: Alignment.center),
                SizedBox(height: 32.v),
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text("lbl_welcome_back".tr,
                        style: CustomTextStyles.titleLargeRobotoYellow80001)),
                SizedBox(height: 0.v),
                Container(
                    width: 200.h,
                    margin: EdgeInsets.only(left: 8.h),
                    child: Text("msg_sign_in_to_continue".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyMediumRobotoIndigo900
                            .copyWith(height: 1.16))),
                SizedBox(height: 24.v),
                Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text("lbl_email".tr,
                        style: theme.textTheme.bodyMedium)),
                SizedBox(height: 10.v),
                CustomTextFormField(
                  inputFormatters: InputFormatters.spaceRestricted(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validator.validateEmail,
                  controller: controller.emailValueController,
                ),
                SizedBox(height: 18.v),
                Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text("lbl_password".tr,
                        style: theme.textTheme.bodyMedium)),
                SizedBox(height: 9.v),
                Obx(() => CustomTextFormField(
                    validator: Validator.validatePassword,
                    controller: controller.sVGController,
                    textInputAction: TextInputAction.done,
                    suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 14.v),
                            child: controller.isShowPassword.value
                                ? Icon(Icons.password)
                                : Icon(Icons.remove_red_eye_sharp))),
                    suffixConstraints: BoxConstraints(maxHeight: 44.v),
                    obscureText: controller.isShowPassword.value)),
                SizedBox(height: 44.v),
                Obx(
                  () => CustomElevatedButton(
                    isLoading: controller.isLoading.value,
                    text: "lbl_login".tr,
                    onPressed: onTapLogin,
                  ),
                ),
                SizedBox(height: 30.v),
                // GoogleSignInButton(),
                GoogleButton(),
                SizedBox(height: 20.v),
                if(GetPlatform.isAndroid )SizedBox(height: 20.v),
                if(GetPlatform.isIOS )AppleButton(),
                SizedBox(height: 30.v),
                GestureDetector(
                  onTap: onTapForgotTextSignUp,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("msg_forgot_password".tr,
                          style: CustomTextStyles.titleSmallBlack90001)),
                ),
                SizedBox(height: 20.v),
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          onTapTxtSignUp();
                        },
                        child: Text("lbl_sign_up".tr,
                            style: CustomTextStyles.titleLargePrimary))),
                SizedBox(height: 30.v),
              ]),
        ),
      ),
    ));
  }

  /// Navigates to the yourRoadmapToCollegeScreen when the action is triggered.
  onTapLogin() {
    if (_formKeyLogin.currentState!.validate()) {
      //controller.signUpWithEmailAndPassword(email: '${controller.emailValueController.text}', password: '${controller.sVGController.text}', name: '');
      controller.signInWithEmailAndPassword();
    }
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtSignUp() {
    Get.toNamed(AppRoutes.signupScreen,)?.then((value) {
      controller.emailValueController.clear();
      controller.sVGController.clear();

    });
  }

  onTapForgotTextSignUp() async{
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

}

class GoogleButton extends StatelessWidget {
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        controller.signInWithGoogle();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.v,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xB2A2A2A2)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Center(
          child: Obx(
            () => controller.isLoadingGooglelogin.value
                ? Center(
                    child: Container(
                      height: 20.adaptSize,
                        width: 20.adaptSize,
                        child: CircularProgressIndicator(
                    strokeWidth: 1,
                  )))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        height: 28.adaptSize,
                        imagePath: "assets/images/Frame 427321018 (2).png",
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Continue with Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.adaptSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
class AppleButton extends StatelessWidget {
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
       // controller.signInWithGoogle();
        controller.signInWithApple();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.v,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xB2A2A2A2)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Center(
          child: Obx(
            () => controller.isLoadingApplelogin.value
                ? Center(
                    child: Container(
                      height: 20.adaptSize,
                        width: 20.adaptSize,
                        child: CircularProgressIndicator(
                    strokeWidth: 1,
                  )))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        height: 28.adaptSize,
                        imagePath: "assets/images/Apple ICON (1).png",
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Continue with Apple',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
