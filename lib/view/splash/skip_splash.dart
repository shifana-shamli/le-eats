import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_constant.dart';
import '../login/login_page.dart';

class SkipSplash extends StatefulWidget {
  const SkipSplash({super.key});

  @override
  State<SkipSplash> createState() => _SkipSplashState();
}

class _SkipSplashState extends State<SkipSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEEF3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                icon,
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 76,),
            Text(
              "Login your Account",
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFF374B5C),
              ),
            ),
            Text("Or Skip now",

                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFC10037),
                ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Add padding to keep text above screen edge
                child: RichText(
                  textAlign: TextAlign.center, // Center-align text
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "To search for the best nearby driver,\n",
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF979797), // Gold color for this segment
                        ),
                      ),
                      TextSpan(
                        text: "we want to know your current location",
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF979797), // White color for this segment
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Add some space between text and button
            Column(
              mainAxisSize: MainAxisSize.min, // Keep the column height as compact as possible
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage ()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC10037), // Button background color
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded button
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white, // Button text color
                    ),
                  ),
                ),
                const SizedBox(height: 14), // Space between button and "Skip for now" text
                TextButton(
                  onPressed: () {
                    // Handle skip action
                  },
                  child: Text(
                    "Skip for now",
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF979797), // Grey color for "Skip for now" text
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
