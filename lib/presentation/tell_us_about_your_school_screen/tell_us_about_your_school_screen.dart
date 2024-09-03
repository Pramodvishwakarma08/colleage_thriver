import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/core/utils/progress_dialog_utils.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/textfield_validation.dart';
import 'controller/tell_us_about_your_school_controller.dart';

// ignore: must_be_immutable
class TellUsAboutYourSchoolScreen extends GetWidget<TellUsAboutYourSchoolController> {
  TellUsAboutYourSchoolScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_tell_us_about_your".tr),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
              key: _formKey,
              child: Obx(
                () => controller.isLoading.value
                    ? SizedBox(
                        height: 500,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18.v),
                              Text(" " + "msg_high_school_name".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 8.v),
                              CustomTextFormField(
                                controller: controller.highSchoolName,
                                validator: Validator.validateHighSchoolName,
                                hintText: "msg_high_school_name".tr,
                              ),
                              SizedBox(height: 17.v),
                              Text(" " + "lbl_year_in_school".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 10.v),
                              _dropdwounYearInSchool(),
                              SizedBox(height: 18.v),
                              Text(" " + "lbl_gpa".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 9.v),
                              CustomTextFormField(
                                controller: controller.gPA,
                                textInputType: TextInputType.numberWithOptions(decimal: true),
                                hintText: "lbl_overall_gpa".tr,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                                ],
                                validator: Validator.validateDouble,

                              ),
                              SizedBox(height: 18.v),
                              Text(" " + "msg_group_affiliation".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 9.v),
                              CustomTextFormField(
                                  controller: controller.selectGroup,
                                  hintText: "lbl_select_group".tr),
                              SizedBox(height: 19.v),
                              Text(" " + "msg_high_school_graduation".tr,
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: 9.v),
                              _dropdwounHighSchoolGraduation(),
                              SizedBox(height: 15.v),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("msg_this_data_will_not".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .titleSmallRobotoPrimary
                                        .copyWith(height: 1.23)),
                              ),
                              SizedBox(height: 100.v),
                              Obx(
                                () => CustomElevatedButton(
                                    isLoading:
                                        controller.isLoadingUpdateProfile.value,
                                    text: "Update".tr,
                                    onPressed: () {
                                      onTapContinue();
                                    }),
                              ),
                              SizedBox(height: 30.v),
                            ]),
                      ),
              )),
        ));
  }

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

  Widget _dropdwounYearInSchool() {
    return SizedBox(
      width: Get.width,
      height: 50.h,
      child: DropdownButtonFormField(
        // validator:Validator.validateDouble,
        value: controller.yearInSchool,
        items: controller.dropdownYearList.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        style: CustomTextStyles.titleSmallBlack90001Medium,
        onChanged: (value) {
          // Update the selected item when the user selects a new item
          controller.yearInSchool = value.toString();
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
          "lbl_year_in_school".tr,
          style: CustomTextStyles.titleSmallBlack90001Medium,
        ),
      ),
    );
  }

  Widget _dropdwounHighSchoolGraduation() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        width: 158.h,
        height: 50.h,
        child: DropdownButtonFormField(
          value: controller.highSchoolGraduationMonth,
          items: controller.monthsList.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            // Update the selected item when the user selects a new item
            controller.highSchoolGraduationMonth = value.toString();
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.red,
            ),
          ),
          decoration: decoration,
          style: CustomTextStyles.titleSmallBlack90001Medium,
          hint: Text(
            "lbl_select_month".tr,
            style: CustomTextStyles.titleSmallBlack90001Medium,
          ),
        ),
      ),
      SizedBox(
        width: 158.h,
        height: 50.h,
        child: DropdownButtonFormField(
          value: controller.highSchoolGraduationYear,
          items: controller.dropdownYearList.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          style: CustomTextStyles.titleSmallBlack90001Medium,
          onChanged: (value) {
            controller.highSchoolGraduationYear = value.toString();
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
            "lbl_select_year".tr,
            style: CustomTextStyles.titleSmallBlack90001Medium,
          ),
        ),
      ),
    ]);
  }

  onTapContinue() {
    if (_formKey.currentState!.validate()) {
      if (controller.yearInSchool == null) {
        AppDialogUtils.showToast(message: "Please Select Year In School");
      } else if (controller.highSchoolGraduationMonth == null) {
        AppDialogUtils.showToast(
            message: "Please Select High School Graduation Date");
      } else if (controller.highSchoolGraduationYear == null) {
        AppDialogUtils.showToast(
            message: "Please Select High School Graduation Date");
      } else if (double.parse(controller.gPA.text.trim()) > 4) {
        AppDialogUtils.showToast(message: "GPA should be 4.0 or lower");
      } else {
        controller.updateProfile();
      }
    }
    // Get.toNamed(
    //   AppRoutes.homeScreen,
    // );
  }
}
