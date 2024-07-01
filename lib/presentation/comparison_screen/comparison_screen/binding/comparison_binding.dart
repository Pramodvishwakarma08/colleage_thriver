import '../controller/comparison_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ComparisonScreen.
///
/// This class ensures that the ComparisonController is created when the
/// ComparisonScreen is first loaded.
class ComparisonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComparisonController());
  }
}
