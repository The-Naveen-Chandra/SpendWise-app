import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendwise_app/components/custom_button.dart';
import 'package:spendwise_app/pages/home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // app name
              Expanded(
                flex: 2,
                child: Text(
                  "SpendWise",
                  style: GoogleFonts.robotoMono(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // small description about the app
              Expanded(
                flex: 2,
                child: Text(
                  "Your's personal expense tracking app.",
                  style: GoogleFonts.robotoMono(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Center(
                  child: CustomButton(
                    text: "Get Started !",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
