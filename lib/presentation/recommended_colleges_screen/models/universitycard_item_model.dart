import '../../../core/app_export.dart';

/// This class is used in the [universitycard_item_widget] screen.
class UniversitycardItemModel {
  UniversitycardItemModel({
    this.universityImage,
    this.universityHeading,
    this.locationText,
    this.acceptance,
    this.averageACT,
    this.averageGPA,
    this.averageSAT,
  }) {
    universityImage =
        universityImage ?? Rx(ImageConstant.imgFrame427320748147x169);
    universityHeading =
        universityHeading ?? Rx("University of Alabama at Birmingham");
    locationText = locationText ?? Rx("Birmingham, AL");
    acceptance = acceptance ?? Rx("");
    averageGPA = averageGPA ?? Rx("");
    averageSAT = averageSAT ?? Rx("");
    averageACT = averageACT ?? Rx("");
  }

  Rx<String>? universityImage;

  Rx<String>? universityHeading;

  Rx<String>? locationText;

  // Rx<UniversitydetailsItemModel>? presntagelist;

  Rx<String>? acceptance;
  Rx<String>? averageGPA;
  Rx<String>? averageSAT;
  Rx<String>? averageACT;
}

// // import '../../../core/app_export.dart';
// //
// /// This class is used in the [universitydetails_item_widget] screen.
// class University {
//   UniversitydetailsItemModel({
//     this.image,
//     this.text1,
//     this.text2,
//     this.id,
//   }) {
//     image = image ?? Rx(ImageConstant.imgImage1624);
//     text1 = text1 ?? Rx("Acceptance-");
//     text2 = text2 ?? Rx("81%");
//     id = id ?? Rx("");
//   }
//
//   Rx<String>? image;
//
//   Rx<String>? text1;
//
//   Rx<String>? text2;
//
//   Rx<String>? id;
// }
