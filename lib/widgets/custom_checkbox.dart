import 'package:flutter/material.dart';
import '../theme/theme_helper.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value!;
        });
      },
      activeColor: Colors.blue, // Color when checked and focused
      checkColor: Colors.white, // Color of the checkmark
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return theme.colorScheme.primary; // Color when checked and focused
        }
        return Colors.grey; // Color when unchecked or unfocused
      }),
    );
  }
}



Widget checkBox(bool isChecked){
  return Checkbox(
    value: isChecked,
    onChanged: (value) {
        isChecked = value!;
    },
    checkColor: Colors.white, // Color of the checkmark
    fillColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.selected)) {
        return theme.colorScheme.primary; // Color when checked and focused
      }
      return Colors.grey; // Color when unchecked or unfocused
    }),
  );
}