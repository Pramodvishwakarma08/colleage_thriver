import 'package:colleage_thriver/core/utils/textfield_validation.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/get_your_college_matches_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_checkbox_button.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';



//3rdScreen


class GetYourCollegeMatchesTwoScreen extends GetWidget<GetYourCollegeMatchesTwoController> {
   GetYourCollegeMatchesTwoScreen({Key? key}) : super(key: key);
  final _formKeyLogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppbar(title: "msg_get_your_college".tr),
        body: Form(
     key: _formKeyLogin,
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.h,),
              child:  SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Obx(
                  ()=> controller.isLoadingCollegeGetMatchOne.value ? Center(child: CircularProgressIndicator(strokeWidth: 2,)): Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    _activityRow(),
                    SizedBox(height: 7.v),
                    _progressRow(),
                    SizedBox(height: 20.v),
                    //msg_answer_a_few_short
                    Text("msg_answer_a_few_short".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleMediumPrimaryMedium
                            .copyWith(height: 1.23)),
                    SizedBox(height: 22.v),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0.h),
                      child: Text("msg_what_major_s_are".tr,
                          style: theme.textTheme.bodyMedium),
                    ),
                    SizedBox(height: 8.v),

                    // CustomTextFormField msg_planned_major_s
                    CustomTextFormField(
                      validator: Validator.notEmpty,
                        controller: controller.plannedMajorsController,
                        hintText: "msg_planned_major_s".tr),

                    SizedBox(height: 17.v),
                    //msg_what_type_of_social
                    Padding(
                      padding: EdgeInsets.only(left: 10.0.h),
                      child: Text("msg_what_type_of_social".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium!.copyWith(height: 1.60)),
                    ),

                    SizedBox(height: 5.v),
                    // CustomTextFormField  ==> msg_frat_sororities
                    CustomTextFormField(
                        validator: Validator.notEmpty,
                        controller: controller.fratSororitiesClubsSportsController,
                        hintText: "msg_frat_sororities".tr),
                    SizedBox(height: 19.v),

                    //text field end
                    //checkbox start

                    // Text msg_what_type_of_program
                    Padding(
                      padding: EdgeInsets.only(left: 10.0.h),
                      child: Text("msg_what_type_of_program".tr,
                          style: theme.textTheme.bodyMedium),
                    ),
                    SizedBox(height: 8.v),
                    _checkboxListWidget(),
                    SizedBox(height: 115.v),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_buildBackButton(), _buildNextButton()]),
                        SizedBox(height: 30.v,),


                      ]),
                ),
              )),
        ));
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
          child: Text("lbl_3_of_4".tr, style: theme.textTheme.titleMedium)),
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
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(3.h))),
      Container(
          height: 6.v,
          width: 75.h,
          decoration: BoxDecoration(
              color: appTheme.blueGray100,
              borderRadius: BorderRadius.circular(3.h)))
    ]);
  }

  Widget _checkboxListWidget() {
    return Column(children: [
      Obx(
        ()=> CustomCheckboxButton(
            text: "msg_private_university".tr,
            value: controller.privateUniversity.value,
            padding: EdgeInsets.symmetric(vertical: 7.v),
            onChange: (value) {
              controller.privateUniversity.value = value;
            }),
      ),
      Obx(
            ()=>CustomCheckboxButton(
            text: "lbl_state_school".tr,
            value: controller.stateSchool.value,
            padding: EdgeInsets.symmetric(vertical: 8.v),
            onChange: (value) {
              controller.stateSchool.value = value;
            }),
      ),
      Obx(
            ()=> CustomCheckboxButton(
            text: "msg_two_year_community".tr,
            value: controller.twoYearCommunity.value,
            padding: EdgeInsets.symmetric(vertical: 7.v),
            onChange: (value) {
              controller.twoYearCommunity.value = value;
            }),
      ),
      Obx(
            ()=> CustomCheckboxButton(
            text: "lbl_trade_school".tr,
            value: controller.tradeSchool.value,
            padding: EdgeInsets.symmetric(vertical: 8.v),
            onChange: (value) {
              controller.tradeSchool.value = value;
            }),
      )
    ]);
  }

  Widget _buildBackButton() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_back".tr,
            margin: EdgeInsets.only(right: 12.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12,
            onPressed: () {
              onTapBackButton();
            }));
  }

  /// Section Widget
  Widget _buildNextButton() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_next".tr,
            margin: EdgeInsets.only(left: 12.h),
            onPressed: () {
              if (_formKeyLogin.currentState!.validate()) {
                print('Email:');
                print('Password');
                controller.updateCollegeMatchesTwo();
              }else{

              }

            }));
  }

  /// Section Widget

  /// Navigates to the getYourCollegeMatchesThreeScreen when the action is triggered.
  onTapBackButton() {
    Get.toNamed(
      AppRoutes.getYourCollegeMatchesThreeScreen,
    );
  }

}
