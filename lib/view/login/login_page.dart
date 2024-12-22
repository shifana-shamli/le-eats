import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../utils/app_constant.dart';
import 'location.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEEF3),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  icon,
                  height: 100,
                  width: 100,
                ),
                SizedBox(height: 10), // Adds spacing between the icon and the text
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                          color: Color(0xFF374B5C), // Gray color for "Welcome"
                        ),
                      ),
                      TextSpan(
                        text: 'Le Eats',
                        style: TextStyle(
                          color: Color(0xFFC10037),// Red color for "le eats"
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Add spacing between the RichText and the new text
                Text(
                  'Please enter your sign in details.', // Replace with your desired text
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF979797),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Space before the text fields
            Text(
              'phone no',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374B5C),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your phone no',
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: Color(0xffDADADA), // Change this to your desired color
                  fontSize: 20, // Optional: Adjust font size
                  fontWeight: FontWeight.w500, // Optional: Adjust font weight
                ),
                suffixIcon: Icon(
                  Icons.phone,
                  color: Color(0xffDADADA), // Optional: Customize the icon color
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color(0xFFEFEEF3),
              ),
            ),

            SizedBox(height: 20), // Space before the text fields
            Text(
              'password',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374B5C),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your password',

                    hintStyle: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: Color(0xffDADADA),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0xffDADADA),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0xFFEFEEF3),
                  ),
                ),
                SizedBox(height: 8), // Spacing between the TextField and the "Forgot Password" text
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Handle "Forgot Password" action here
                      print("Forgot Password tapped");
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xff374B5C), // Text color
                        fontSize: 14, // Text size
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Space between "Forgot Password?" and the button
            SizedBox(
              width: double.infinity, // Make the button take the full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Location ()),
                  );
                  print("Sign In button tapped");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC10037), // Button color
                  padding: EdgeInsets.symmetric(vertical: 15), // Button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded edges
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between "Forgot Password?" and the button
            SizedBox(
              width: double.infinity, // Make the button take the full width
              child: ElevatedButton(
                onPressed: () {
                  // Handle sign-in action here
                  print("Sign In button tapped");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15), // Button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded edges
                    side: BorderSide(
                      color: Color(0xFFC10037), // Red border color
                      width: 2.0, // Border width
                    ),
                  ),
                  backgroundColor: Colors.white, // Background color
                ),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFC10037), // Button text color
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacing between button and "or continue with" text
            Text(
              'or continue with',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFFC4C4C4), // Gray color for the text
              ),
            ),

          ],
        ),
      ),
    );
  }
}
