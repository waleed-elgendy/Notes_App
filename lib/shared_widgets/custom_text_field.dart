import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    super.key,
    @required this.maxlines,
  });
  final int? maxlines;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      decoration: InputDecoration(
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
