import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/choose_potential_majors_screen/models/choose_potential_majors_model.dart';import 'package:flutter/material.dart';/// A controller class for the ChoosePotentialMajorsScreen.
///
/// This class manages the state of the ChoosePotentialMajorsScreen, including the
/// current choosePotentialMajorsModelObj
class ChoosePotentialMajorsController extends GetxController {TextEditingController enterpotentialmajorsController = TextEditingController();

Rx<ChoosePotentialMajorsModel> choosePotentialMajorsModelObj = ChoosePotentialMajorsModel().obs;

@override void onClose() { super.onClose(); enterpotentialmajorsController.dispose(); } 
 }
