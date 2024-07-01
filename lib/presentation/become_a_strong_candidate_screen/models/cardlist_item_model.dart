import '../../../core/app_export.dart';

/// This class is used in the [cardlist_item_widget] screen.
class CardlistItemModel {
  CardlistItemModel({
    this.activityImage,
    this.activityText,
    this.collegeOptionsText,
    this.chancesText,
    this.id,
  }) {
    activityImage = activityImage ?? Rx(ImageConstant.imgFrame427320748141x340);
    activityText = activityText ?? Rx("Activity 7 of 8");
    collegeOptionsText = collegeOptionsText ?? Rx("Explore your\rcollege options");
    chancesText = chancesText ?? Rx("Improve your chances\rof getting into college");
    id = id ?? Rx("");
  }

  Rx<String>? activityImage;

  Rx<String>? activityText;

  Rx<String>? collegeOptionsText;

  Rx<String>? chancesText;

  Rx<String>? id;
}
