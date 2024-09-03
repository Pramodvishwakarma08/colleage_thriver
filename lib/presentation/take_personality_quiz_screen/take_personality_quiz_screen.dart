import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import 'controller/take_personality_quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class TakePersonalityQuizScreen
    extends GetWidget<TakePersonalityQuizController> {
  const TakePersonalityQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppbar(title: "msg_take_personality".tr),
        body: Padding(
          padding:  EdgeInsets.only(left: 20.0.h,right: 20.h),
          child: Column(children: [
           _activityRow(),
            SizedBox(height: 33.v),
            Text("msg_discover_your_strengths".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumPrimaryMedium
                    .copyWith(height: 1.23)),
            SizedBox(height: 22.v),
           _takeTheQuizButton(),
            SizedBox(height: 24.v),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 19.h),
                    child: Text("msg_enter_your_personality".tr,
                        style: theme.textTheme.bodyMedium))),
            SizedBox(height: 8.v),
           _enterResultsTextField(),
            Spacer(),
            SizedBox(height: 61.v),
           _buttonRow(),
           SizedBox(height: 30.v),

          ]),
        ));
  }


  /// Section Widget
  Widget _activityRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text("lbl_activity".tr,
              style: CustomTextStyles.titleSmallRobotoBlack90001)),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("lbl_2_of_8".tr, style: theme.textTheme.titleMedium)),
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
//1m prove your chances
// of getting into college
  /// Section Widget
  Widget _takeTheQuizButton() {
    return CustomElevatedButton(
        height: 48.v,
        width: 180.h,
        text: "lbl_take_the_quiz".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgProfile,
                color: Colors.black ,
                height: 30.v,
                width: 36.h)),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.titleSmallBlack90001_1);
  }

  /// Section Widget
  Widget _enterResultsTextField() {
    return CustomTextFormField(
        controller: controller.enterResultsController,
        hintText: "lbl_enter_results".tr,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildDoItLater() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_do_it_later".tr,
            margin: EdgeInsets.only(right: 12.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12));
  }

  /// Section Widget
  Widget _buildMarkAsDone() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_mark_as_done".tr,
            margin: EdgeInsets.only(left: 12.h),
            onPressed: () {
              // onTapMarkAsDone();
            }));
  }

  /// Section Widget
  Widget _buttonRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildDoItLater(), _buildMarkAsDone()]);
  }

  /// Navigates to the takeCareerAssessmentScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.takeCareerAssessmentScreen,
    );
  }
}
