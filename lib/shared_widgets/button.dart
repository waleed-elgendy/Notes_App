import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
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
        padding:
            const EdgeInsets.only( left: 15, right: 15, bottom: 15),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff58dcba),
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(color: Colors.black, fontSize: 26),
                  ),
          ),
        ),
      ),
    );
  }
}
