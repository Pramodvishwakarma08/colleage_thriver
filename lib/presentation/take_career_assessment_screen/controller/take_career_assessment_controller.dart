import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/take_career_assessment_screen/models/take_career_assessment_model.dart';import 'package:flutter/material.dart';/// A controller class for the TakeCareerAssessmentScreen.
///
/// This class manages the state of the TakeCareerAssessmentScreen, including the
/// current takeCareerAssessmentModelObj
class TakeCareerAssessmentController extends GetxController {TextEditingController enterResultsValueEditTextController = TextEditingController();

Rx<TakeCareerAssessmentModel> takeCareerAssessmentModelObj = TakeCareerAssessmentModel().obs;

@override void onClose() { super.onClose(); enterResultsValueEditTextController.dispose(); } 
 }
