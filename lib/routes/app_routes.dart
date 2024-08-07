import 'package:colleage_thriver/presentation/file_your_fafsa_page/file_your_fafsa_page.dart';
import 'package:colleage_thriver/presentation/recommended_colleges_screen/recommended_colleges_screen.dart';
import 'package:colleage_thriver/presentation/send_your_deposit_page/send_your_deposit_page.dart';
import 'package:colleage_thriver/presentation/splash_screen/splash_screen.dart';
import 'package:colleage_thriver/presentation/splash_screen/binding/splash_binding.dart';
import 'package:colleage_thriver/presentation/login_screen/login_screen.dart';
import 'package:colleage_thriver/presentation/login_screen/binding/login_binding.dart';
import 'package:colleage_thriver/presentation/signup_screen/signup_screen.dart';
import 'package:colleage_thriver/presentation/signup_screen/binding/signup_binding.dart';
import 'package:colleage_thriver/presentation/tell_us_about_yourself_screen/tell_us_about_yourself_screen.dart';
import 'package:colleage_thriver/presentation/tell_us_about_yourself_screen/binding/tell_us_about_yourself_binding.dart';
import 'package:colleage_thriver/presentation/tell_us_about_your_school_screen/tell_us_about_your_school_screen.dart';
import 'package:colleage_thriver/presentation/tell_us_about_your_school_screen/binding/tell_us_about_your_school_binding.dart';
import 'package:colleage_thriver/presentation/become_a_strong_candidate_screen/become_a_strong_candidate_screen.dart';
import 'package:colleage_thriver/presentation/become_a_strong_candidate_screen/binding/become_a_strong_candidate_binding.dart';
import 'package:colleage_thriver/presentation/organize_your_application_screen/organize_your_application_screen.dart';
import 'package:colleage_thriver/presentation/organize_your_application_screen/binding/organize_your_application_binding.dart';
import 'package:colleage_thriver/presentation/choose_the_right_college_screen/choose_the_right_college_screen.dart';
import 'package:colleage_thriver/presentation/choose_the_right_college_screen/binding/choose_the_right_college_binding.dart';
import 'package:colleage_thriver/presentation/find_scholarships_screen/find_scholarships_screen.dart';
import 'package:colleage_thriver/presentation/find_scholarships_screen/binding/find_scholarships_binding.dart';
import 'package:colleage_thriver/presentation/top_students_screen/top_students_screen.dart';
import 'package:colleage_thriver/presentation/top_students_screen/binding/top_students_binding.dart';
import 'package:colleage_thriver/presentation/rewards_screen/rewards_screen.dart';
import 'package:colleage_thriver/presentation/rewards_screen/binding/rewards_binding.dart';
import 'package:colleage_thriver/presentation/take_personality_quiz_screen/take_personality_quiz_screen.dart';
import 'package:colleage_thriver/presentation/take_personality_quiz_screen/binding/take_personality_quiz_binding.dart';
import 'package:colleage_thriver/presentation/take_career_assessment_screen/take_career_assessment_screen.dart';
import 'package:colleage_thriver/presentation/take_career_assessment_screen/binding/take_career_assessment_binding.dart';
import 'package:colleage_thriver/presentation/meet_counselor_or_advisor_screen/meet_counselor_or_advisor_screen.dart';
import 'package:colleage_thriver/presentation/meet_counselor_or_advisor_screen/binding/meet_counselor_or_advisor_binding.dart';
import 'package:colleage_thriver/presentation/choose_potential_majors_screen/choose_potential_majors_screen.dart';
import 'package:colleage_thriver/presentation/choose_potential_majors_screen/binding/choose_potential_majors_binding.dart';
import 'package:colleage_thriver/presentation/join_extracurriculars_screen/join_extracurriculars_screen.dart';
import 'package:colleage_thriver/presentation/join_extracurriculars_screen/binding/join_extracurriculars_binding.dart';
import 'package:colleage_thriver/presentation/explore_advanced_classes_screen/explore_advanced_classes_screen.dart';
import 'package:colleage_thriver/presentation/explore_advanced_classes_screen/binding/explore_advanced_classes_binding.dart';
import 'package:colleage_thriver/presentation/take_sat_act_test_screen/take_sat_act_test_screen.dart';
import 'package:colleage_thriver/presentation/take_sat_act_test_screen/binding/take_sat_act_test_binding.dart';
import 'package:colleage_thriver/presentation/create_college_checklist_screen/create_college_checklist_screen.dart';
import 'package:colleage_thriver/presentation/create_college_checklist_screen/binding/create_college_checklist_binding.dart';
import 'package:colleage_thriver/presentation/visit_colleges_page/binding/visit_college_page_binding.dart';
import 'package:colleage_thriver/presentation/write_college_essays_screen/write_college_essays_screen.dart';
import 'package:colleage_thriver/presentation/write_college_essays_screen/binding/write_college_essays_binding.dart';
import 'package:colleage_thriver/presentation/ask_for_recommendations_screen/ask_for_recommendations_screen.dart';
import 'package:colleage_thriver/presentation/ask_for_recommendations_screen/binding/ask_for_recommendations_binding.dart';
import 'package:colleage_thriver/presentation/send_sat_act_scores_screen/send_sat_act_scores_screen.dart';
import 'package:colleage_thriver/presentation/send_sat_act_scores_screen/binding/send_sat_act_scores_binding.dart';
import 'package:colleage_thriver/presentation/submit_applications_tab_container_screen/submit_applications_tab_container_screen.dart';
import 'package:colleage_thriver/presentation/submit_applications_tab_container_screen/binding/submit_applications_tab_container_binding.dart';
import 'package:colleage_thriver/presentation/attend_college_fairs_screen/attend_college_fairs_screen.dart';
import 'package:colleage_thriver/presentation/attend_college_fairs_screen/binding/attend_college_fairs_binding.dart';
import 'package:colleage_thriver/presentation/choose_your_college_screen/choose_your_college_screen.dart';
import 'package:colleage_thriver/presentation/choose_your_college_screen/binding/choose_your_college_binding.dart';
import 'package:colleage_thriver/presentation/search_for_scholarships_screen/search_for_scholarships_screen.dart';
import 'package:colleage_thriver/presentation/search_for_scholarships_screen/binding/search_for_scholarships_binding.dart';
import 'package:colleage_thriver/presentation/create_a_shortlist_screen/create_a_shortlist_screen.dart';
import 'package:colleage_thriver/presentation/create_a_shortlist_screen/binding/create_a_shortlist_binding.dart';
import 'package:colleage_thriver/presentation/apply_to_scholarships_screen/apply_to_scholarships_screen.dart';
import 'package:colleage_thriver/presentation/apply_to_scholarships_screen/binding/apply_to_scholarships_binding.dart';
import 'package:colleage_thriver/presentation/congratulations_screen/congratulations_screen.dart';
import 'package:colleage_thriver/presentation/congratulations_screen/binding/congratulations_binding.dart';
import 'package:colleage_thriver/presentation/slider_from_bottom_for_album_screen/slider_from_bottom_for_album_screen.dart';
import 'package:colleage_thriver/presentation/slider_from_bottom_for_album_screen/binding/slider_from_bottom_for_album_binding.dart';
import 'package:colleage_thriver/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:colleage_thriver/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:colleage_thriver/presentation/new_password_screen/new_password_screen.dart';
import 'package:colleage_thriver/presentation/new_password_screen/binding/new_password_binding.dart';
import 'package:colleage_thriver/presentation/mentors_screen/mentors_screen.dart';
import 'package:colleage_thriver/presentation/mentors_screen/binding/mentors_binding.dart';
import 'package:colleage_thriver/presentation/messages_screen/messages_screen.dart';
import 'package:colleage_thriver/presentation/messages_screen/binding/messages_binding.dart';
import 'package:colleage_thriver/presentation/search/top_students_one_screen.dart';
import 'package:colleage_thriver/presentation/search/binding/top_students_one_binding.dart';
import 'package:colleage_thriver/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:colleage_thriver/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';
import '../presentation/apply_to_college_board_page/apply_to_college_board_page.dart';
import '../presentation/favorites_college_screen/binding/favorites_college_binding.dart';
import '../presentation/favorites_college_screen/favorites_college_screen.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_one_screen/binding/get_your_college_matches_one_binding.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_one_screen/get_your_college_matches_one_screen.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_screen/binding/get_your_college_matches_binding.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_screen/get_your_college_matches_screen.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_three_screen/binding/get_your_college_matches_three_binding.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_three_screen/get_your_college_matches_three_screen.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_two_screen/binding/get_your_college_matches_two_binding.dart';
import '../presentation/get_your_college_matches_screens/get_your_college_matches_two_screen/get_your_college_matches_two_screen.dart';
import '../presentation/home_screen/binding/home_screen_binding.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/onboarding_screens/binding/onboarding_1_find_college_binding.dart';
import '../presentation/onboarding_screens/onboarding_1_find_college_screen.dart';
import '../presentation/recommended_colleges_screen/binding/recommended_colleges_one_binding.dart';
import '../presentation/visit_colleges_page/visit_colleges_page.dart';

