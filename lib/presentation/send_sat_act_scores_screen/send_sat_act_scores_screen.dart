import 'package:colleage_thriver/core/utils/textfield_validation.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/send_sat_act_scores_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/core/utils/validation_functions.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SendSatActScoresScreen extends GetWidget<SendSatActScoresController> {
  SendSatActScoresScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppbar(title: "msg_send_sat_act_scores".tr),
        body: Form(
            key: _formKey,
            child: Padding(
              padding:  EdgeInsets.only(left: 20.h ,right: 20.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   _activityRow(),
                    SizedBox(height: 33.v),
                    Text("msg_take_the_sat_or".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles
                            .titleMediumPrimaryMedium
                            .copyWith(height: 1.23)),
                    SizedBox(height: 22.v),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("msg_enter_your_sat_or".tr,
                            style: theme.textTheme.bodyMedium)),
                    SizedBox(height: 8.v),
                    CustomTextFormField(
                        controller: controller.scoreEditTextController,
                        hintText: "lbl_score".tr),
                    SizedBox(height: 22.v),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text("msg_write_the_name_s".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(height: 1.60)),
                    ),
                    SizedBox(height: 5.v),
                    CustomTextFormField(
                        controller: controller.nameEditTextController,
                        hintText: "msg_enter_college_names".tr,
                        textInputAction: TextInputAction.done,
                        validator:Validator.notEmpty),
                    Spacer(),
                    _buttonRow(),
                    SizedBox(height: 30.v),


                  ]),
            )));
  }


  /// Section Widget
  Widget _activityRow() {
    return Row(children: [
      Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text("lbl_activity".tr,
              style: CustomTextStyles.titleSmallRobotoBlack90001)),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("lbl_4_of_5".tr, style: theme.textTheme.titleMedium)),
      Spacer(),
      Padding(
          padding: EdgeInsets.only(top: 3.v),
          child: Text("lbl_earn_25_points".tr,
              style: CustomTextStyles.titleSmallRobotoBlack90001)),
      CustomImageView(
          imagePath: ImageConstant.imgClose,
          height: 22.adaptSize,
          width: 22.adaptSize,
          margin: EdgeInsets.only(left: 10.h))
    ]);
  }



  /// Section Widget
  Widget _buildDoItLaterButton() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_do_it_later".tr,
            margin: EdgeInsets.only(right: 12.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12));
  }

  /// Section Widget
  Widget _buildMarkAsDoneButton() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_mark_as_done".tr,
            margin: EdgeInsets.only(left: 12.h),
            onPressed: () {

              // onTapMarkAsDoneButton();
            }));
  }

  /// Section Widget
  Widget _buttonRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildDoItLaterButton(), _buildMarkAsDoneButton()]);
  }

  /// Navigates to the submitApplicationsTabContainerScreen when the action is triggered.
  onTapMarkAsDoneButton() {
    Get.toNamed(
      AppRoutes.submitApplicationsTabContainerScreen,
    );
  }
}
