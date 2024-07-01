import '../controller/favorites_college_screen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TopStudentsOneScreen.
///
/// This class ensures that the TopStudentsOneController is created when the
/// TopStudentsOneScreen is first loaded.
class FavoritesCollegeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesCollegeController());
  }
}
