import '../controller/send_sat_act_scores_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SendSatActScoresScreen.
///
/// This class ensures that the SendSatActScoresController is created when the
/// SendSatActScoresScreen is first loaded.
class SendSatActScoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendSatActScoresController());
  }
}
