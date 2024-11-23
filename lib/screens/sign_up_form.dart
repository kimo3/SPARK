import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/screens/home_screen.dart';
import 'package:spark/widgets/custom_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: LeftCurveClipper(),
              child: Container(
                width: width * 0.4, // Adjust width for better responsiveness
                color: const Color(0xffCFD0FF), // Light background color
                child: Center(
                  child: Image.asset(
                    'assets/astronaut4.png',
                    height: height * 0.25, // Adjust image size based on screen height
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: height * 0.1), // Adjust top padding for better layout on mobile
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1), // Adjust horizontal padding for text fields
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            fontFamily: 'sparkFont',
                            color: Colors.grey[600],
                            fontSize: width * 0.05, // Adjust font size based on screen width
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1), // Adjust horizontal padding for text fields
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'sparkFont',
                            color: Colors.grey[600],
                            fontSize: width * 0.05, // Adjust font size based on screen width
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03), // Adjust spacing between form elements
                  const TermsCheckbox(),
                  SizedBox(height: height * 0.03), // Adjust spacing between form elements
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.1), // Adjust margin for the button
                    child: IntroButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
