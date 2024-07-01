import '../controller/become_a_strong_candidate_controller.dart';
import '../models/cardlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class CardlistItemWidget extends StatelessWidget {
  CardlistItemWidget(
    this.cardlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CardlistItemModel cardlistItemModelObj;

  var controller = Get.find<BecomeAStrongCandidateController>();

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
              imagePath: cardlistItemModelObj.activityImage!.value,
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
              cardlistItemModelObj.activityText!.value,
              style: CustomTextStyles.titleMediumYellowA200,
            ),
          ),
          SizedBox(height: 4.v),
          Obx(
            () => Text(
              cardlistItemModelObj.collegeOptionsText!.value,
              style: CustomTextStyles.titleMediumWhiteA700_1,
            ),
          ),
          SizedBox(height: 4.v),
          Obx(
            () => Text(
              cardlistItemModelObj.chancesText!.value,
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
                  buttonStyle: CustomButtonStyles.fillYellowTL12,
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
