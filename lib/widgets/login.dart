import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/helpers/theme.dart';
import 'package:spark/screens/home.dart';
import 'package:spark/screens/sign_up.dart';

import 'package:spark/widgets/custom_button.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
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
                color: const Color(0xffFFF5A0), // Light yellow background
                child: Center(
                  child: Image.asset(
                    'assets/astronaut5.png', // Replace with your astronaut image path
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
                    'Welcome Back',
                    style: TextStyle(
                      fontFamily:'sparkFont',
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.black, // Text color
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 50),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
                        hintStyle: TextStyle(fontFamily:'sparkFont',color: Colors.grey[600],fontSize: 25,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                       hintStyle: TextStyle(fontFamily:'sparkFont',color: Colors.grey[600],fontSize: 25,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      ),
                    ),
                  ),
                  Container(
                  margin: const EdgeInsets.only(right: 50.0),
                  child:IntroButton(
                    text: 'Log in',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    color: primaryColor,
                    textColor: Colors.white,
                  ),),
                  const SizedBox(height: 30),
                  Container(
                  margin: const EdgeInsets.only(right: 50.0),
                  child:const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          indent: 40,
                          endIndent: 10,
                        ),
                      ),
                       Text('Or sign in with ',style: TextStyle(fontFamily:'sparkFont',fontSize: 30,color:Color(0xff808080)),),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          indent: 10,
                          endIndent: 40,
                        ),
                      ),
                    ],)
                  ),
                  Container(
                  margin: const EdgeInsets.only(right: 50.0),
                  child:GoogleButton(onPressed: (){},),),
                  Container(
                  margin: const EdgeInsets.only(right: 50.0),
                  child:Row(
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style:TextStyle(fontSize: 45,fontFamily: "sparkFont"),
                      ),
                      TextButton(
                        onPressed: () {
Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );                        },
                        child: const Text(
                          'Sign up here',
                          style: TextStyle(fontSize: 45,fontFamily: 'sparkFont'),
                        ),
                      ),
                    ],
                  )

              )],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
