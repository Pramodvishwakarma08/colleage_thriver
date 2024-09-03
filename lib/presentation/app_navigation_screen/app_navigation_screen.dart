import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Onboarding 1 Find College ".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboarding1FindCollegeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "splash".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding 2 Connect With A Mentor".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboarding2ConnectWithAMentorScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding 3 Find Best Scholarship".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboarding3FindBestScholarshipScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Signup".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signupScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Tell us about yourself".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.tellUsAboutYourselfScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Tell us about your school".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.tellUsAboutYourSchoolScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Your roadmap to college".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Become a strong candidate".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.becomeAStrongCandidateScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Organize your application".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.organizeYourApplicationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Choose the right college".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.chooseTheRightCollegeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Find Scholarships".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.findScholarshipsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Top Students".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.topStudentsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Rewards".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.rewardsScreen),
                        ),


                        _buildScreenTitle(
                          screenTitle: "Get your college matches".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.getYourCollegeMatchesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Get your college matches Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.getYourCollegeMatchesThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Get your college matches Two".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.getYourCollegeMatchesTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Get your college matches One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.getYourCollegeMatchesOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Take personality quiz".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.takePersonalityQuizScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Take career assessment".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.takeCareerAssessmentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Meet counselor or advisor".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.meetCounselorOrAdvisorScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Choose potential majors".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.choosePotentialMajorsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Join extracurriculars".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.joinExtracurricularsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Explore advanced classes".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.exploreAdvancedClassesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Take SAT/ACT Test".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.takeSatActTestScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Create College Checklist".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createCollegeChecklistScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Write college essays".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.writeCollegeEssaysScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Ask for recommendations".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.askForRecommendationsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Send SAT/ACT scores".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.sendSatActScoresScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Submit applications - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.submitApplicationsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Attend college fairs".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.attendCollegeFairsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Choose your college".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.chooseYourCollegeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Search for scholarships".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.searchForScholarshipsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Create a shortlist".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAShortlistScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Apply to scholarships".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.applyToScholarshipsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Congratulations!".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.congratulationsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Slider from bottom for album".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.sliderFromBottomForAlbumScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "New password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.newPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Mentors".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.mentorsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Messages".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.messagesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Top Students One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.topStudentsOneScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
