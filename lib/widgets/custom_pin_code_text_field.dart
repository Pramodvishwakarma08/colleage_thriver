
// class CustomPinCodeTextField extends StatelessWidget {
//   CustomPinCodeTextField({
//     Key? key,
//     required this.context,
//     required this.onChanged,
//     this.alignment,
//     this.controller,
//     this.textStyle,
//     this.hintStyle,
//     this.validator,
//   }) : super(
//           key: key,
//         );
//
//   final Alignment? alignment;
//
//   final BuildContext context;
//
//   final TextEditingController? controller;
//
//   final TextStyle? textStyle;
//
//   final TextStyle? hintStyle;
//
//   Function(String) onChanged;
//
//   final FormFieldValidator<String>? validator;
//
//   @override
//   Widget build(BuildContext context) {
//     return alignment != null
//         ? Align(
//             alignment: alignment ?? Alignment.center,
//             child: pinCodeTextFieldWidget,
//           )
//         : pinCodeTextFieldWidget;
//   }
//
//   Widget get pinCodeTextFieldWidget => PinCodeTextField(
//         appContext: context,
//         controller: controller,
//         length: 4,
//         keyboardType: TextInputType.number,
//         textStyle: textStyle,
//         hintStyle: hintStyle,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly,
//         ],
//         enableActiveFill: true,
//         pinTheme: PinTheme(
//           fieldHeight: 6.h,
//           fieldWidth: 75.h,
//           shape: PinCodeFieldShape.underline,
//           inactiveFillColor: theme.colorScheme.primary,
//           activeFillColor: theme.colorScheme.primary,
//           inactiveColor: Colors.transparent,
//           activeColor: Colors.transparent,
//           selectedColor: Colors.transparent,
//         ),
//         onChanged: (value) => onChanged(value),
//         validator: validator,
//       );
// }
