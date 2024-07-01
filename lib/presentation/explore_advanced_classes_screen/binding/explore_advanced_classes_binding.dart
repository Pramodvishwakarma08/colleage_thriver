import '../controller/explore_advanced_classes_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExploreAdvancedClassesScreen.
///
/// This class ensures that the ExploreAdvancedClassesController is created when the
/// ExploreAdvancedClassesScreen is first loaded.
class ExploreAdvancedClassesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExploreAdvancedClassesController());
  }
}
