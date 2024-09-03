import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/submit_applications_tab_container_screen/models/submit_applications_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SubmitApplicationsTabContainerScreen.
///
/// This class manages the state of the SubmitApplicationsTabContainerScreen, including the
/// current submitApplicationsTabContainerModelObj
class SubmitApplicationsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<SubmitApplicationsTabContainerModel>
      submitApplicationsTabContainerModelObj =
      SubmitApplicationsTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
