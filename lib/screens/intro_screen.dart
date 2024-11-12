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
    return Scaffold(
      body: Stack(
        children: [
          const DragIntroWidget(),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50.0), // Add horizontal margin
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
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50.0), // Add horizontal margin
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
