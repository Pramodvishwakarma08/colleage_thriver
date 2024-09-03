import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import 'controller/choose_potential_majors_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

class ChoosePotentialMajorsScreen extends GetWidget<ChoosePotentialMajorsController> {
  const ChoosePotentialMajorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppbar(title: "msg_choose_potential".tr),
        body: Padding(
          padding:  EdgeInsets.only(left: 20.0.h,right: 20.h),
          child: Column(children: [
           _activityRow(),
            SizedBox(height: 33.v),
            Text("msg_your_major_is_the".tr,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumPrimaryMedium
                    .copyWith(height: 1.23)),
            SizedBox(height: 22.v),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text("msg_list_two_potential".tr,
                        style: theme.textTheme.bodyMedium))),
            SizedBox(height: 10.v),
            CustomTextFormField(
                controller: controller.enterpotentialmajorsController,
                hintText: "msg_enter_potential".tr,
                textInputAction: TextInputAction.done),
            Spacer(),
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
          child: Text("lbl_5_of_8".tr, style: theme.textTheme.titleMedium)),
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

  /// Navigates to the joinExtracurricularsScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.joinExtracurricularsScreen,
    );
  }
}
