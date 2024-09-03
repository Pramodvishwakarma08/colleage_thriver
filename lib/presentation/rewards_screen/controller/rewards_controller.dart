import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/rewards_screen/models/rewards_model.dart';/// A controller class for the RewardsScreen.
///
/// This class manages the state of the RewardsScreen, including the
/// current rewardsModelObj
class RewardsController extends GetxController {Rx<RewardsModel> rewardsModelObj = RewardsModel().obs;

 }
