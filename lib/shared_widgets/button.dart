import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key, required this.text, this.ontap, this.isLoading = false})
      : super(key: key);
  final String text;
  final VoidCallback? ontap;

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff58dcba),
            borderRadius: BorderRadius.circular(8.dm),
          ),
          width: double.infinity,
          height: 50.h,
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(color: Colors.black, fontSize: 26.sp),
                  ),
          ),
        ),
      ),
    );
  }
}
