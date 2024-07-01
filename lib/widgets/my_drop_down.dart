// // ignore_for_file: must_be_immutable
//
// import 'package:flutter/material.dart';
// import 'package:colleage_thriver/core/app_export.dart';
// import 'package:colleage_thriver/presentation/tell_us_about_yourself_screen/controller/tell_us_about_yourself_controller.dart';
//
// class CustomDropdownTextField extends StatefulWidget {
//   String? selectedItem;
//   String? hintText;
//   List<String> listnames;
//
//   CustomDropdownTextField({
//     required this.selectedItem,
//     this.hintText,
//     required this.listnames,
//   });
//
//   @override
//   _CustomDropdownTextFieldState createState() =>
//       _CustomDropdownTextFieldState();
//
//   // Function to get the selected value
//   String? getSelectedValue() {
//     return selectedItem;
//   }
// }
//
// class _CustomDropdownTextFieldState extends State<CustomDropdownTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10.h),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           isExpanded: true,
//           hint: Padding(
//             padding: const EdgeInsets.only(left: 10.0),
//             child: Text(
//               "${widget.hintText}",
//               style: CustomTextStyles.titleSmallBlack90001Medium,
//             ),
//           ),
//           value: widget.selectedItem,
//           onChanged: (String? newValue) {
//             setState(() {
//               widget.selectedItem = newValue;
//               gobalSelected = newValue!;
//             });
//           },
//           items: widget.listnames
//               .map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: Text(
//                   value,
//                   overflow: TextOverflow.ellipsis,
//                   style: CustomTextStyles.titleSmallBlack90001Medium,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
