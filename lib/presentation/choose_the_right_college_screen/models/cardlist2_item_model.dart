import '../../../core/app_export.dart';/// This class is used in the [cardlist2_item_widget] screen.
class Cardlist2ItemModel {Cardlist2ItemModel({this.activityImage, this.activityText, this.exploreText, this.improveText, this.id, }) { activityImage = activityImage  ?? Rx(ImageConstant.imgFrame42732074810);activityText = activityText  ?? Rx("Activity 7 of 8");exploreText = exploreText  ?? Rx("Explore your\rcollege options");improveText = improveText  ?? Rx("Improve your chances\rof getting into college");id = id  ?? Rx(""); }

Rx<String>? activityImage;

Rx<String>? activityText;

Rx<String>? exploreText;

Rx<String>? improveText;

Rx<String>? id;

 }
