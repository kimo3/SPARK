import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/screens/home.dart';
import 'package:spark/widgets/custom_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return(Scaffold(
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
            Expanded(child: Column(
              children: [
                const SizedBox(height: 50,),
                Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 50),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
                        hintStyle: TextStyle(fontFamily:'sparkFont',color: Colors.grey[600],fontSize: 35,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 50),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                       hintStyle: TextStyle(fontFamily:'sparkFont',color: Colors.grey[600],fontSize: 35,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const TermsCheckbox(),
                  const SizedBox(height: 20,),
                   Container(
                  margin: const EdgeInsets.only(right: 50.0),
                  child:IntroButton(text: 'Continue', onPressed: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),);
                  }),
              ),
              ],
            ))
          ]
             )
            )
    ));
  }
}