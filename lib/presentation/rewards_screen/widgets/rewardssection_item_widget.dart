import 'package:colleage_thriver/core/utils/progress_dialog_utils.dart';

import '../controller/rewards_controller.dart';
import '../models/rewardssection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

// ignore: must_be_immutable
class RewardssectionItemWidget extends StatelessWidget {
  RewardssectionItemWidget(
    this.rewardssectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RewardssectionItemModel rewardssectionItemModelObj;

  var controller = Get.find<RewardsController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppDialogUtils.showToast(message: 'Coming Soon');
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.gradientPrimaryToDeepPurple.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          children: [
            Container(
              height: 62.adaptSize,
              width: 62.adaptSize,
              padding: EdgeInsets.all(11.h),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgWinner1,
                height: 40.adaptSize,
                width: 40.adaptSize,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24.h,
                top: 22.v,
                bottom: 20.v,
              ),
              child: Obx(
                () => Text(
                  rewardssectionItemModelObj.scholarshipText!.value,
                  style: CustomTextStyles.titleMediumWhiteA70016,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
