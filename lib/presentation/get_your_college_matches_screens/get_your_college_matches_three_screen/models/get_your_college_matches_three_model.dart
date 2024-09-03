import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:colleage_thriver/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [get_your_college_matches_three_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class GetYourCollegeMatchesThreeModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);
}
