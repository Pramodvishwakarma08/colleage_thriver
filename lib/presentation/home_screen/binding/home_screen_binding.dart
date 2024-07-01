import '../controller/home_screen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the YourRoadmapToCollegeScreen.
///
/// This class ensures that the YourRoadmapToCollegeController is created when the
/// YourRoadmapToCollegeScreen is first loaded.
class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => HomePageCollegeController(),);
    Get.put(HomePageCollegeController(),permanent: true);
  }
}
