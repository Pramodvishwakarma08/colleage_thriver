import 'package:colleage_thriver/core/utils/progress_dialog_utils.dart';
import 'package:colleage_thriver/core/utils/textfield_validation.dart';

import '../../core/utils/text_field_input_formatters.dart';
import 'controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class SignupScreen extends GetWidget<SignupController> {
   SignupScreen({Key? key}) : super(key: key);

  final _formKeySignup = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Form(
                  key: _formKeySignup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       SizedBox(height: 20.v),
                       CustomImageView(
                            imagePath: ImageConstant.imgRectangle593,
                            height: 119.v,
                            width: 114.h,
                            alignment: Alignment.center),
                        SizedBox(height: 27.v),
                        Container(
                            width: 220.h,
                            margin: EdgeInsets.only(left: 11.h),
                            child: Text("msg_welcome_to_college".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .titleLargeRobotoYellow80001
                                    .copyWith(height: 1.00))),
                        SizedBox(height: 15.v),
                        Container(
                            width: 220.h,
                            margin: EdgeInsets.only(left: 11.h),
                            child: Text(
                                "msg_sign_in_to_continue".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyMediumRobotoIndigo900
                                    .copyWith(height: 1.16))),
                        SizedBox(height: 24.v),

                        Text("lbl_first_name".tr, style: theme.textTheme.bodyMedium).paddingOnly(left: 11.h),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                          inputFormatters: InputFormatters.spaceRestricted(),
                            validator: Validator.validateFirstName,
                            controller: controller.firstNameValueController,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: 17.v),
                        Text("lbl_last_name".tr, style: theme.textTheme.bodyMedium).paddingOnly(left: 11.h),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                            inputFormatters: InputFormatters.spaceRestricted(),
                            validator: Validator.validateFirstName,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: controller.lastNameValueController),
                        SizedBox(height: 17.v),


                        Text("lbl_email".tr, style: theme.textTheme.bodyMedium).paddingOnly(left: 11.h),
                        SizedBox(height: 9.v),
                        CustomTextFormField(
                            inputFormatters: InputFormatters.spaceRestricted(),
                            validator: Validator.validateEmail,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: controller.emailValueController),
                        SizedBox(height: 17.v),


                        Text("lbl_password".tr, style: theme.textTheme.bodyMedium),
                        SizedBox(height: 9.v),
                        _passwordTextField(),
                        SizedBox(height: 17.v),


                        Text("Confirm password".tr, style: theme.textTheme.bodyMedium),
                        SizedBox(height: 9.v),
                        _cPasswordTextField(),
                        SizedBox(height: 17.v),

                        SizedBox(height: 21.v),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCheckBox(),
                            InkWell(
                              onTap: () {
                                controller.isChecked.value = !controller.isChecked.value;
                              },
                              child: SizedBox(width: MediaQuery.of(context).size.width*.77,
                                child:
                                Text("msg_i_agree_that_i_am".tr,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles.labelMediumBlack90001,

                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.v),
                        _buildSignup(context),


                        // _buildTickOne(),
                        SizedBox(height: 26.v),
                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                                onTap: () {
                                  onTapTxtLogin();
                                },
                                child: Text("lbl_login".tr,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .titleLargePrimary))),
                        SizedBox(height: 21.v),
                      ]),
                )),
          ),
        ));
  }


  /// password Widget
  Widget _passwordTextField() {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Obx(() => CustomTextFormField(
            validator: Validator.validatePassword,
            controller: controller.passWordValueController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.done,
            suffix: InkWell(
                onTap: () {
                  controller.isShowPassword.value = !controller.isShowPassword.value;
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 14.v),
                    child:controller.isShowPassword.value ? Icon(Icons.password)  :
                    Icon(Icons.remove_red_eye_sharp)
                )),
            suffixConstraints: BoxConstraints(maxHeight: 44.v),
            obscureText: controller.isShowPassword.value)));
  }
  Widget _cPasswordTextField() {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child: Obx(() => CustomTextFormField(
            validator: (val ){
              if(val ==null)
                return 'Please enter your confirm password';
              if(val != controller.passWordValueController.text)
                return "Passwords do not match";
              return null;
            }  ,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.cpassWordValueController,
            textInputAction: TextInputAction.done,
            suffix: InkWell(
                onTap: () {
                  controller.cisShowPassword.value = !controller.cisShowPassword.value;
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 14.v, 10.h, 14.v),
                    child:controller.cisShowPassword.value ? Icon(Icons.password)  :
                    Icon(Icons.remove_red_eye_sharp)
                )),
            suffixConstraints: BoxConstraints(maxHeight: 44.v),
            obscureText: controller.cisShowPassword.value)));
  }

  /// Section Widget
  Widget _buildSignup(context) {
    return Obx(
        ()=> CustomElevatedButton(
          isLoading: controller.isLoading.value,
          text: "lbl_signup2".tr,
          margin: EdgeInsets.only(right: 6.h),
          onPressed: () {
            FocusScope.of(context).unfocus();
            onTapSignup();
          }),
    );
  }

  /// checkbox Widget
  Widget _buildCheckBox() {
    return Obx(() =>  Checkbox(
      value: controller.isChecked.value,
      onChanged: (value) {
        controller.isChecked.value = value!;
      },
      checkColor: Colors.white, // Color of the checkmark

    ));
  }

  /// Navigates to the tellUsAboutYourselfScreen when the action is triggered.
  onTapSignup() {
    if (_formKeySignup.currentState!.validate()){
      if(controller.isChecked.value){
        controller.signUpWithEmailAndPassword();
      }else{
        AppDialogUtils.showToast(message: "Please select privacy policy checkbox");
      }
    }

  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLogin() {
    Get.back();
  }



}
