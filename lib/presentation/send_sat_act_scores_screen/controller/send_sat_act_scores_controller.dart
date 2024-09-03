import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/send_sat_act_scores_screen/models/send_sat_act_scores_model.dart';import 'package:flutter/material.dart';/// A controller class for the SendSatActScoresScreen.
///
/// This class manages the state of the SendSatActScoresScreen, including the
/// current sendSatActScoresModelObj
class SendSatActScoresController extends GetxController {TextEditingController scoreEditTextController = TextEditingController();

TextEditingController nameEditTextController = TextEditingController();

Rx<SendSatActScoresModel> sendSatActScoresModelObj = SendSatActScoresModel().obs;

@override void onClose() { super.onClose(); scoreEditTextController.dispose(); nameEditTextController.dispose(); } 
 }
