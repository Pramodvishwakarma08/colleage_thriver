// ignore_for_file: must_be_immutable

import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../search/models/CollegeDetailListModel.dart';
import 'controller/comparison_controller.dart';
import 'package:flutter/material.dart';

class ComparisonScreen extends GetWidget<ComparisonController> {
  ComparisonScreen({Key? key, required this.firstClg, required this.secondClg}) : super(key: key,);

  Message? firstClg;
   Message? secondClg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "Comparison"),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .03,
              vertical: 10.v),
          child: ListView(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * .47,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18.v),
                          CustomImageView(
                              imagePath: firstClg!.photo!,
                              height: 90.v,
                              width: 171.h,
                              fit: BoxFit.cover,
                              radius: BorderRadius.circular(15.h),
                              margin: EdgeInsets.only(left: 6.h)),
                          SizedBox(height: 18.v),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(firstClg!.instnm.toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLarge22
                                    .copyWith(height: 1.09, fontSize: 12.0)),
                          ),
                          SizedBox(height: 5.v,),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(firstClg!.city.toString(),
                                style: CustomTextStyles.bodyLargeInterGray600
                                    .copyWith(fontSize: 14.0.adaptSize)),
                          ),
                          SizedBox(height: 23.v),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: _CardColumn1(),
                          ),
                          SizedBox(height: 21.v),
                          _financialsSection1(),
                          // SizedBox(height: 20.v),
                          // Text("lbl_financials".tr, style: CustomTextStyles.titleLargeRobotoBold),
                          // SizedBox(height: 3.v),
                          // Text("msg_https_www_uab_edu".tr, style: CustomTextStyles.titleMediumBlack90001Medium16),
                          // SizedBox(height: 20.v),
                          // CustomElevatedButton(
                          //     text: "lbl_save".tr,
                          //     margin: EdgeInsets.only(left: 28.h, right: 28.h, bottom: 37.v))
                        ],
                      ),
                    ],
                  ),
                ),

              // second section

                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * .47,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18.v),
                          CustomImageView(
                              imagePath: secondClg!.photo!,
                              height: 90.v,
                              width: 171.h,
                              fit: BoxFit.cover,
                              radius: BorderRadius.circular(15.h),
                              margin: EdgeInsets.only(left: 6.h)),
                          SizedBox(height: 18.v),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(secondClg!.instnm.toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLarge22
                                    .copyWith(height: 1.09, fontSize: 12.0)),
                          ),

                          SizedBox(height: 5.v,),

                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(secondClg!.city.toString(),
                                style: CustomTextStyles.bodyLargeInterGray600
                                    .copyWith(fontSize: 14.0.adaptSize)),
                          ),
                          SizedBox(height: 23.v),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: _CardColumn2(),
                          ),
                          SizedBox(height: 21.v),
                          _financialsSection2(),

                          // SizedBox(height: 20.v),
                          // Text("lbl_financials".tr, style: CustomTextStyles.titleLargeRobotoBold),
                          // SizedBox(height: 3.v),
                          // Text("msg_https_www_uab_edu".tr, style: CustomTextStyles.titleMediumBlack90001Medium16),
                          // SizedBox(height: 20.v),
                          // CustomElevatedButton(
                          //     text: "lbl_save".tr,
                          //     margin: EdgeInsets.only(left: 28.h, right: 28.h, bottom: 37.v))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 21.v),
            CustomElevatedButton(
              // isLoading: controller.isLoading.value,
              text: "Done".tr,
              onPressed: () {
                Get.offAllNamed(AppRoutes.homeScreen);
              },
            ),
          ])),
    );
  }

  /// Section Widget
  Widget _CardColumn1() {
    return Column(
      children: [
        cardDatials(
            imagePath: ImageConstant.imgImage1624,
            name: 'Acceptance -',
            value: '${firstClg?.actcmmid}%'),
        cardDatials(
            imagePath: ImageConstant.imgThumbsUp,
            name: 'Average GPA -',
            value: '${firstClg?.gpa}'),
        cardDatials(
            imagePath: ImageConstant.imgThumbsUpWhiteA700,
            name: 'Average SAT -',
            value: '${firstClg?.satAvg}'),
        cardDatials(
            imagePath: ImageConstant.imgThumbsUp,
            name: 'Average ACT -',
            value: '${firstClg?.actcmmid}'),
      ],
    );
  }
  Widget _CardColumn2() {
    return Column(
      children: [
        cardDatials(
            imagePath: ImageConstant.imgImage1624,
            name: 'Acceptance -',
            value: '${secondClg?.actcmmid}%'),
        cardDatials(
            imagePath: ImageConstant.imgThumbsUp,
            name: 'Average GPA -',
            value: '${secondClg?.gpa}'),
        cardDatials(
            imagePath: ImageConstant.imgThumbsUpWhiteA700,
            name: 'Average SAT -',
            value: '${secondClg?.satAvg}'),
        cardDatials(
            imagePath: ImageConstant.imgThumbsUp,
            name: 'Average ACT -',
            value: '${secondClg?.actcmmid}'),
      ],
    );
  }

  Widget cardDatials({
    required String imagePath,
    required String name,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.h,
          vertical: 11.v,
        ),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: 18.v,
              width: 19.h,
              color: Colors.white70,
            ),
            Opacity(
              opacity: 0.7,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.h,
                  top: 2.v,
                ),
                child: Text(
                  name,
                  style: CustomTextStyles.labelLargeRobotoWhiteA700,
                ),
              ),
            ),
            Opacity(
              opacity: 0.7,
              child: Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Text(
                  value,
                  style: CustomTextStyles.titleSmallRobotoWhiteA700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _financialsSection1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.v),
        Text("msg_in_state_tuition".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: Colors.black54)),
        Text("${firstClg?.tuitionfeeIn}".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: appTheme.black90001)),
        SizedBox(height: 10.v),
        Text("msg_out_of_state_tuition".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: Colors.black54)),
        Text("${firstClg?.tuitionfeeOut}".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: appTheme.black90001)),
        SizedBox(height: 10.v),
        Text("msg_average_total_cost".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: Colors.black54)),
        Text("${firstClg?.costt4A}".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: appTheme.black90001)),
        SizedBox(height: 10.v),
      ],
    );
  }
  Widget _financialsSection2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.v),
        Text("msg_in_state_tuition".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: Colors.black54)),
        Text("${secondClg?.tuitionfeeIn}".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: appTheme.black90001)),
        SizedBox(height: 10.v),
        Text("msg_out_of_state_tuition".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: Colors.black54)),
        Text("${secondClg?.tuitionfeeOut}".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: appTheme.black90001)),
        SizedBox(height: 10.v),
        Text("msg_average_total_cost".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: Colors.black54)),
        Text("${secondClg?.costt4A}".tr,
            style: CustomTextStyles.titleMediumBlack90001Medium16
                .copyWith(color: appTheme.black90001)),
        SizedBox(height: 10.v),
      ],
    );
  }
}
