import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/congratulations_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class CongratulationsScreen extends GetWidget<CongratulationsController> {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: ""),
        body: Stack(alignment: Alignment.topCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgUntitledDesign,
              height: 390.v,
              width: 376.h,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 77.v)),
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: 648.v,
                  width: double.maxFinite,
                  child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                            imagePath:
                                ImageConstant.imgHttpsLottief648x390,
                            height: 648.v,
                            width: 390.h,
                            alignment: Alignment.center),
                        _buildCongratulationsSection()
                      ]))),
          CustomElevatedButton(
              width: 289.h,
              text: "lbl_keep_exploring".tr,
              margin: EdgeInsets.only(bottom: 30.v),
              onPressed: () {
                onTapKEEPEXPLORING();
              },
              alignment: Alignment.bottomCenter)
        ]));
  }



  /// Section Widget
  Widget _buildCongratulationsSection() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 300.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("msg_congratulations".tr,
                  style: theme.textTheme.displayMedium),
              SizedBox(height: 59.v),
              SizedBox(
                  width: 214.h,
                  child: Text("msg_you_ve_made_it_to".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.titleLargeRobotoPrimary
                          .copyWith(height: 1.23)))
            ])));
  }

  /// Navigates to the yourRoadmapToCollegeScreen when the action is triggered.
  onTapKEEPEXPLORING() {
    Get.offAllNamed(
      AppRoutes.homeScreen,
    );
  }
}
