import '../controller/recommended_colleges_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RecommendedCollegesOneScreen.
///
/// This class ensures that the RecommendedCollegesOneController is created when the
/// RecommendedCollegesOneScreen is first loaded.
class RecommendedCollegesOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendedCollegesOneController());
  }
}
