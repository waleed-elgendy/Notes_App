import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconButton icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 29.sp),
        ),
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: const Color(0xff3B3B3B),
            borderRadius: BorderRadius.circular(16.dm),
          ),
          child: Center(
            child: icon,
          ),
        ),
      ],
    );
  }
}
