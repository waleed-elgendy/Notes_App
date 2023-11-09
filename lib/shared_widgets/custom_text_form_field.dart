import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    super.key,
    @required this.maxlines,
    this.onSaved,
    this.onChanged,
  });
  final int? maxlines;
  final String hint;
  final void Function(String?)? onSaved, onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12.dm))),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12.dm))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12.dm))),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12.dm))),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12.dm))),
          contentPadding:
              EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
          hintText: hint),
    );
  }
}
