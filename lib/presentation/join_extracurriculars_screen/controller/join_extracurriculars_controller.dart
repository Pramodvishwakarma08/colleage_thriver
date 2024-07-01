import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/join_extracurriculars_screen/models/join_extracurriculars_model.dart';import 'package:flutter/material.dart';/// A controller class for the JoinExtracurricularsScreen.
///
/// This class manages the state of the JoinExtracurricularsScreen, including the
/// current joinExtracurricularsModelObj
class JoinExtracurricularsController extends GetxController {TextEditingController enteractivitiesController = TextEditingController();

Rx<JoinExtracurricularsModel> joinExtracurricularsModelObj = JoinExtracurricularsModel().obs;

@override void onClose() { super.onClose(); enteractivitiesController.dispose(); } 
 }
