import '../../../core/app_export.dart';
import 'rewardssection_item_model.dart';

/// This class defines the variables used in the [rewards_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RewardsModel {
  Rx<List<RewardssectionItemModel>> rewardssectionItemList = Rx([
    RewardssectionItemModel(scholarshipText: "250 Scholarship".obs),
    RewardssectionItemModel(scholarshipText: "75 Amazon Giftcard".obs),
    RewardssectionItemModel(
        scholarshipText: "1 Hour Free\r\nScholarship Session".obs),
    RewardssectionItemModel(
        scholarshipText: "30 Minute Free\r\nScholarship Session".obs)
  ]);
}
