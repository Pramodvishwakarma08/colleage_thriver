import 'package:colleage_thriver/core/utils/textfield_validation.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/create_a_shortlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateAShortlistScreen extends GetWidget<CreateAShortlistController> {
  CreateAShortlistScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppbar(title: "msg_create_a_shortlist".tr),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFrameRow(),
                      SizedBox(height: 33.v),
                      Text("msg_determine_which".tr,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles
                              .titleMediumPrimaryMedium
                              .copyWith(height: 1.23)),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("msg_write_down_three".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(height: 1.60)),
                      ),
                      SizedBox(height: 15.v),
                      CustomTextFormField(
                          controller: controller.nameController,
                          hintText: "msg_enter_scholarship".tr,
                          textInputAction: TextInputAction.done,
                          validator: Validator.notEmpty),
                      Spacer(),
                      SizedBox(height: 62.v),
                      _buttonRow(),
                     SizedBox(height: 30.v),

                    ]))));
  }


  /// Section Widget
  Widget _buildFrameRow() {
    return Row(children: [
      Padding(
          padding: EdgeInsets.only(top: 4.v),
          child: Text("lbl_activity".tr,
              style: CustomTextStyles.titleSmallRobotoBlack90001)),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text("lbl_2_of_5".tr, style: theme.textTheme.titleMedium)),
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
                if (_formKey.currentState!.validate()){
                  controller.updateCollefefairs();
                }


                // Get.back();
                // onTapMarkAsDone();
              }))
    ]);
  }


onTapBack() {
  Get.toNamed(
    AppRoutes.findScholarshipsScreen,
  );
}

  /// Navigates to the applyToScholarshipsScreen when the action is triggered.
  onTapMarkAsDone() {
    Get.toNamed(
      AppRoutes.applyToScholarshipsScreen,
    );
  }
}
