import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/take_personality_quiz_screen/models/take_personality_quiz_model.dart';import 'package:flutter/material.dart';/// A controller class for the TakePersonalityQuizScreen.
///
/// This class manages the state of the TakePersonalityQuizScreen, including the
/// current takePersonalityQuizModelObj
class TakePersonalityQuizController extends GetxController {TextEditingController enterResultsController = TextEditingController();

Rx<TakePersonalityQuizModel> takePersonalityQuizModelObj = TakePersonalityQuizModel().obs;

@override void onClose() { super.onClose(); enterResultsController.dispose(); } 
 }
