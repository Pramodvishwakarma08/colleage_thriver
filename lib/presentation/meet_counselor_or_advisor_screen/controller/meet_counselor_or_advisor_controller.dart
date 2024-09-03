import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/meet_counselor_or_advisor_screen/models/meet_counselor_or_advisor_model.dart';import 'package:flutter/material.dart';/// A controller class for the MeetCounselorOrAdvisorScreen.
///
/// This class manages the state of the MeetCounselorOrAdvisorScreen, including the
/// current meetCounselorOrAdvisorModelObj
class MeetCounselorOrAdvisorController extends GetxController {TextEditingController enterCollegeOrCareerGoalController = TextEditingController();

Rx<MeetCounselorOrAdvisorModel> meetCounselorOrAdvisorModelObj = MeetCounselorOrAdvisorModel().obs;

@override void onClose() { super.onClose(); enterCollegeOrCareerGoalController.dispose(); } 
 }
