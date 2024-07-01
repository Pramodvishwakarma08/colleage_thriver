import 'package:get/get.dart';
import 'package:colleage_thriver/presentation/visit_colleges_page/controller/visit_colleges_controller.dart';

/// A binding class for the SubmitApplicationsTabContainerScreen.
///
/// This class ensures that the SubmitApplicationsTabContainerController is created when the
/// SubmitApplicationsTabContainerScreen is first loaded.
class VisitColleagesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>VisitCollegesController());
  }
}
