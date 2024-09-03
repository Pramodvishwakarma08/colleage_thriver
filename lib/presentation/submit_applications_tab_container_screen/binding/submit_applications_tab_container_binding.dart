import '../controller/submit_applications_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SubmitApplicationsTabContainerScreen.
///
/// This class ensures that the SubmitApplicationsTabContainerController is created when the
/// SubmitApplicationsTabContainerScreen is first loaded.
class SubmitApplicationsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubmitApplicationsTabContainerController());
  }
}
