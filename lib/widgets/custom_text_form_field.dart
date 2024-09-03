// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colleage_thriver/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.inputFormatters,
    this.onTap,
    this.autovalidateMode,
    this.disableUserInput,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final bool? disableUserInput;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  Function()? onEditingComplete;
  Function(String)? onChanged;

  Function(String?)? onSaved;
  Function()? onTap;

  AutovalidateMode? autovalidateMode;
  List<TextInputFormatter>? inputFormatters;




  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
         onTap: onTap,
        onEditingComplete: onEditingComplete,
          autovalidateMode: autovalidateMode,
          onChanged:onChanged ,
          onSaved: onSaved,
          scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          controller: controller,
          enabled: disableUserInput ==true ? false : true,
          // focusNode: focusNode ?? FocusNode(),
          // autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.titleSmallBlack90001Medium,
          obscureText: obscureText!,
          inputFormatters: inputFormatters ?? null,
          // textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.titleSmallBlack90001Medium,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 12.v,
            ),
        fillColor: fillColor ?? appTheme.whiteA700,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(
                color: appTheme.gray60001,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(
                color: appTheme.gray60001,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(
                color: appTheme.gray60001,
                width: 1,
              ),
            ),
      );
}


// class MyTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final Alignment? alignment;
//
//   final double? width;
//
//   final TextEditingController? scrollPadding;
//
//   final FocusNode? focusNode;
//
//   final bool? autofocus;
//
//   final TextStyle? textStyle;
//
//   final bool? obscureText;
//
//   final TextInputAction? textInputAction;
//
//   final TextInputType? textInputType;
//
//   final int? maxLines;
//
//   final String? hintText;
//
//   final TextStyle? hintStyle;
//
//   final Widget? prefix;
//
//   final BoxConstraints? prefixConstraints;
//
//   final Widget? suffix;
//
//   final BoxConstraints? suffixConstraints;
//
//   final EdgeInsets? contentPadding;
//
//   final InputBorder? borderDecoration;
//
//   final Color? fillColor;
//
//   final bool? filled;
//   final FormFieldValidator<String>? validator;
//
//
//   MyTextFormField({Key?key,
//      this.controller,
//      this.alignment,
//      this.width,
//      this.scrollPadding,
//      this.focusNode,
//      this.autofocus = true,
//      this.textStyle,
//      this.obscureText = false,
//      this.textInputAction = TextInputAction.next,
//      this.textInputType = TextInputType.text,
//      this.maxLines,
//      this.hintText,
//      this.hintStyle,
//      this.prefix,
//      this.prefixConstraints,
//      this.suffix,
//      this.suffixConstraints,
//      this.contentPadding,
//      this.borderDecoration,
//      this.fillColor,
//      this.filled = true,
//      this.validator,
//
//    }): super(key: key,);
//
//   @override
//   Widget build(BuildContext context) {
//     return   TextFormField(
//       // scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
//       controller: controller,
//       // focusNode: focusNode ?? FocusNode(),
//       // autofocus: autofocus!,
//       style: textStyle ?? CustomTextStyles.titleSmallBlack90001Medium,
//       obscureText: obscureText!,
//       textInputAction: textInputAction,
//       keyboardType: textInputType,
//       maxLines: maxLines ?? 1,
//       decoration: decoration,
//       validator: validator,
//     );
//   }
//   InputDecoration get decoration => InputDecoration(
//     hintText: hintText ?? "",
//     hintStyle: hintStyle ?? CustomTextStyles.titleSmallBlack90001Medium,
//     prefixIcon: prefix,
//     prefixIconConstraints: prefixConstraints,
//     suffixIcon: suffix,
//     suffixIconConstraints: suffixConstraints,
//     isDense: true,
//     contentPadding: contentPadding ??
//         EdgeInsets.symmetric(
//           horizontal: 10.h,
//           vertical: 12.v,
//         ),
//     fillColor: fillColor ?? appTheme.whiteA700,
//     filled: filled,
//     border: borderDecoration ??
//         OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.h),
//           borderSide: BorderSide(
//             color: appTheme.gray60001,
//             width: 1,
//           ),
//         ),
//     enabledBorder: borderDecoration ??
//         OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.h),
//           borderSide: BorderSide(
//             color: appTheme.gray60001,
//             width: 1,
//           ),
//         ),
//     focusedBorder: borderDecoration ??
//         OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12.h),
//           borderSide: BorderSide(
//             color: appTheme.gray60001,
//             width: 1,
//           ),
//         ),
//   );
// }