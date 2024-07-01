import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import 'controller/join_extracurriculars_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class JoinExtracurricularsScreen
    extends GetWidget<JoinExtracurricularsController> {
  const JoinExtracurricularsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppbar(title: "msg_join_extracurriculars".tr),
        body: Padding(
          padding:  EdgeInsets.only(right: 20.0.h,left: 20.h),
          child: Column(children: [
           _activityRow(),
            SizedBox(height: 33.v),
            Text("msg_joining_extracurricular".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumPrimaryMedium
                    .copyWith(height: 1.23)),
            SizedBox(height: 20.v),
            Padding(
              padding:  EdgeInsets.only(left: 10.0),
              child: Text("msg_list_three_extracurricular".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(height: 1.60)),
            ),
            SizedBox(height: 15.v),
            CustomTextFormField(
                controller: controller.enteractivitiesController,
                hintText: "msg_enter_activities".tr,
                textInputAction: TextInputAction.done),
            Spacer(),
            SizedBox(height: 62.v),
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
          child: Text("lbl_6_of_8".tr, style: theme.textTheme.titleMedium)),
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
  Widget _buttonRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    ]);
  }

  /// Navigates to the exploreAdvancedClassesScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.exploreAdvancedClassesScreen,
    );
  }
}
