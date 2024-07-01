import 'package:colleage_thriver/core/app_export.dart';import 'package:colleage_thriver/presentation/write_college_essays_screen/models/write_college_essays_model.dart';/// A controller class for the WriteCollegeEssaysScreen.
///
/// This class manages the state of the WriteCollegeEssaysScreen, including the
/// current writeCollegeEssaysModelObj
class WriteCollegeEssaysController extends GetxController {Rx<WriteCollegeEssaysModel> writeCollegeEssaysModelObj = WriteCollegeEssaysModel().obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in writeCollegeEssaysModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} writeCollegeEssaysModelObj.value.dropdownItemList.refresh(); } 
 }
