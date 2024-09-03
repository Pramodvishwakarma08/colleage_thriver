import 'controller/slider_from_bottom_for_album_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_icon_button.dart';

class SliderFromBottomForAlbumScreen
    extends GetWidget<SliderFromBottomForAlbumController> {
  const SliderFromBottomForAlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 23.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame();
                          },
                          child: Row(children: [
                            CustomIconButton(
                                height: 38.adaptSize,
                                width: 38.adaptSize,
                                padding: EdgeInsets.all(5.h),
                                decoration: IconButtonStyleHelper.fillGrayTL19,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgEdit38x38)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.h, top: 10.v, bottom: 7.v),
                                child: Text("lbl_your_roadmap".tr,
                                    style: CustomTextStyles
                                        .bodyLargeInterBlack90001_1))
                          ])),
                      SizedBox(height: 22.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame1();
                          },
                          child: Row(children: [
                            CustomIconButton(
                                height: 38.adaptSize,
                                width: 38.adaptSize,
                                padding: EdgeInsets.all(10.h),
                                decoration: IconButtonStyleHelper.fillGrayTL19,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgEdit)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.h, top: 9.v, bottom: 8.v),
                                child: Text("lbl_edit_account".tr,
                                    style: CustomTextStyles
                                        .bodyLargeInterBlack90001_1))
                          ])),
                      SizedBox(height: 22.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame2();
                          },
                          child: Row(children: [
                            CustomIconButton(
                                height: 38.adaptSize,
                                width: 38.adaptSize,
                                padding: EdgeInsets.all(11.h),
                                decoration: IconButtonStyleHelper.fillGrayTL19,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgUser)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.h, top: 9.v, bottom: 8.v),
                                child: Text("lbl_edit_photo".tr,
                                    style: CustomTextStyles
                                        .bodyLargeInterBlack90001_1))
                          ])),
                      SizedBox(height: 22.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame3();
                          },
                          child: Row(children: [
                            CustomIconButton(
                                height: 38.adaptSize,
                                width: 38.adaptSize,
                                padding: EdgeInsets.all(7.h),
                                decoration: IconButtonStyleHelper.fillGrayTL19,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgSettings)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.h, top: 10.v, bottom: 7.v),
                                child: Text("lbl_logout".tr,
                                    style: CustomTextStyles
                                        .bodyLargeInterBlack90001_1))
                          ]))
                    ]))));
  }

  /// Navigates to the yourRoadmapToCollegeScreen when the action is triggered.
  onTapFrame() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }

  /// Navigates to the tellUsAboutYourSchoolScreen when the action is triggered.
  onTapFrame1() {
    Get.toNamed(
      AppRoutes.tellUsAboutYourSchoolScreen,
    );
  }

  /// Navigates to the tellUsAboutYourselfScreen when the action is triggered.
  onTapFrame2() {
    Get.toNamed(
      AppRoutes.tellUsAboutYourselfScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapFrame3() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
