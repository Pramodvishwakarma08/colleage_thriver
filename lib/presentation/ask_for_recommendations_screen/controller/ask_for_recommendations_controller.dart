import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/ask_for_recommendations_screen/models/ask_for_recommendations_model.dart';import 'package:flutter/material.dart';/// A controller class for the AskForRecommendationsScreen.
///
/// This class manages the state of the AskForRecommendationsScreen, including the
/// current askForRecommendationsModelObj
class AskForRecommendationsController extends GetxController {TextEditingController enterRecommendationListController = TextEditingController();

Rx<AskForRecommendationsModel> askForRecommendationsModelObj = AskForRecommendationsModel().obs;

@override void onClose() { super.onClose(); enterRecommendationListController.dispose(); } 
 }
