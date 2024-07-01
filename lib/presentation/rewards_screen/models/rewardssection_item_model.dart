import '../../../core/app_export.dart';/// This class is used in the [rewardssection_item_widget] screen.
class RewardssectionItemModel {RewardssectionItemModel({this.scholarshipText, this.id, }) { scholarshipText = scholarshipText  ?? Rx("250 Scholarship");id = id  ?? Rx(""); }

Rx<String>? scholarshipText;

Rx<String>? id;

 }
