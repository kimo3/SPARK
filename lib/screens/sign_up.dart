import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/screens/sign_up_form.dart';
import 'package:spark/widgets/custom_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                width: width * 0.4, // Adjust width for responsiveness
                color: const Color(0xffCFD0FF), // Light background color
                child: Center(
                  child: Image.asset(
                    'assets/astronaut4.png',
                    height: height * 0.25, // Adjust image height based on screen size
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05), // Padding to ensure text is not too close to edges
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.1), // Adjust spacing at the top
                    const Text(
                      "Select your child’s date of birth",
                      style: TextStyle(
                        fontFamily: 'sparkFont',
                        fontSize: 25  , // Adjusted font size for better readability
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // First row of date buttons
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateButton(date: '2013', hwidth: 75, vheight: 75),
                        SizedBox(width: 15),
                        DateButton(date: '2012', hwidth: 75, vheight: 75),
                       
                      ],
                    ),
                     const SizedBox(height: 10),
                    // First row of date buttons
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        
                        DateButton(date: '2011', hwidth: 75, vheight: 75),
                         SizedBox(width: 15),
                        DateButton(date: '2010', hwidth: 75, vheight: 75),
                      ],
                    ),
                     const SizedBox(height: 10),
                    // First row of date buttons
                   
                    
                    const SizedBox(height: 25),
                    // Single date button for 'Before 2012'
                    const DateButton(date: 'Before 2010', hwidth: 190 , vheight: 75),
                    const SizedBox(height: 15),
                    // Continue button
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.03  ), // Adjust margin for button
                      child: IntroButton(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpForm()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
