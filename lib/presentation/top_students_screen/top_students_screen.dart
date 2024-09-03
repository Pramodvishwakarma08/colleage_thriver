import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/top_students_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';

class TopStudentsScreen extends GetWidget<TopStudentsController> {
  const TopStudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: "msg_weekly_leaderboard".tr),
        body: Obx(
            ()=> controller.isLoadingCollegeGetMatchOne.value ? Center(child: CircularProgressIndicator(strokeWidth: 2,),) : Padding(
            padding: EdgeInsets.only(left: 15.0.h, right: 15.h),
            child: ListView(children: [
              SizedBox(height: 28.v),
              Text("msg_complete_activities".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumSecondaryContainerMedium.copyWith(height: 1.00)),
              SizedBox(height: 19.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("lbl_top_students".tr,
                    style: CustomTextStyles.titleMediumBlack9000118),
                CustomImageView(
                    imagePath: ImageConstant.imgWinner1,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    margin: EdgeInsets.only(left: 12.h)),
                Spacer(),
                CustomElevatedButton(
                    onPressed: onTaprewardsScreen,
                    height: 36.v,
                    width: 126.h,
                    text: "lbl_see_rewards".tr,
                    buttonStyle: CustomButtonStyles.fillYellow,
                    buttonTextStyle: CustomTextStyles.titleMediumWhiteA700)
              ]),
              SizedBox(height: 30.v),
              for (int i = 0; i < controller.topStudentModel!.data!.length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35.adaptSize,
                      height: 35.adaptSize,
                      decoration: AppDecoration.fillPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                      child: Center(
                        child: Text(
                          "#${1+i}",
                          style: CustomTextStyles.titleSmallRoboto,
                        ),
                      ),
                    ),

                    CustomImageView(
                      border: Border.all(color:Colors.grey.shade400),
                      imagePath: controller.topStudentModel?.data?[i].profileImage ?? ImageConstant.imageNotFound,
                      height: 50.adaptSize,
                      width: 50.adaptSize,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(
                        30.h,
                      ),
                      margin: EdgeInsets.only(left: 12.h),
                    ),
                    SizedBox(width: 20.h,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.topStudentModel!.data![i].fullname ?? ""}",
                          style: CustomTextStyles.titleMediumBlack90001SemiBold,
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          "${controller.topStudentModel!.data![i].titleClg ?? ""}",
                          style:
                              CustomTextStyles.titleSmallRobotoOnPrimaryContainer,
                        ),
                      ],
                    ),
                     Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 17.v,
                        bottom: 16.v,
                      ),
                      child: Text(
                        "${controller.topStudentModel!.data![i].allPoints}",
                        style: CustomTextStyles.titleLargeRoboto,
                      ),
                    ),
                  ],
                )
            ]),
          ),
        ));
  }

  /// Navigates to the rewardsScreen when the action is triggered.
  onTaprewardsScreen() {
    Get.toNamed(
      AppRoutes.rewardsScreen,
    );
  }
}
