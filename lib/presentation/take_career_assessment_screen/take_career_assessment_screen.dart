import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/take_career_assessment_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class TakeCareerAssessmentScreen extends GetWidget<TakeCareerAssessmentController> {
  const TakeCareerAssessmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppbar(title: "msg_take_career_assessment".tr),
        body: Padding(
          padding:  EdgeInsets.only(left: 20.0.h,right: 20.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 _activity(),
                  SizedBox(height: 33.v),
                  Text("msg_figure_out_what".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMediumPrimaryMedium
                          .copyWith(height: 1.23)),
                  SizedBox(height: 18.v),
                 Center(child: _takeCareerQuizButton()),
                  SizedBox(height: 24.v),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text("msg_enter_your_personality".tr,
                          style: theme.textTheme.bodyMedium)),
                  SizedBox(height: 8.v),
                  CustomTextFormField(
                     controller: controller.enterResultsValueEditTextController,
                     hintText: "lbl_enter_results".tr,
                     textInputAction: TextInputAction.done),
                  Spacer(),
                  SizedBox(height: 61.v),
                 _buttonRow(),
                  SizedBox(height: 30.v),

              ]),
        ));
  }


  /// Section Widget
  Widget _activity() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text("lbl_activity".tr,
              style: CustomTextStyles.titleSmallRobotoBlack90001)),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("lbl_3_of_8".tr, style: theme.textTheme.titleMedium)),
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
  Widget _takeCareerQuizButton() {
    return CustomElevatedButton(
        height: 48.v,
        width: 206.h,
        text: "msg_take_career_quiz".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
             color: Colors.black,
                imagePath: ImageConstant.imgBag, height: 30.v, width: 32.h)),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.titleSmallBlack90001_1);
  }

  /// Section Widget

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

  /// Navigates to the meetCounselorOrAdvisorScreen when the action is triggered.
  // onTapMarkAsDoneButton() {
  //   Get.toNamed(
  //     AppRoutes.meetCounselorOrAdvisorScreen,
  //   );
  // }
}
