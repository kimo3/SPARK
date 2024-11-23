import 'package:flutter/material.dart';
import 'package:spark/screens/sign_up.dart';
import 'package:spark/widgets/drag_intro_widget.dart';
import 'package:spark/helpers/theme.dart';
import 'package:spark/widgets/custom_button.dart';
import 'package:spark/widgets/login.dart';
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const DragIntroWidget(),
          Positioned(
            left: 0,
            right: 0,
            bottom: height * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.1), // Adjusted margin for mobile
                  child: IntroButton(
                    text: "I'm a New User",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.02), // Adjusted space for mobile
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.1), // Adjusted margin for mobile
                  child: IntroButton(
                    text: "Already Have an Account",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    color: Colors.white,
                    textColor: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
