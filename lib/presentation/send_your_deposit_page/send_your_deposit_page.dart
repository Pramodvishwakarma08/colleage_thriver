import '../../widgets/app_bar/appbar_home_page.dart';
import 'controller/send_your_deposit_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class SendYourDepositPage extends StatelessWidget {
  SendYourDepositPage({Key? key}) : super(key: key);

  SendYourDepositController controller = Get.put(SendYourDepositController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "Send your deposit"),
      body: Padding(
        padding:  EdgeInsets.only(left: 20.h,right: 20.h),
        child: Column(
          children: [
            SizedBox(height: 5.v),
            _activityRow(),
            SizedBox(height: 20.v),
            Text(
             "Send your commitment and deposit to the college you plan to attend. If you've been offered financial aid, accept the offer and follow the instructions given. Notify schools you will not attend of your decision.",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleMediumPrimaryMedium.copyWith(
                height: 1.23,
              ),
            ),
            SizedBox(height: 24.v),
            Text(
              "Upload a screenshot of your commitment letter.".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium!.copyWith(
                height: 1.60,
              ),
            ),
            SizedBox(height: 14.v),
            _uploadFilesRow(),
            SizedBox(height: 10.v),

            Text(
              "Upload Photo".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium!.copyWith(
                height: 1.60,
              ),
            ),

            Spacer(),
            _buttonRow(),
            SizedBox(height: 30.v),

          ],
        ),
      ),
    );
  }

  /// Section Widget

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
            "lbl_5_of_5".tr,
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
  Widget _uploadFilesRow() {
    return InkWell(
      onTap: (){
        controller.showPicker(Get.context);
      },
      child: Container(
          decoration: AppDecoration.outlineGray60003
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(left: 12.h, top: 12.v, bottom: 9.v),
                child: Text("lbl_upload_files".tr,
                    style: CustomTextStyles.bodyLargeInterWhiteA700)),

            CustomElevatedButton(
                width: 124.h,
                text: "lbl_png_jpg".tr,
                buttonStyle: CustomButtonStyles.fillGray,
                buttonTextStyle: CustomTextStyles.bodyLargeInterBlack90001)
          ])),
    );
  }
  Widget _buttonRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildDoItLaterButton(), _buildMarkAsDoneButton()]);
  }

  /// Section Widget
  Widget _buildDoItLaterButton() {
    return Expanded(
        child: CustomElevatedButton(
            onPressed: () {
              onTapBack();
            },
            text: "lbl_do_it_later".tr,
            margin: EdgeInsets.only(right: 12.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12));
  }

  /// Section Widget
  Widget _buildMarkAsDoneButton() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_mark_as_done".tr,
            margin: EdgeInsets.only(left: 12.h),
            onPressed: () {
              onTapMarkAsDoneButton();
            }));
  }

  /// Sectio


  /// Navigates to the submitApplicationsTabContainerScreen when the action is triggered.
  onTapMarkAsDoneButton() {
    Get.back(
    );
  }


  onTapBack() {
    Get.toNamed(
      AppRoutes.chooseTheRightCollegeScreen,
    );
  }


}
