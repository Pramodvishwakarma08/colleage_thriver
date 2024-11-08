import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/core/utils/textfield_validation.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_dropdown/customDropdownTextField.dart';
import 'controller/get_your_college_matches_controller.dart';

// ignore_for_file: must_be_immutable

class GetYourCollegeMatchesScreen
    extends GetWidget<GetYourCollegeMatchesController> {
  GetYourCollegeMatchesScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_get_your_college".tr),
        body: Obx(
          () => controller.isLoadingCollegeGetMatchOne.value
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0.h, right: 15.h),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15.v),
                            Row(children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 4.v),
                                  child: Text("lbl_activity".tr,
                                      style: CustomTextStyles
                                          .titleSmallRobotoBlack90001)),
                              Padding(
                                  padding: EdgeInsets.only(left: 16.h),
                                  child: Text("lbl_1_of_4".tr,
                                      style: theme.textTheme.titleMedium)),
                              Spacer(),
                              Padding(
                                  padding: EdgeInsets.only(top: 3.v),
                                  child: Text("lbl_earn_100_points".tr,
                                      style: CustomTextStyles
                                          .titleSmallRobotoBlack90001)),
                              CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 22.adaptSize,
                                width: 22.adaptSize,
                              )
                            ]),
                            // SizedBox(height: 7.v),
                            // _buildOtpView(),
                            SizedBox(height: 15.v),

                            _progressRow(),
                            SizedBox(height: 20.v),
                            Text("msg_answer_a_few_short".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleMediumPrimaryMedium
                                    .copyWith(height: 1.23)),
                            SizedBox(height: 22.v),

                            //  text-fields

                            Text('  ' + "msg_are_you_a_first".tr,
                                style: theme.textTheme.bodyMedium),
                            SizedBox(height: 8.v),
                            _dropdwounFristGenColleageStudent(),

                            SizedBox(height: 19.v),
                            Text('  ' + "msg_what_is_your_address".tr,
                                style: theme.textTheme.bodyMedium),
                            SizedBox(height: 8.v),
                            CustomTextFormField(
                                controller: controller.addressController,
                                hintText: "Enter your address".tr,
                                validator: Validator.enterYourAddress,
                                hintStyle: CustomTextStyles
                                    .titleSmallBlack90001Medium),
                            SizedBox(height: 19.v),
                            Text('  ' + "lbl_city".tr,
                                style: theme.textTheme.bodyMedium),
                            SizedBox(height: 8.v),
                            CustomTextFormField(
                                controller: controller.cityController,
                                hintText: "Enter your city".tr,
                                validator: Validator.enterYourCity,
                                hintStyle: CustomTextStyles
                                    .titleSmallBlack90001Medium),
                            SizedBox(height: 18.v),
                            _buildCityStateRow(),
                            // text-field end
                            SizedBox(height: 19.v),
                            Text('  ' + "msg_when_do_you_plan".tr,
                                style: theme.textTheme.bodyMedium),
                            SizedBox(height: 8.v),
                            _dropdwounYearInSchool(),
                            // CustomDropDown(
                            //     hintText: "lbl_select_year".tr,
                            //     items: controller.getYourCollegeMatchesModelObj
                            //         .value.dropdownItemList1.value,
                            //     onChanged: (value) {
                            //       controller.onSelected1(value);
                            //     }),
                            SizedBox(height: 15.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    width: 294.h,
                                    margin: EdgeInsets.only(
                                        left: 11.h, right: 44.h),
                                    child: Text("msg_please_enter_state".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .titleSmallRobotoPrimary
                                            .copyWith(height: 1.23)))),
                            SizedBox(height: 30.v),
                            Row(
                              children: [_doItLaterButton(), _nextButton()],
                            ),
                          ]),
                    ),
                  )),
        ));
  }

  Widget _buildCityStateRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text("lbl_state".tr, style: theme.textTheme.bodyMedium)),
        SizedBox(height: 9.v),
        CustomTextFormField(
            width: 158.h,
            controller: controller.stateNameController,
            hintText: "Enter state name".tr,
            hintStyle: CustomTextStyles.titleSmallBlack90001Medium!,
            validator: Validator.enterYourState)
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text("lbl_zip_code".tr, style: theme.textTheme.bodyMedium)),
        SizedBox(height: 8.v),
        CustomTextFormField(
            width: 158.h,
            controller: controller.zipcodeController,
            hintText: "Enter zip code".tr,
            hintStyle: CustomTextStyles.titleSmallBlack90001Medium!,
            textInputType: TextInputType.number,

            validator: Validator.enterYourZipCode,
            textInputAction: TextInputAction.done)
      ])
    ]);
  }

  /// _doItLaterButton
  Widget _doItLaterButton() {
    return Expanded(
        child: CustomElevatedButton(
            onPressed: () {
              onTapBackButton();
            },
            text: "lbl_do_it_later".tr,
            margin: EdgeInsets.only(right: 12.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12));
  }

  onTapBackButton() {
    Get.toNamed(
      AppRoutes.chooseTheRightCollegeScreen,
    );
  }

  /// _nextButton
  Widget _nextButton() {
    return Expanded(
        child: Obx(
      () => CustomElevatedButton(
          isLoading: controller.isLoadingUpdateCollegeMatchOne.value,
          text: "lbl_next".tr,
          margin: EdgeInsets.only(left: 12.h),
          onPressed: () {
            //
            if (_formKey.currentState!.validate()) {
              controller.updateCollegeMatchOne();
              // Get.toNamed(
              //   AppRoutes.getYourCollegeMatchesThreeScreen,
              // );
            }
          }),
    ));
  }

  /// _progressRow Widget

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
              color: appTheme.blueGray100,
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

  Widget _dropdwounFristGenColleageStudent() {
    try {
      return CustomDropdownTextField(
        hintText: "Select".tr,
        selectedItem: controller.areYourFirstGenerationCollegeStudentValue,
        dropdownItemsList: controller.areYourFirstGenerationCollegeStudentList,
        onSelect: (String? p0) {
          controller.areYourFirstGenerationCollegeStudentValue = p0;
          print(
              "ffdfjkdgjkdfgjkdfgjkldfg${controller.areYourFirstGenerationCollegeStudentValue}");
          print("pO$p0");
        },
      );
    } catch (e) {
      return SizedBox.shrink();
    }
  }

  Widget _dropdwounYearInSchool() {
    return SizedBox(
      width: Get.width,
      height: 50.h,
      child: DropdownButtonFormField(
        // validator:Validator.validateDouble,
        value: controller.whenStartClg,
        items: controller.dropdownYearList.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        style: CustomTextStyles.titleSmallBlack90001Medium,
        onChanged: (value) {
          // Update the selected item when the user selects a new item
          controller.whenStartClg = value.toString();
          // print("praodfdfdfsdf${value}");
        },
        icon: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.red,
          ),
        ),
        decoration: decoration,
        hint: Text(
          "Select Year".tr,
          style: CustomTextStyles.titleSmallBlack90001Medium,
        ),
      ),
    );
  }

