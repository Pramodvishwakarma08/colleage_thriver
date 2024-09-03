import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import 'controller/meet_counselor_or_advisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class MeetCounselorOrAdvisorScreen extends GetWidget<MeetCounselorOrAdvisorController> {
  const MeetCounselorOrAdvisorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: myAppbar(title: "msg_meet_counselor_or"),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:  EdgeInsets.only(left: 20.0.h,right: 20.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(height: 5.v),
           _activityRow(),
            SizedBox(height: 33.v),
            Text("msg_talk_to_your_counselor".tr,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumPrimaryMedium
                    .copyWith(height: 1.23)),
            SizedBox(height: 32.v),
            Text("msg_set_a_goal_based".tr, style: theme.textTheme.bodyMedium),
            SizedBox(height: 8.v),
            CustomTextFormField(controller: controller.enterCollegeOrCareerGoalController,
                hintText: "msg_enter_college_or".tr,
                textInputAction: TextInputAction.done),
            Spacer(),
            SizedBox(height: 25.v),
            _buttionRow(),
            SizedBox(height: 30.v),
          ]),
        ));
  }


  /// Section Widget
  Widget _activityRow() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Text("lbl_activity".tr,
                  style: CustomTextStyles.titleSmallRobotoBlack90001)),
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text("lbl_4_of_8".tr, style: theme.textTheme.titleMedium)),
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
        ]));
  }

  /// Section Widget
  Widget _buttionRow() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  text: "lbl_do_it_later".tr,
                  margin: EdgeInsets.only(right: 12.h),
                  buttonStyle: CustomButtonStyles.fillYellowTL12)),
          Expanded(
              child: CustomElevatedButton(
                  text: "lbl_mark_as_done".tr,
                  margin: EdgeInsets.only(left: 12.h),
                  onPressed: () {
                    // onTapMarkAsDone();
                  }))
        ]));
  }

  /// Navigates to the choosePotentialMajorsScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.choosePotentialMajorsScreen,
    );
  }
}
