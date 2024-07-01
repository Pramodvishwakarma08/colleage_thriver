import '../../../core/app_export.dart';/// This class is used in the [cardlist1_item_widget] screen.
class Cardlist1ItemModel {Cardlist1ItemModel({this.activityImage, this.activityText, this.collegeOptionsText, this.chancesText, this.id, }) { activityImage = activityImage  ?? Rx(ImageConstant.imgFrame4273207486);activityText = activityText  ?? Rx("Activity 7 of 8");collegeOptionsText = collegeOptionsText  ?? Rx("Explore your\rcollege options");chancesText = chancesText  ?? Rx("Improve your chances\rof getting into college");id = id  ?? Rx(""); }

Rx<String>? activityImage;

Rx<String>? activityText;

Rx<String>? collegeOptionsText;

Rx<String>? chancesText;

Rx<String>? id;

 }
