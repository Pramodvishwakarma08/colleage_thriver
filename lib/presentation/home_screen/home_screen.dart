// ignore_for_file: unused_import


import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_outlined_button.dart';

class HomeScreen extends GetWidget<HomePageCollegeController> {
  HomeScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarHomepage(context,true),
        body: Padding(
          padding: EdgeInsets.only(left: 15.h, right: 15.h),
          child: ListView(children: [

            SizedBox(height: 25,),
            InkWell(
              onTap: getYourColleage,
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("lbl_hello".tr,
                    style: CustomTextStyles.bodyLargeBlack90001),

                SizedBox(width: 5.h,),
                Obx(
                      () => controller.isLoading.value
                      ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(200)),
                      width: 150.h,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      height: 20.v,
                    ),
                  )
                      : Obx(
                        () => Text("${controller.userName}",
                        style: CustomTextStyles.titleMediumPrimary),
                  ),
                )
              ]),
            ),
            SizedBox(height: 24.v),
            SizedBox(
                height: 119.adaptSize,
                width: 119.adaptSize,
                child: Stack(alignment: Alignment.center, children: [
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: 119.adaptSize,
                          width: 119.adaptSize,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(59.h),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                    appTheme.black90001.withOpacity(0.25),
                                    spreadRadius: 2.h,
                                    blurRadius: 2.h,
                                    offset: Offset(0, 4))
                              ]))),
                  CustomImageView(
                      imagePath: ImageConstant.imgHttpsLottief,
                      height: 102.adaptSize,
                      width: 102.adaptSize,
                      alignment: Alignment.center)
                ])),
            SizedBox(height: 15.v),
            Obx(
                  () => Center(
                child: Text("${controller.roadmapProgress} %".tr,
                    style: theme.textTheme.headlineMedium),
              )
              ,
            ),
            SizedBox(height: 12.v),
            Center(
              child: Text("msg_roadmap_progress".tr,
                  style: CustomTextStyles.titleMediumBlack90001_1),
            )
            ,
            SizedBox(height: 22.v),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("lbl_points".tr,
                      style: CustomTextStyles.titleMediumBlack90001Medium16),
                  Obx(
                        () => Text("${controller.points}".tr,
                        style: CustomTextStyles.titleMediumBlack90001Medium16),
                  ),
                  Spacer(),
                  _buildViewLeaderboard()
                ]),
            SizedBox(height: 25.v),
            Text(" " + "msg_your_roadmap_to".tr,
                style: theme.textTheme.headlineSmall),
            SizedBox(height: 3.v),
            Container(
                width: 311.h,
                margin: EdgeInsets.only(left: 4.h, right: 44.h),
                child: Text("msg_get_to_college_one".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleMediumSecondaryContainer)),
            SizedBox(height: 20.v),
            Row(
              children: [
                _getHelpButton(),
                _viewMatchesButton(),
              ],
            ),
            SizedBox(height: 30.v),
            _buildFindYourMentor(),
            SizedBox(height: 30.v),
            // _buildCard(
            //     image: ImageConstant.imgFrame427320748,
            //     activitiesCounter: "8 activities".tr,
            //     exploreYourCollege: "msg_explore_your_college".tr,
            //     improveYourChances: "msg_improve_your_chances_of".tr,
            //     onTapCard: () {
            //       onTapCard1();
            //     }),
            // _buildCard(
            //     image: ImageConstant.imgFrame427320748,
            //     activitiesCounter: "5 activities".tr,
            //     exploreYourCollege: "Organize your application".tr,
            //     improveYourChances:
            //         "Stay on track with your college applications".tr,
            //     onTapCard: () {
            //       onTapCard2();
            //     }),
            _buildCard(
                image: ImageConstant.imgFrame427320748,
                activitiesCounter: "5 activities".tr,
                exploreYourCollege: "Choose the right college".tr,
                improveYourChances:
                "Assess your options & find the right college for you".tr,
                onTapCard: () {
                  onTapCard3();
                }),
            _buildCard(
                image: ImageConstant.imgFrame427320748,
                activitiesCounter: "5 activities".tr,
                exploreYourCollege: "Find scholarships".tr,
                improveYourChances:
                "Discover scholarships & financial aid opportunities".tr,
                onTapCard: () {
                  onTapCard4();
                }),
          ]),
        ));
  }

  /// VIEW LEADERBOARD
  Widget _buildViewLeaderboard() {
    return CustomOutlinedButton(
        onPressed: onTapTopStudentsScreen,
        height: 36.v,
        width: 199.h,
        text: "msg_view_leaderboard".tr,
        rightIcon: Container(
            margin: EdgeInsets.only(left: 10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgArrowright,
                color: theme.colorScheme.primary,
                height: 14.v,
                width: 17.h)),
        buttonStyle: CustomButtonStyles.outlineYellow,
        buttonTextStyle: CustomTextStyles.titleMediumBlack90001Medium16);
  }

  /// GetHelp Buttion Widget
  ///
  Widget _getHelpButton() {
    return Expanded(
        child: CustomOutlinedButton(
            onPressed: () async{
              try {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: "collegethriverapp@gmail.com",
                  );
                //  final Uri emailUri = Uri.parse("https://www.aamu.edu/");
                await launchUrl(emailUri);
              } catch (e, s) {
                Logger().e(e, stackTrace: s);
              }
            },
            text: "lbl_get_help".tr,
            margin: EdgeInsets.only(right: 4.h),
            buttonStyle: CustomButtonStyles.outlineGray,
            buttonTextStyle: CustomTextStyles.titleSmallOnPrimary));
  }

  /// Section Widget
  Widget _viewMatchesButton() {
    return Expanded(
        child: CustomOutlinedButton(
            text: "lbl_view_matches".tr,
            margin: EdgeInsets.only(right: 4.h),
            buttonStyle: CustomButtonStyles.fillYellowTL12,
            buttonTextStyle: CustomTextStyles.titleSmallOnPrimarywhite,
            onPressed: () {
              onTapViewMatches();
            }));
  }

  Widget _buildFindYourMentor() {
    return CustomOutlinedButton(
        text: "msg_find_your_mentor".tr,
        buttonStyle: CustomButtonStyles.outlineWhiteATL12,
        onPressed: () {
          onTapFindYourMentor();
        });
  }

  /// Common widget
  Widget _buildCard({
    required String image,
    required String activitiesCounter,
    required String exploreYourCollege,
    required String improveYourChances,
    Function? onTapCard,
  }) {
    return GestureDetector(
        onTap: () {
          onTapCard!.call();
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              decoration: AppDecoration.gradientDeepPurpleFToDeepPurple,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.v),
                    CustomImageView(
                        imagePath: image,
                        height: 141.v,
                        width: 340.h,
                        radius: BorderRadius.circular(10.h)),
                    SizedBox(height: 10.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage12,
                          height: 30.v,
                          width: 28.h),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(activitiesCounter,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.titleSmallYellowA200
                                  .copyWith(color: appTheme.yellowA200)))
                    ]),
                    SizedBox(height: 10.v),
                    Text(exploreYourCollege,
                        style: CustomTextStyles.titleMediumWhiteA700_1
                            .copyWith(color: appTheme.whiteA700)),
                    SizedBox(height: 10.v),
                    Text(improveYourChances,
                        style: CustomTextStyles.titleSmallRobotoMedium
                            .copyWith(color: appTheme.whiteA700)),
                    SizedBox(height: 20.v,),

                  ])),
        ));
  }

  /// Navigates to the tellUsAboutYourselfScreen when the action is triggered.
  onTapPlay() {
    Get.toNamed(
      AppRoutes.tellUsAboutYourselfScreen,
    );
  }

  /// Navigates to the sliderFromBottomForAlbumScreen when the action is triggered.
  onTapMegaphone() {
    Get.toNamed(
      AppRoutes.sliderFromBottomForAlbumScreen,
    );
  }

  /// Navigates to the topStudentsScreen when the action is triggered.
  onTapTopStudentsScreen() {
    Get.toNamed(
      AppRoutes.topStudentsScreen,
    );
  }

  /// Navigates to the recommendedCollegesOneScreen when the action is triggered.
  onTapViewMatches() {
    Get.toNamed(
      AppRoutes.recommendedCollegeScreen,
    );
  }

  /// Navigates to the mentorsScreen when the action is triggered.
  onTapFindYourMentor() {
    Get.toNamed(
      AppRoutes.mentorsScreen,
    );
  }

  /// Navigates to the becomeAStrongCandidateScreen when the action is triggered.
  onTapCard1() {
    Get.toNamed(
      AppRoutes.becomeAStrongCandidateScreen,
    );
  }

  /// Navigates to the organizeYourApplicationScreen when the action is triggered.
  onTapCard2() {
    Get.toNamed(
      AppRoutes.organizeYourApplicationScreen,
    );
  }

  /// Navigates to the chooseTheRightCollegeScreen when the action is triggered.
  onTapCard3() {
    Get.toNamed(
      AppRoutes.chooseTheRightCollegeScreen,
    );
  }

  /// Navigates to the findScholarshipsScreen when the action is triggered.
  onTapCard4() {
    Get.toNamed(
      AppRoutes.findScholarshipsScreen,
    );
  }

  getYourColleage() {
    Get.toNamed(
      AppRoutes.getYourCollegeMatchesScreen,
    );
  }

  _bottomSheetWidget() {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        builder: (context) {
          return Obx(
                () => FractionallySizedBox(
                heightFactor: controller.hight.value,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15.v),
                            Center(
                              child: Text(
                                "Help",
                                style: TextStyle(
                                  fontSize: 20.adaptSize,
                                  fontWeight: FontWeight.w700,
                                  color: appTheme.primary,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Padding(
                                padding: EdgeInsets.only(left: 11.h),
                                child: Text("lbl_email".tr,
                                    style: theme.textTheme.bodyMedium)),
                            SizedBox(
                              height: 10.v,
                            ),
                            CustomTextFormField(
                                onTap: () {
                                  controller.hight.value = 0.70;
                                },
                                onEditingComplete: () {
                                  controller.hight.value = 0.45;
                                  FocusScope.of(Get.context!).unfocus();
                                  _scrollController.animateTo(
                                    0.0,
                                    duration: Duration(
                                        milliseconds:
                                        200), // Adjust the duration as needed
                                    curve: Curves.easeInOut,
                                  );
                                },
                                hintText: "please enter your email",
                                controller: controller.emailExampleController,
                                textInputAction: TextInputAction.done),
                            SizedBox(
                              height: 10.v,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 11.h),
                                child: Text("Write your query".tr,
                                    style: theme.textTheme.bodyMedium)),
                            SizedBox(
                              height: 10.v,
                            ),
                            CustomTextFormField(
                                onTap: () {
                                  controller.hight.value = 0.70;
                                },
                                onEditingComplete: () {
                                  controller.hight.value = 0.45;
                                  FocusScope.of(Get.context!).unfocus();
                                  _scrollController.animateTo(
                                    0.0,
                                    duration: Duration(
                                        milliseconds:
                                        200), // Adjust the duration as needed
                                    curve: Curves.easeInOut,
                                  );
                                },
                                controller: controller.textEditingController,
                                maxLines: 3,
                                hintText: "Here is what I need an help",
                                textInputAction: TextInputAction.done),
                            SizedBox(
                              height: 24.v,
                            ),
                            Obx(
                                  () => CustomElevatedButton(
                                isLoading: controller.isLoading.value,
                                text: "Submit".tr,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 400.v,
                            ),
                          ]),
                    ),
                  ),
                )),
          );
        });
  }

  // sendMail() async {
  //   print("object");
  //   final Uri emailUri = Uri(
  //     scheme: 'mailto',
  //     path: "collegethriverapp@gmail.com",
  //   );
  //   try{
  //     print("=====");
  //     launchUrl(emailUri);
  //     print("=====");
  //
  //   }catch(e){
  //     print("=====>$e");
  //   }
  //
  // }
}


//
// String buildTrim() {
// if (!widget.seletedClg.insturl!
//     .trim()
//     .toString()
//     .trim()
//     .startsWith("https")) {
// return "https://" + widget.seletedClg.insturl!.trim().toString().trim();
// }
// return widget.seletedClg.insturl!.trim().toString().trim();
// }
