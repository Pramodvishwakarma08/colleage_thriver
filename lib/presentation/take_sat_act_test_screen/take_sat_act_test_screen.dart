import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import 'controller/take_sat_act_test_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class TakeSatActTestScreen extends GetWidget<TakeSatActTestController> {
  const TakeSatActTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_take_sat_act_test".tr),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.v),
            child: Column(children: [
              _activityRow(),
              SizedBox(height: 33.v),
              Text("msg_resister_for_the".tr,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumPrimaryMedium
                      .copyWith(height: 1.23)),
              SizedBox(height: 18.v),
              _prepareForActButton(),
              SizedBox(height: 17.v),
              Padding(
                padding: EdgeInsets.only(left: 10.0.h),
                child: Text("msg_once_you_hove_registered".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(height: 1.60)),
              ),
              SizedBox(height: 14.v),
              _uploadRow(),
              Spacer(),
              SizedBox(height: 57.v),
              _buttonRow(),
              SizedBox(height: 30.v),
            ])));
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
          child: Text("lbl_8_of_8".tr, style: theme.textTheme.titleMedium)),
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
  Widget _prepareForActButton() {
    return CustomElevatedButton(
        height: 48.v,
        width: 157.h,
        text: "lbl_prepare_for_act".tr,
        margin: EdgeInsets.only(left: 8.h),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.titleSmallBlack90001_1,
        alignment: Alignment.centerLeft);
  }

  /// Section Widget
  Widget _buildPngJpgButton() {
    return CustomElevatedButton(
        width: 124.h,
        text: "lbl_png_jpg".tr,
        buttonStyle: CustomButtonStyles.fillGray,
        buttonTextStyle: CustomTextStyles.bodyLargeInterBlack90001);
  }

  /// Section Widget
  Widget _uploadRow() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 7.h),
        decoration: AppDecoration.outlineGray60003
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(left: 12.h, top: 12.v, bottom: 9.v),
              child: Text("lbl_upload_files".tr,
                  style: CustomTextStyles.bodyLargeInterWhiteA700)),
          _buildPngJpgButton()
        ]));
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
        //      onTapMarkAsDoneButton();
            }));
  }

  /// Section Widget
  Widget _buttonRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildDoItLaterButton(), _buildMarkAsDoneButton()]);
  }

  /// Navigates to the createCollegeChecklistScreen when the action is triggered.
  onTapMarkAsDoneButton() {
    Get.toNamed(
      AppRoutes.createCollegeChecklistScreen,
    );
  }
}
