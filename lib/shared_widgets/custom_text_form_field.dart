import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    super.key,
    @required this.maxlines, this.onSaved,
  });
  final int? maxlines;
  final String hint;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true)
          {
            return 'Field is required';
          }else{
          return null;
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          hintText: hint),
    );
  }
}
