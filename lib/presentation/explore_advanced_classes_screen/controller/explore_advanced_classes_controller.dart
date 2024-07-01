import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/explore_advanced_classes_screen/models/explore_advanced_classes_model.dart';import 'package:flutter/material.dart';/// A controller class for the ExploreAdvancedClassesScreen.
///
/// This class manages the state of the ExploreAdvancedClassesScreen, including the
/// current exploreAdvancedClassesModelObj
class ExploreAdvancedClassesController extends GetxController {TextEditingController nameController = TextEditingController();

Rx<ExploreAdvancedClassesModel> exploreAdvancedClassesModelObj = ExploreAdvancedClassesModel().obs;

@override void onClose() { super.onClose(); nameController.dispose(); } 
 }
