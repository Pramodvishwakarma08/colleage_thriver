import '../controller/ask_for_recommendations_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AskForRecommendationsScreen.
///
/// This class ensures that the AskForRecommendationsController is created when the
/// AskForRecommendationsScreen is first loaded.
class AskForRecommendationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AskForRecommendationsController());
  }
}
