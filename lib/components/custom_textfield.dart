import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
        decoration: InputDecoration(
            hintText: hintText, hintStyle: GoogleFonts.robotoMono()),
      ),
    );
  }
}