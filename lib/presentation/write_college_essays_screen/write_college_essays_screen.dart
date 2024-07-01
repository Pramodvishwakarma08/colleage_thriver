import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import 'controller/write_college_essays_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

import 'package:colleage_thriver/widgets/custom_drop_down.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class WriteCollegeEssaysScreen extends GetWidget<WriteCollegeEssaysController> {
  const WriteCollegeEssaysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_write_college_essays"),
        body: Padding(
          padding:  EdgeInsets.only(left: 20.0.h,right: 20.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _activityRow(),
            SizedBox(height: 33.v),
            Text("msg_begin_working_on".tr,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumPrimaryMedium
                    .copyWith(height: 1.23)),
            SizedBox(height: 20.v),
            Padding(
              padding:  EdgeInsets.only(left: 10.0.h),
              child: Text("msg_have_your_mentor".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(height: 1.60)),
            ),
            SizedBox(height: 15.v),
            CustomDropDown(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.arrow_drop_down),
                ),
                hintText: "msg_waiting_for_feedback".tr,
                items: controller.writeCollegeEssaysModelObj.value
                    .dropdownItemList.value,
                onChanged: (value) {
                  controller.onSelected(value);
                }),
            Spacer(),
            SizedBox(height: 54.v),
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
          child: Text("lbl_2_of_5".tr, style: theme.textTheme.titleMedium)),
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

  /// Navigates to the askForRecommendationsScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.askForRecommendationsScreen,
    );
  }
}
