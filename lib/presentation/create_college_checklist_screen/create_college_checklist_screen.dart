import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import 'controller/create_college_checklist_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class CreateCollegeChecklistScreen extends GetWidget<CreateCollegeChecklistController> {
  const CreateCollegeChecklistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_create_college_checklist".tr),
        body: Padding(
          padding:  EdgeInsets.only(left: 20.0.h,right: 20.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           _activityRow(),
            SizedBox(height: 33.v),
            Text("msg_create_a_checklist".tr,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumPrimaryMedium
                    .copyWith(height: 1.23)),
            SizedBox(height: 22.v),
            Text("msg_upload_a_copy_of".tr,
                style: theme.textTheme.bodyMedium),
            SizedBox(height: 7.v),
               _uploadFilesRow(),
            Spacer(),
            SizedBox(height: 57.v),
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
          child: Text("lbl_1_of_5".tr, style: theme.textTheme.titleMedium)),
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
  Widget _uploadFilesRow() {
    return Container(
        decoration: AppDecoration.outlineGray60003
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(left: 12.h, top: 12.v, bottom: 9.v),
              child: Text("lbl_upload_files".tr,
                  style: CustomTextStyles.bodyLargeInterWhiteA700)),
          CustomElevatedButton(
              width: 124.h,
              text: "lbl_png_jpg".tr,
              buttonStyle: CustomButtonStyles.fillGray,
              buttonTextStyle: CustomTextStyles.bodyLargeInterBlack90001)
        ]));
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

  /// Navigates to the writeCollegeEssaysScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.writeCollegeEssaysScreen,
    );
  }
}
