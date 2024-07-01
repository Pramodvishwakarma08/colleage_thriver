import '../../../core/app_export.dart';

/// This class defines the variables used in the [tell_us_about_your_school_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TellUsAboutYourSchoolModel {
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  Rx<List<SelectionPopupModel>> dropdownItemListYearInSchool = Rx([
    SelectionPopupModel(
      id: 1,
      title: "2010",
    ),
    SelectionPopupModel(
      id: 2,
      title: "2011",
      isSelected: true
    ),
    SelectionPopupModel(
      id: 3,
      title: "2013",
    ),
    SelectionPopupModel(
      id: 4,
      title: "2014",
    ),
    SelectionPopupModel(
      id: 5,
      title: "2015",
    ),
    SelectionPopupModel(
      id: 6,
      title: "2016",
    ),
    SelectionPopupModel(
      id: 7,
      title: "2017",
    ),
    SelectionPopupModel(
      id: 8,
      title: "2018",
    ),
    SelectionPopupModel(
      id: 9,
      title: "2019",
    ),
    SelectionPopupModel(
      id: 10,
      title: "2021",
    ),
    SelectionPopupModel(
      id: 11,
      title: "2022",
    ),
    SelectionPopupModel(
      id: 12,
      title: "2023",
    ),
    SelectionPopupModel(
      id: 13,
      title: "2024",
    ),
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemListHighScholMonth = Rx([
    SelectionPopupModel(
      id: 1,
      title: "January",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "February",
    ),
    SelectionPopupModel(
      id: 3,
      title: "March",
    ),
    SelectionPopupModel(
      id: 4,
      title: "April",
    ),
    SelectionPopupModel(
      id: 5,
      title: "May",
    ),
    SelectionPopupModel(
      id: 6,
      title: "June",
    ),
    SelectionPopupModel(
      id: 7,
      title: "July",
    ),
    SelectionPopupModel(
      id: 8,
      title: "August",
    ),
    SelectionPopupModel(
      id: 9,
      title: "September",
    ),
    SelectionPopupModel(
      id: 10,
      title: "October",
    ),
    SelectionPopupModel(
      id: 11,
      title: "November",
    ),
    SelectionPopupModel(
      id: 12,
      title: "December",
    ),
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemListHighScholYear = Rx([
    SelectionPopupModel(
      id: 1,
      title: "2010",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "2011",
    ),
    SelectionPopupModel(
      id: 3,
      title: "2013",
    ),
    SelectionPopupModel(
      id: 4,
      title: "2014",
    ),
    SelectionPopupModel(
      id: 5,
      title: "2015",
    ),
    SelectionPopupModel(
      id: 6,
      title: "2016",
    ),
    SelectionPopupModel(
      id: 7,
      title: "2017",
    ),
    SelectionPopupModel(
      id: 8,
      title: "2018",
    ),
    SelectionPopupModel(
      id: 9,
      title: "2019",
    ),
    SelectionPopupModel(
      id: 10,
      title: "2021",
    ),
    SelectionPopupModel(
      id: 11,
      title: "2022",
    ),
    SelectionPopupModel(
      id: 12,
      title: "2023",
    ),
    SelectionPopupModel(
      id: 13,
      title: "2024",
    ),
  ]);
}
