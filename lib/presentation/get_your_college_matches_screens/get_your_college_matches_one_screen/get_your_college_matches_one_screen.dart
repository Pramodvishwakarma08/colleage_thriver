import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import '../../../core/utils/textfield_validation.dart';
import '../../../widgets/custom_dropdown/customDropdownTextField.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'controller/get_your_college_matches_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_checkbox_button.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class GetYourCollegeMatchesOneScreen extends GetWidget<GetYourCollegeMatchesOneController> {
   GetYourCollegeMatchesOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_get_your_college".tr),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 20.h,right: 20.h),
            child: Obx(
                ()=> controller.isLoadingCollegeGetMatchOne.value ? Center(child: CircularProgressIndicator(),) :  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   _activityRow(),
                   SizedBox(height: 10.v),
                   _progressRow(),
                    SizedBox(height: 20.v),
                    Text("msg_answer_a_few_short".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleMediumPrimaryMedium
                            .copyWith(height: 1.23)),
                    SizedBox(height: 22.v),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("msg_what_is_your_household".tr,
                            style: theme.textTheme.bodyMedium)),
                    SizedBox(height: 8.v),
                    CustomTextFormField(
                        controller: controller.householdincomeController,
                        hintText: "Enter your House Hold Income".tr,
                        validator: Validator.enterhouseHoldIncome,
                        textInputType: TextInputType.number,
                        hintStyle: CustomTextStyles.titleSmallBlack90001Medium),
                    // CustomDropDown(
                    //     hintText: "lbl_select_option2".tr,
                    //     alignment: Alignment.center,
                    //     items: controller.getYourCollegeMatchesOneModelObj.value.dropdownItemList!.value,
                    //     onChanged: (value) {
                    //       controller.onSelected(value);
                    //     }),
                    SizedBox(height: 19.v),
                    Padding(
                     padding: EdgeInsets.only(left: 10.h),
                      child: Text("msg_do_you_or_your_family".tr,
                          style: theme.textTheme.bodyMedium),
                    ),
                    SizedBox(height: 8.v),
                    // CustomDropDown(
                    //     hintText: "msg_select_affiliation".tr,
                    //     alignment: Alignment.center,
                    //     items: controller.getYourCollegeMatchesOneModelObj
                    //         .value.dropdownItemList1!.value,
                    //     onChanged: (value) {
                    //       controller.onSelected1(value);
                    //     }),
                    _dropdwounYearInSchool(),
                    SizedBox(height: 19.v),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text("msg_how_are_you_paying".tr,
                            style: theme.textTheme.bodyMedium)),
                    SizedBox(height: 20.v),
                   _checkBoxCloumn(),
                    Spacer(),
                    SizedBox(height: 58.v),
                   _buttonRow(),
                    SizedBox(height: 30.v),


                  ]),
            ),
          ),
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
        child: Text("lbl_4_of_4".tr, style: theme.textTheme.titleMedium)),
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

  Widget _checkBoxCloumn(){
   return Column(
    children: [
     Obx(
       ()=> CustomCheckboxButton(
           text: "lbl_gl_military".tr,
           value: controller.giMilitaryCheckBox.value,
           padding: EdgeInsets.symmetric(vertical: 8.v),
           onChange: (value) {
            controller.giMilitaryCheckBox.value = value;
           }),
     ),
       Obx(
          ()=> CustomCheckboxButton(
           text: "lbl_financial_aid".tr,
           value: controller.financialAidCheckBox.value,
           padding: EdgeInsets.symmetric(vertical: 8.v),
           onChange: (value) {
            controller.financialAidCheckBox.value = value;
           }),
     ),
     Obx(
          ()=> CustomCheckboxButton(
           text: "lbl_scholarship".tr,
           value: controller.scholarshipCheckBox.value,
           padding: EdgeInsets.symmetric(vertical: 7.v),
           onChange: (value) {
            controller.scholarshipCheckBox.value = value;
           }),
     ),
     Obx(
          ()=> CustomCheckboxButton(
           text: "lbl_tuition_plan".tr,
           value: controller.tuitionPlanCheckBox.value,
           padding: EdgeInsets.symmetric(vertical: 8.v),
           onChange: (value) {
            controller.tuitionPlanCheckBox.value = value;
           }),
     )    ],
   );
  }


  /// Section Widget
  Widget _buttonRow() {
    return Align(
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  text: "lbl_back".tr,
                  margin: EdgeInsets.only(right: 12.h),
                  buttonStyle: CustomButtonStyles.fillYellowTL12,
                  onPressed: () {
                    onTapBack();
                  })),
          Expanded(
              child: Obx(
                  ()=> CustomElevatedButton(
                  isLoading: controller.isLoadingUpdateCollegeMatchOne.value,
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        controller.updateCollegeMatchesFour();
                      }
                    // print("sdfg");
                   // controller.updateCollegeMatchesFour();
                    },
                    text: "lbl_mark_as_done".tr,
                    margin: EdgeInsets.only(left: 12.h)),
              ))
        ]));
  }




  Widget _dropdwounYearInSchool() {
    return CustomDropdownTextField(
      hintText: "Select city".tr,
     selectedItem: controller.AffilliationValue,
      dropdownItemsList:controller.AffilliationList, onSelect: (String? p0) {
      controller.AffilliationValue =p0;
      print("${ controller.AffilliationValue}");
      print("pO$p0");
    }, );
  }













  Widget _progressRow() {
   return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Container(
        height: 6.v,
        width: 75.h,
        decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(3.h))),  Container(
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
   ]);
  }


  /// Navigates to the getYourCollegeMatchesTwoScreen when the action is triggered.
  onTapBack() {
    Get.toNamed(
      AppRoutes.getYourCollegeMatchesTwoScreen,
    );
  }

}
