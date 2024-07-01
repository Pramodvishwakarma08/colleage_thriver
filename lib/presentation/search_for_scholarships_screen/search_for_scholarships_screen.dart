import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller/search_for_scholarships_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class SearchForScholarshipsScreen extends GetWidget<SearchForScholarshipsController> {
  const SearchForScholarshipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_search_for_scholarships".tr),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 _activityRow(),
                  SizedBox(height: 33.v),
                  Text("msg_begin_researching".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMediumPrimaryMedium
                          .copyWith(height: 1.23)),
                  SizedBox(height: 18.v),
                  CustomElevatedButton(
                      height: 48.v,
                      width: 132.h,
                      text: "lbl_view_options".tr,
                      onPressed:
                       () {
                         _launchURL();
                       },
                      margin: EdgeInsets.only(left: 8.h),
                      buttonStyle: CustomButtonStyles.outlineBlack,
                      buttonTextStyle:
                          CustomTextStyles.titleSmallBlack90001_1),
                  Spacer(),
                  _buttonRow(),
                 SizedBox(height: 30.v),

                ])));
  }

  _launchURL() async {
    const url = 'https://www.careeronestop.org/toolkit/training/find-scholarships.aspx?sortcolumns=BestMatch';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  /// Section Widget
  Widget _activityRow() {
    return Row(children: [
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
  Widget _buttonRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
              onPressed: () {
                onTapBack();
              },
              text: "lbl_do_it_later".tr,
              margin: EdgeInsets.only(right: 12.h),

              buttonStyle: CustomButtonStyles.fillYellowTL12)),
      Expanded(
          child: CustomElevatedButton(
              text: "lbl_mark_as_done".tr,
              margin: EdgeInsets.only(left: 12.h),
              onPressed: () {
                Get.back();
                // onTapMarkAsDone();
              }))
    ]);
  }


  onTapBack() {
    Get.toNamed(
      AppRoutes.findScholarshipsScreen,
    );
  }

  /// Navigates to the createAShortlistScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.createAShortlistScreen,
    );
  }
}
