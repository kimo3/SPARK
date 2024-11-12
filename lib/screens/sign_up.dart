import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/screens/sign_up_form.dart';
import 'package:spark/widgets/custom_button.dart';


class SignUpPage extends StatelessWidget {
    const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: LeftCurveClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4, // Adjust the width as needed
                color: const Color(0xffCFD0FF), // Light yellow background
                child: Center(
                  child: Image.asset(
                    'assets/astronaut4.png', // Replace with your astronaut image path
                    height: 250, // Adjust size as needed
                  ),
                ),
              ),
            ),
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    "Select your child’s date of birth",
                    style: TextStyle(
                      fontFamily: 'sparkFont',
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.black, // Text color
                    ),
                  ),
                  const Row(
                    children: [
                      DateButton(date: '2019',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                       DateButton(date: '2018',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                       DateButton(date: '2017',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                       DateButton(date: '2016',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                    ],
                  ),
                  const  SizedBox(height: 50),
                  const Row(
                    children: [
                       DateButton(date: '2015',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                       DateButton(date: '2014',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                       DateButton(date: '2013',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                       DateButton(date: '2012',hwidth: 40,vheight:50 ,), 
                       SizedBox(width: 37),
                    ],
                  ),
                  const  SizedBox(height: 50),
                  const DateButton(date: 'Before 2012',hwidth: 275,vheight:25 ,), 
                  const  SizedBox(height: 50),
                   Container(
                  margin: const EdgeInsets.only(right: 50.0),
                  child:IntroButton(text: 'Continue', onPressed: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpForm()),);
                  }),
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