class AppRoutes {
  static const String onboarding1FindCollegeScreen =
      '/onboarding_1_find_college_screen';

  static const String splashScreen = '/splash_screen';

  static const String onboarding2ConnectWithAMentorScreen =
      '/onboarding_2_connect_with_a_mentor_screen';

  static const String onboarding3FindBestScholarshipScreen =
      '/onboarding_3_find_best_scholarship_screen';

  static const String loginScreen = '/login_screen';
  static const String mapScreen = '/map_screen';

  static const String signupScreen = '/signup_screen';

  static const String tellUsAboutYourselfScreen =
      '/tell_us_about_yourself_screen';

  static const String tellUsAboutYourSchoolScreen =
      '/tell_us_about_your_school_screen';

  static const String homeScreen =
      '/homeScreen';

  static const String becomeAStrongCandidateScreen =
      '/become_a_strong_candidate_screen';

  static const String organizeYourApplicationScreen =
      '/organize_your_application_screen';

  static const String chooseTheRightCollegeScreen =
      '/choose_the_right_college_screen';

  static const String findScholarshipsScreen = '/find_scholarships_screen';

  static const String topStudentsScreen = '/top_students_screen';

  static const String rewardsScreen = '/rewards_screen';

  static const String recommendedCollegeScreen =
      '/recommended_colleges_one_screen';

