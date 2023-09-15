import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomAlertButton extends StatelessWidget {
  const CustomAlertButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}