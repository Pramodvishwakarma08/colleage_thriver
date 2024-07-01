import '../controller/create_college_checklist_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateCollegeChecklistScreen.
///
/// This class ensures that the CreateCollegeChecklistController is created when the
/// CreateCollegeChecklistScreen is first loaded.
class CreateCollegeChecklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCollegeChecklistController());
  }
}
