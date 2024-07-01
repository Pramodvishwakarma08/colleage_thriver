import '../controller/apply_to_scholarships_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ApplyToScholarshipsScreen.
///
/// This class ensures that the ApplyToScholarshipsController is created when the
/// ApplyToScholarshipsScreen is first loaded.
class ApplyToScholarshipsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyToScholarshipsController());
  }
}
