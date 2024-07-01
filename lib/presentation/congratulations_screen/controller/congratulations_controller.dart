import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/congratulations_screen/models/congratulations_model.dart';/// A controller class for the CongratulationsScreen.
///
/// This class manages the state of the CongratulationsScreen, including the
/// current congratulationsModelObj
class CongratulationsController extends GetxController {Rx<CongratulationsModel> congratulationsModelObj = CongratulationsModel().obs;

 }