// Widget _dropdwounYearInSchool() {
//   return Obx(
//     ()=>controller.isLoadingCollegeGetMatchOne.value ? SizedBox(
//       width: Get.width,
//       height: 50.h,
//       child: DropdownButtonFormField(
//         // validator:Validator.validateDouble,
//         value:controller.areYourFirstGenerationCollegeStudentValue,
//         items:controller.areYourFirstGenerationCollegeStudentList.map((String item) {
//           return DropdownMenuItem(
//             value: item,
//             child: Text(item),
//           );
//         }).toList(),
//         style: CustomTextStyles.titleSmallBlack90001Medium,
//         onChanged: (value) {
//           // Update the selected item when the user selects a new item
//           controller.areYourFirstGenerationCollegeStudentValue = value.toString();
//           // print("praodfdfdfsdf${value}");
//         },
//         icon: Padding(
//           padding: const EdgeInsets.only(right: 5.0),
//           child: Icon(
//             Icons.arrow_drop_down_rounded,
//             color: Colors.red,
//           ),
//         ),
//         decoration: decoration,
//         hint: Text("lbl_select_option".tr,style: CustomTextStyles.titleSmallBlack90001Medium,),
//       ),
//     ) :  SizedBox(
//       width: Get.width,
//       height: 50.h,
//       child: DropdownButtonFormField(
//         // validator:Validator.validateDouble,
//         value:controller.areYourFirstGenerationCollegeStudentValue,
//         items:controller.areYourFirstGenerationCollegeStudentList.map((String item) {
//           return DropdownMenuItem(
//             value: item,
//             child: Text(item),
//           );
//         }).toList(),
//         style: CustomTextStyles.titleSmallBlack90001Medium,
//         onChanged: (value) {
//           // Update the selected item when the user selects a new item
//           controller.areYourFirstGenerationCollegeStudentValue = value.toString();
//           // print("praodfdfdfsdf${value}");
//         },
//         icon: Padding(
//           padding: const EdgeInsets.only(right: 5.0),
//           child: Icon(
//             Icons.arrow_drop_down_rounded,
//             color: Colors.red,
//           ),
//         ),
//         decoration: decoration,
//         hint: Text("lbl_select_option".tr,style: CustomTextStyles.titleSmallBlack90001Medium,),
//       ),
//     ),
//   );
// }
  InputDecoration get decoration => InputDecoration(
        hintStyle: CustomTextStyles.titleSmallBlack90001Medium,
        isDense: true,
        contentPadding: EdgeInsets.only(
          left: 10.h,
          top: 10.v,
          bottom: 10.v,
        ),
        fillColor: appTheme.whiteA700,
        // filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60002,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60002,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60001,
            width: 1,
          ),
        ),
      );
}
