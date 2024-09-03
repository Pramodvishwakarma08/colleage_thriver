import 'package:colleage_thriver/core/utils/textfield_validation.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/attend_college_fairs_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/core/utils/validation_functions.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AttendCollegeFairsScreen extends GetWidget<AttendCollegeFairsController> {
  AttendCollegeFairsScreen({Key? key}) : super(key: key,);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppbar(title: "msg_attend_college_fairs".tr),
      body: Form(
        key: _formKey,
        child: Padding(
          padding:  EdgeInsets.only(left: 20.0.h,right: 20.h),
          child: Column(
            children: [
              _activityRow(),
              SizedBox(height: 33.v),
              Text("msg_go_to_college_fairs".tr,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumPrimaryMedium
                    .copyWith(
                  height: 1.23,
                ),
              ),
              SizedBox(height: 23.v),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "msg_list_the_schools".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.60,
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "msg_enter_college_names".tr,
                textInputAction: TextInputAction.done,
                validator: Validator.notEmpty,
              ),
              Spacer(),
              SizedBox(height: 52.v),
              _buttonRow(),
              SizedBox(height: 30.v),

            ],
          ),
        ),
      ),
    );
  }


  /// Section Widget
  Widget _activityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text(
            "lbl_activity".tr,
            style: CustomTextStyles.titleSmallRobotoBlack90001,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "lbl_2_of_5".tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 3.v),
          child: Text(
            "lbl_earn_25_points".tr,
            style: CustomTextStyles.titleSmallRobotoBlack90001,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgClose,
          height: 22.adaptSize,
          width: 22.adaptSize,
          margin: EdgeInsets.only(left: 10.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            text: "lbl_do_it_later".tr,
            margin: EdgeInsets.only(right: 12.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12,
              onPressed: () {
                onTapBack();
              }
          ),
        ),
        Expanded(
          child: CustomElevatedButton(
             onPressed: () {
               // Get.back();
               if (_formKey.currentState!.validate()) {
               //  controller.updateCollegeMatchOne();
                 controller.updateCollefefairs();
                 // Get.toNamed(
                 //   AppRoutes.getYourCollegeMatchesThreeScreen,
                 // );
               }
               //controller.updateCollefefairs();
             },
            text: "lbl_mark_as_done".tr,
            margin: EdgeInsets.only(left: 12.h),
          ),
        ),
      ],
    );
  }
  //chooseYourCollegeScreen

  onTapBack() {
    Get.toNamed(
      AppRoutes.chooseTheRightCollegeScreen,
    );
  }
}
