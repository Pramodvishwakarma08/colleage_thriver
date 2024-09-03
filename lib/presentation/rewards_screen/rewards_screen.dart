import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'widgets/rewardssection_item_widget.dart';
import 'controller/rewards_controller.dart';
import 'models/rewardssection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

// ignore_for_file: must_be_immutable
class RewardsScreen extends GetWidget<RewardsController> {
  const RewardsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: myAppbar(title: "lbl_rewards".tr),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.v,),
              Text(
                "msg_prepare_for_your".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumSecondaryContainerMedium
                    .copyWith(
                  height: 1.00,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgG11,
                height: 213.v,
                width: 298.h,
              ),
              SizedBox(height: 28.v),
              _buildRewardsSection(),
              SizedBox(height: 7.v),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "msg_terms_and_conditions".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumBlack90001Medium16,
                ),
              ),
            ],
          ),
        ),
      );
  }

  /// Section Widget
  Widget _buildRewardsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.h),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: controller
              .rewardsModelObj.value.rewardssectionItemList.value.length,
          itemBuilder: (context, index) {
            RewardssectionItemModel model = controller
                .rewardsModelObj.value.rewardssectionItemList.value[index];
            return RewardssectionItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