  static const String favoritesCollegeScreen =
      '/favorites_college_screen';

  static const String getYourCollegeMatchesScreen =
      '/get_your_college_matches_screen';

  static const String getYourCollegeMatchesThreeScreen =
      '/get_your_college_matches_three_screen';

  static const String getYourCollegeMatchesTwoScreen =
      '/get_your_college_matches_two_screen';

  static const String getYourCollegeMatchesOneScreen =
      '/get_your_college_matches_one_screen';

  static const String takePersonalityQuizScreen =
      '/take_personality_quiz_screen';

  static const String takeCareerAssessmentScreen =
      '/take_career_assessment_screen';

  static const String meetCounselorOrAdvisorScreen =
      '/meet_counselor_or_advisor_screen';

  static const String choosePotentialMajorsScreen =
      '/choose_potential_majors_screen';

  static const String joinExtracurricularsScreen =
      '/join_extracurriculars_screen';

  static const String exploreAdvancedClassesScreen =
      '/explore_advanced_classes_screen';

  static const String takeSatActTestScreen = '/take_sat_act_test_screen';

  static const String createCollegeChecklistScreen =
      '/create_college_checklist_screen';

  static const String writeCollegeEssaysScreen = '/write_college_essays_screen';

  static const String askForRecommendationsScreen =
      '/ask_for_recommendations_screen';

  static const String sendSatActScoresScreen = '/send_sat_act_scores_screen';

  static const String submitApplicationsPage = '/submit_applications_page';

  static const String submitApplicationsTabContainerScreen =
      '/submit_applications_tab_container_screen';

  static const String attendCollegeFairsScreen = '/attend_college_fairs_screen';

  static const String visitCollegesPage = '/visit_colleges_page';

  static const String chooseYourCollegeScreen = '/choose_your_college_screen';

  static const String sendYourDepositPage = '/send_your_deposit_page';

  static const String searchForScholarshipsScreen = '/search_for_scholarships_screen';

  static const String createAShortlistScreen = '/create_a_shortlist_screen';

  static const String applyToScholarshipsScreen = '/apply_to_scholarships_screen';

  static const String applyToCollegeBoardPage = '/apply_to_college_board_page';

