import '../controller/write_college_essays_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WriteCollegeEssaysScreen.
///
/// This class ensures that the WriteCollegeEssaysController is created when the
/// WriteCollegeEssaysScreen is first loaded.
class WriteCollegeEssaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WriteCollegeEssaysController());
  }
}
