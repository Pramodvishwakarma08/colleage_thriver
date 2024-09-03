// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';

class CustomDropdownTextField extends StatelessWidget {
  final String? selectedItem;
  final String? hintText;
  final List<DropdownMenuItem<String>> dropdownItemsList;
  final Function(String?) onSelect;

  const CustomDropdownTextField({
    Key? key,
    this.selectedItem,
    required this.dropdownItemsList,
    required this.onSelect,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      onChanged: onSelect,
      items: dropdownItemsList,
      decoration: decoration,
      style: CustomTextStyles.titleSmallBlack90001Medium,
      icon: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          Icons.arrow_drop_down_rounded,
          color: appTheme.primary,
        ),
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
        hintStyle: CustomTextStyles.titleSmallBlack90001Medium,
        isDense: true,
        contentPadding: EdgeInsets.only(
          left: 10.h,
          top: 10.v,
          bottom: 10.v,
        ),
        fillColor: appTheme.whiteA700,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60002,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60002,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60001,
            width: 1,
          ),
        ),
      );
}
