// ignore_for_file: must_be_immutable, unused_import

import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';
import 'package:colleage_thriver/widgets/my_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/textfield_validation.dart';
import '../../../widgets/custom_dropdown/customDropdownTextField.dart';
import 'controller/get_your_college_matches_three_controller.dart';

class GetYourCollegeMatchesThreeScreen
    extends GetWidget<GetYourCollegeMatchesThreeController> {
  GetYourCollegeMatchesThreeScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: myAppbar(title: "msg_get_your_college".tr),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                statusBarHeight,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0.h, right: 20.h),
              child: Form(
                key: _formKey,
                child: Obx(
                  () => controller.isLoadingCollegeGetMatchOne.value
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              _activityRow(),
                              SizedBox(height: 7.v),
                              _progressRow(),
                              SizedBox(height: 20.v),
                              Text("msg_answer_a_few_short".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .titleMediumPrimaryMedium
                                      .copyWith(height: 1.23)),
                              SizedBox(height: 22.v),
                              Text("  " + "msg_where_do_you_want".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 8.v),
                              _dropdwounWhereDoYouWantToAttendCollege(),
                              SizedBox(height: 19.v),
                              Text("  "+"msg_what_is_your_current".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 8.v),
                              CustomTextFormField(
                                  validator: Validator.notEmpty,
                                  textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                                  controller: controller.SATcontroller,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                                  ],
                                  hintText: "msg_overall_sat_score".tr),
                              SizedBox(height: 19.v),
                              Text("  "+"msg_what_is_your_current2".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 8.v),
                              CustomTextFormField(
                                  validator: Validator.notEmpty,
                                  textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                                  controller: controller.ACTcontroller,
                                  hintText: "msg_overall_act_score".tr,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                                  ],
                                  textInputAction: TextInputAction.done),





                              // SizedBox(height: 16.v),
                              // Padding(
                              //     padding: EdgeInsets.only(left: 11.h),
                              //     child: Text("msg_what_is_your_current3".tr,
                              //         style: CustomTextStyles
                              //             .titleSmallRobotoPrimary)),
                              Spacer(),
                              Row(
                                children: [_backButton(), _nextButton()],
                              ),
                              SizedBox(height: 30.v),
                            ]),
                ),
              ),
            ),
          ),
        ));
  }

  /// _activityRow Widget
  Widget _activityRow() {
    return Row(children: [
      Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text("lbl_activity".tr,
              style: CustomTextStyles.titleSmallRobotoBlack90001)),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("lbl_2_of_4".tr, style: theme.textTheme.titleMedium)),
      Spacer(),
      Padding(
          padding: EdgeInsets.only(top: 3.v),
          child: Text("lbl_earn_100_points".tr,
              style: CustomTextStyles.titleSmallRobotoBlack90001)),
      CustomImageView(
          imagePath: ImageConstant.imgClose,
          height: 22.adaptSize,
          width: 22.adaptSize,
          margin: EdgeInsets.only(left: 10.h))
    ]);
  }

  /// Section Widget
  Widget _progressRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          height: 6.v,
          width: 75.h,
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(3.h))),
      Container(
          height: 6.v,
          width: 75.h,
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(3.h))),
      Container(
          height: 6.v,
          width: 75.h,
          decoration: BoxDecoration(
              color: appTheme.blueGray100,
              borderRadius: BorderRadius.circular(3.h))),
      Container(
          height: 6.v,
          width: 75.h,
          decoration: BoxDecoration(
              color: appTheme.blueGray100,
              borderRadius: BorderRadius.circular(3.h)))
    ]);
  }

  /// Section Widget
  Widget _backButton() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_back".tr,
            margin: EdgeInsets.only(right: 12.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12,
            onPressed: () {
              onTapBackButton();
            }));
  }

  onTapBackButton() {
    Get.toNamed(
      AppRoutes.getYourCollegeMatchesScreen,
    );
  }


  /// Section Widget
  Widget _nextButton() {
    return Expanded(
        child: Obx(
      () => CustomElevatedButton(
        isLoading: controller.isLoadingUpdateCollegeMatchOne.value,
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 12.h),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.updateCollegeMatchesTwo();
          }
        },
      ),
    ));
  }

  Widget _dropdwounWhereDoYouWantToAttendCollege() {
    print(
        "${"whereDoYouWantToAttendCollegeValue${controller.whereDoYouWantToAttendCollegeValue}"}");
    return CustomDropdownTextField(
      hintText: "Select city",
      selectedItem: controller.whereDoYouWantToAttendCollegeValue,
      dropdownItemsList: controller.whereDoYouWantToAttendCollegeList1,
      onSelect: (String? p0) {
        controller.whereDoYouWantToAttendCollegeValue = p0;
        print(
            "ffdfjkdgjkdfgjkdfgjkldfg${controller.whereDoYouWantToAttendCollegeValue}");
        print("pO$p0");
      },
    );
  }
}
