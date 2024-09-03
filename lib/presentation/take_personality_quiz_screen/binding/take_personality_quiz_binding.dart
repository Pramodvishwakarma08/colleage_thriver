import '../controller/take_personality_quiz_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TakePersonalityQuizScreen.
///
/// This class ensures that the TakePersonalityQuizController is created when the
/// TakePersonalityQuizScreen is first loaded.
class TakePersonalityQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TakePersonalityQuizController());
  }
}
