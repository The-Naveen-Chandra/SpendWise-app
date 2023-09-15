import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPrefixIcon = false,
    this.isNumber = false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPrefixIcon;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.black,
        //     offset: Offset(5.0, 5.0),
        //   ),
        // ],
      ),
      child: TextField(
        controller: controller,
        showCursor: false,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: GoogleFonts.robotoMono(),
        decoration: InputDecoration(
          prefixIcon: isPrefixIcon ?  Icon(
            Icons.currency_rupee,
            size: 20,
            color: Colors.grey[600],
          ) : const SizedBox(),
          hintText: hintText,
          hintStyle: GoogleFonts.robotoMono(),
        ),
      ),
    );
  }
}
