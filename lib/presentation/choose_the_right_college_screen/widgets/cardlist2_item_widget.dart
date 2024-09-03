import '../controller/choose_the_right_college_controller.dart';
import '../models/cardlist2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class Cardlist2ItemWidget extends StatelessWidget {
  Cardlist2ItemWidget(
    this.cardlist2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Cardlist2ItemModel cardlist2ItemModelObj;

  var controller = Get.find<ChooseTheRightCollegeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.gradientDeepPurpleFToDeepPurple.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: cardlist2ItemModelObj.activityImage!.value,
              height: 141.v,
              width: 340.h,
              radius: BorderRadius.circular(
                25.h,
              ),
            ),
          ),
          SizedBox(height: 15.v),
          Obx(
            () => Text(
              cardlist2ItemModelObj.activityText!.value,
              style: CustomTextStyles.titleMediumYellowA200,
            ),
          ),
          SizedBox(height: 4.v),
          Obx(
            () => Text(
              cardlist2ItemModelObj.exploreText!.value,
              style: CustomTextStyles.titleMediumWhiteA700_1,
            ),
          ),
          SizedBox(height: 4.v),
          Obx(
            () => Text(
              cardlist2ItemModelObj.improveText!.value,
              style: CustomTextStyles.titleSmallRobotoMedium,
            ),
          ),
          SizedBox(height: 13.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  text: "lbl_todo".tr,
                  margin: EdgeInsets.only(right: 4.h),
                  buttonStyle: CustomButtonStyles.outlineWhiteATL121,
                ),
              ),
              Expanded(
                child: CustomOutlinedButton(
                  text: "lbl_get_started".tr,
                  margin: EdgeInsets.only(left: 4.h),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }
}
