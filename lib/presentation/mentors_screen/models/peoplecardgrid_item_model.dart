import '../../../core/app_export.dart';/// This class is used in the [peoplecardgrid_item_widget] screen.
class PeoplecardgridItemModel {PeoplecardgridItemModel({this.userImage, this.title, this.subtitle, this.description, this.id, }) { userImage = userImage  ?? Rx(ImageConstant.imgFrame1752);title = title  ?? Rx("Gretchen Rosser");subtitle = subtitle  ?? Rx("Web Dev");description = description  ?? Rx("MIT Boston");id = id  ?? Rx(""); }

Rx<String>? userImage;

Rx<String>? title;

Rx<String>? subtitle;

Rx<String>? description;

Rx<String>? id;

 }
