// ignore_for_file: must_be_immutable

import '../../widgets/app_bar/appbar_home_page.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/become_a_strong_candidate_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

class BecomeAStrongCandidateScreen extends GetWidget<BecomeAStrongCandidateController> {
   BecomeAStrongCandidateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarHomepage(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: ListView(
              children: [
                SizedBox(height: 23.v),
                Text("msg_become_a_strong".tr, style: CustomTextStyles.titleLargeRoboto),
                SizedBox(height: 15.v),
                Text("msg_you_can_improve".tr,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(height: 1.05)),
                SizedBox(height: 29.v),
                _buildCardList()
              ]),
        ));
  }

  List titles =[
    "Discover Your Dream College!",
    "Take personality assessment",
    "Take career assessment",
    "Meet counselor or career advisor",
    "Choose potential majors",
    "Join extracurricular activities",
    "Explore AP or dual enrollment classes",
    "Take SAT/ACT Test",
  ];
  /*
 */
  List subtitles =[
    "Enter your info to match with the right school",
    "Discover your strengths & areas for improvement",
    "Figure out what careers & pathways interest pathways interest",
    "Discuss your college plans With an advisor",
    "Write down a lÉt of selected majors",
    "Gain experience and skills from activities",
    "Take advanced or college credit courses",
    "Practice and study for your SAT/ACT test",

  ];
  /// Section Widget
  Widget _buildCardList() {
    return  ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.v);
        },
        itemCount: 8,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(10.h),
              decoration: AppDecoration.gradientDeepPurpleFToDeepPurple.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               CustomImageView(
                      imagePath: ImageConstant.imgFrame427320748141x340,
                      height: 141.v,
                      width: 340.h,
                      radius: BorderRadius.circular(
                        25.h,
                      ),
                    ),

                  SizedBox(height: 15.v),
                 Text("Activity ${index+1} of 8",
                      style: CustomTextStyles.titleMediumYellowA200,
                    ),

                  SizedBox(height: 4.v),
                 Text(
                      "${titles[index]}",
                      style: CustomTextStyles.titleMediumWhiteA700_1,
                    ),
                  SizedBox(height: 4.v),
                  Text(
                    "${subtitles[index]}",
                      style: CustomTextStyles.titleSmallRobotoMedium,
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
                          onPressed: () {
                            switch (index+1) {
                              case 1:
                                activity1();
                                break;
                              case 2:
                                activity2();
                                break;
                              case 3:
                                activity3();
                                break;
                              case 4:
                                activity4();
                                break;
                              case 5:
                                activity5();
                                break;
                              case 6:
                                activity6();
                                break;
                              case 7:
                                activity7();
                                break;
                              case 8:
                                activity8();
                                break;
                              default:
                                print('Invalid activity index');
                            }
                          },
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
            ),
          );
        });
  }





  /// Navigates to the yourRoadmapToCollegeScreen when the action is triggered.
  activity1() {Get.toNamed(AppRoutes.getYourCollegeMatchesScreen,);}
  activity2() {Get.toNamed(AppRoutes.takePersonalityQuizScreen,);}
  activity3() {Get.toNamed(AppRoutes.takeCareerAssessmentScreen,);}
  activity4() {Get.toNamed(AppRoutes.meetCounselorOrAdvisorScreen,);}
  activity5() {Get.toNamed(AppRoutes.choosePotentialMajorsScreen,);}
  activity6() {Get.toNamed(AppRoutes.joinExtracurricularsScreen,);}
  activity7() {Get.toNamed(AppRoutes.exploreAdvancedClassesScreen,);}
  activity8() {Get.toNamed(AppRoutes.takeSatActTestScreen,);}



}
// enum AppRoutes {
//   getYourCollegeMatchesScreen,
//   takePersonalityQuizScreen,
//   takeCareerAssessmentScreen,
//   meetCounselorOrAdvisorScreen,
//   choosePotentialMajorsScreen,
//   joinExtracurricularsScreen,
//   exploreAdvancedClassesScreen,
//   takeSatActTestScreen,
// }