  static const String fileYourFafsaPage = '/file_your_fafsa_page';

  static const String congratulationsScreen = '/congratulations_screen';

  static const String sliderFromBottomForAlbumScreen =
      '/slider_from_bottom_for_album_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String mentorsScreen = '/mentors_screen';

  static const String messagesScreen = '/messages_screen';

  static const String topStudentsOneScreen = '/top_students_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: onboarding1FindCollegeScreen,
      page: () => Onboarding1FindCollegeScreen(),
      bindings: [
        Onboarding1FindCollegeBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: visitCollegesPage,
      page: () => VisitCollegesPage(),
      bindings: [
        VisitColleagesPageBinding(),
      ],
    ),
    GetPage(
      name: sendYourDepositPage,
      page: () => SendYourDepositPage(),
      // bindings: [
      //   VisitColleagesPageBinding(),
      // ],
    ),GetPage(
      name: applyToCollegeBoardPage,
      page: () => ApplyToCollegeBoardPage(),
      // bindings: [
      //   VisitColleagesPageBinding(),
      // ],
    ),GetPage(
      name: fileYourFafsaPage,
      page: () => FileYourFafsaPage(),
      // bindings: [
      //   VisitColleagesPageBinding(),
      // ],
    ),
    // GetPage(
    //   name: mapScreen,
    //   page: () => MapScreen(),
    //   bindings: [
    //     MapBinding(),
    //   ],
    // ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      bindings: [
        SignupBinding(),
      ],
    ),
    GetPage(
      name: tellUsAboutYourselfScreen,
      page: () => TellUsAboutYourselfScreen(),
      bindings: [
        TellUsAboutYourselfBinding(),
      ],
    ),
    GetPage(
      name: tellUsAboutYourSchoolScreen,
      page: () => TellUsAboutYourSchoolScreen(),
      bindings: [
        TellUsAboutYourSchoolBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeScreenBinding(),
      ],
    ),
    GetPage(
      name: becomeAStrongCandidateScreen,
      page: () => BecomeAStrongCandidateScreen(),
      bindings: [
        BecomeAStrongCandidateBinding(),
      ],
    ),
    GetPage(
      name: organizeYourApplicationScreen,
      page: () => OrganizeYourApplicationScreen(),
      bindings: [
        OrganizeYourApplicationBinding(),
      ],
    ),
    GetPage(
      name: chooseTheRightCollegeScreen,
      page: () => ChooseTheRightCollegeScreen(),
      bindings: [
        ChooseTheRightCollegeBinding(),
      ],
    ),
    GetPage(
      name: findScholarshipsScreen,
      page: () => FindScholarshipsScreen(),
      bindings: [
        FindScholarshipsBinding(),
      ],
    ),
    GetPage(
      name: topStudentsScreen,
      page: () => TopStudentsScreen(),
      bindings: [
        TopStudentsBinding(),
      ],
    ),
    GetPage(
      name: rewardsScreen,
      page: () => RewardsScreen(),
      bindings: [
        RewardsBinding(),
      ],
    ),
    GetPage(
      arguments: Duration,
      name: recommendedCollegeScreen,
      page: () => RecommendedCollegesScreen(),
      bindings: [
        RecommendedCollegesOneBinding(),
      ],
    ),
    GetPage(
      name: favoritesCollegeScreen,
      page: () => FavoritesCollegeScreen(),
      bindings: [
        FavoritesCollegeBinding(),
      ],
    ),
    GetPage(
      name: getYourCollegeMatchesScreen,
      page: () => GetYourCollegeMatchesScreen(),
      bindings: [
        GetYourCollegeMatchesBinding(),
      ],
    ),
    GetPage(
      name: getYourCollegeMatchesThreeScreen,
      page: () => GetYourCollegeMatchesThreeScreen(),
      bindings: [
        GetYourCollegeMatchesThreeBinding(),
      ],
    ),
    GetPage(
      name: getYourCollegeMatchesTwoScreen,
      page: () => GetYourCollegeMatchesTwoScreen(),
      bindings: [
        GetYourCollegeMatchesTwoBinding(),
      ],
    ),
    GetPage(
      name: getYourCollegeMatchesOneScreen,
      page: () => GetYourCollegeMatchesOneScreen(),
      bindings: [
        GetYourCollegeMatchesOneBinding(),
      ],
    ),
    GetPage(
      name: takePersonalityQuizScreen,
      page: () => TakePersonalityQuizScreen(),
      bindings: [
        TakePersonalityQuizBinding(),
      ],
    ),
    GetPage(
      name: takeCareerAssessmentScreen,
      page: () => TakeCareerAssessmentScreen(),
      bindings: [
        TakeCareerAssessmentBinding(),
      ],
    ),
    GetPage(
      name: meetCounselorOrAdvisorScreen,
      page: () => MeetCounselorOrAdvisorScreen(),
      bindings: [
        MeetCounselorOrAdvisorBinding(),
      ],
    ),
    GetPage(
      name: choosePotentialMajorsScreen,
      page: () => ChoosePotentialMajorsScreen(),
      bindings: [
        ChoosePotentialMajorsBinding(),
      ],
    ),
    GetPage(
      name: joinExtracurricularsScreen,
      page: () => JoinExtracurricularsScreen(),
      bindings: [
        JoinExtracurricularsBinding(),
      ],
    ),
    GetPage(
      name: exploreAdvancedClassesScreen,
      page: () => ExploreAdvancedClassesScreen(),
      bindings: [
        ExploreAdvancedClassesBinding(),
      ],
    ),
    GetPage(
      name: takeSatActTestScreen,
      page: () => TakeSatActTestScreen(),
      bindings: [
        TakeSatActTestBinding(),
      ],
    ),
    GetPage(
      name: createCollegeChecklistScreen,
      page: () => CreateCollegeChecklistScreen(),
      bindings: [
        CreateCollegeChecklistBinding(),
      ],
    ),
    GetPage(
      name: writeCollegeEssaysScreen,
      page: () => WriteCollegeEssaysScreen(),
      bindings: [
        WriteCollegeEssaysBinding(),
      ],
    ),
    GetPage(
      name: askForRecommendationsScreen,
      page: () => AskForRecommendationsScreen(),
      bindings: [
        AskForRecommendationsBinding(),
      ],
    ),
    GetPage(
      name: sendSatActScoresScreen,
      page: () => SendSatActScoresScreen(),
      bindings: [
        SendSatActScoresBinding(),
      ],
    ),
    GetPage(
      name: submitApplicationsTabContainerScreen,
      page: () => SubmitApplicationsTabContainerScreen(),
      bindings: [
        SubmitApplicationsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: attendCollegeFairsScreen,
      page: () => AttendCollegeFairsScreen(),
      bindings: [
        AttendCollegeFairsBinding(),
      ],
    ),
    GetPage(
      name: chooseYourCollegeScreen,
      page: () => ChooseYourCollegeScreen(),
      bindings: [
        ChooseYourCollegeBinding(),
      ],
    ),
    GetPage(
      name: searchForScholarshipsScreen,
      page: () => SearchForScholarshipsScreen(),
      bindings: [
        SearchForScholarshipsBinding(),
      ],
    ),
    GetPage(
      name: createAShortlistScreen,
      page: () => CreateAShortlistScreen(),
      bindings: [
        CreateAShortlistBinding(),
      ],
    ),
    GetPage(
      name: applyToScholarshipsScreen,
      page: () => ApplyToScholarshipsScreen(),
      bindings: [
        ApplyToScholarshipsBinding(),
      ],
    ),
    GetPage(
      name: congratulationsScreen,
      page: () => CongratulationsScreen(),
      bindings: [
        CongratulationsBinding(),
      ],
    ),
    GetPage(
      name: sliderFromBottomForAlbumScreen,
      page: () => SliderFromBottomForAlbumScreen(),
      bindings: [
        SliderFromBottomForAlbumBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: newPasswordScreen,
      page: () => NewPasswordScreen(),
      bindings: [
        NewPasswordBinding(),
      ],
    ),
    GetPage(
      name: mentorsScreen,
      page: () => MentorsScreen(),
      bindings: [
        MentorsBinding(),
      ],
    ),
    GetPage(
      name: messagesScreen,
      page: () => MessagesScreen(),
      bindings: [
        MessagesBinding(),
      ],
    ),
    GetPage(
      name: topStudentsOneScreen,
      page: () => TopStudentsOneScreen(),
      bindings: [
        TopStudentsOneBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];


}
