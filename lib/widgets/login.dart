import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/helpers/theme.dart';
import 'package:spark/screens/home_screen.dart';
import 'package:spark/screens/sign_up.dart';
import 'package:spark/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            ClipPath(
              clipper: LeftCurveClipper(),
              child: Container(
                width: width * 0.4, // Adjust width for responsiveness
                color: const Color(0xffFFF5A0), // Light yellow background
                child: Center(
                  child: Image.asset(
                    'assets/astronaut5.png',
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
                      'Welcome Back',
                      style: TextStyle(
                        fontFamily: 'sparkFont',
                        fontSize: 25, // Adjusted font size for better readability
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Username TextField
                    Container(
                      margin: const EdgeInsets.only(bottom: 16, right: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              fontFamily: 'sparkFont',
                              color: Colors.grey[600],
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        ),
                      ),
                    ),
                    // Password TextField
                    Container(
                      margin: const EdgeInsets.only(bottom: 16, right: 40),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontFamily: 'sparkFont',
                              color: Colors.grey[600],
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        ),
                      ),
                    ),
                    // Log in Button
                    Container(
                      margin: EdgeInsets.only(right: width * 0.1),
                      child: IntroButton(
                        text: 'Log in',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                        color: primaryColor,
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Divider with text for alternative login options
                    Container(
                      margin: EdgeInsets.only(right: width * 0.1),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 40,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'Or sign in with ',
                            style: TextStyle(fontFamily: 'sparkFont', fontSize: 20, color: Color(0xff808080)),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 10,
                              endIndent: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Google Login Button
                    Container(
                      margin: EdgeInsets.only(right: width * 0.1),
                      child: GoogleButton(onPressed: () {}),
                    ),
                    const SizedBox(height: 10),
                    // Sign up Link
                    Container(
                      margin: EdgeInsets.only(right: width * 0.1),
                      child: Column(
                        children: [
                          const Text(
                            "Don’t have an account?",
                            style: TextStyle(fontSize: 16 , fontFamily: "sparkFont"),
                          ),
                        
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUpPage()),
                              );
                            },
                            child: const Text(
                              'Sign up here',
                              style: TextStyle(fontSize: 16, fontFamily: 'sparkFont'),
                            ),
                          ),
                        ],
                      ),
                    )
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
