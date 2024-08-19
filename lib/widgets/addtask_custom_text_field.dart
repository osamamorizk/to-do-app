import 'package:flutter/material.dart';
import 'package:todo/consts.dart';

class AddtaskCustomTextField extends StatelessWidget {
  const AddtaskCustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Required Field';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: kColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        // enabledBorder: BorderEdit(),
        border: BorderEdit(),
        focusedBorder: BorderEdit(kColor),
      ),
    );
  }

  OutlineInputBorder BorderEdit([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
