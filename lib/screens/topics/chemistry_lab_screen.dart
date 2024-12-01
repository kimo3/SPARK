import 'package:flutter/material.dart';
import 'package:spark/screens/topics/equation_challenge_screen.dart';
import 'package:spark/screens/topics/experiment_screen.dart';

class ChemistryLabWidget extends StatelessWidget {
  const ChemistryLabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: Colors.lightBlue[50],
          ),
          // Blackboard
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChemistryEquationApp()
                        ),
                      );
                  
               
              },
              child: Image.asset(
                'assets/black_board.png', // Replace with your blackboard image path
                width: 150,
              ),
            ),
          ),
          // Help Button
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // Help button click action
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Need Help?"),
                    content: const Text("This is the help button."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.help_outline,
                size: 40,
                color: Colors.black,
              ),
            ),
          ),
          // Scientist
          Positioned(
            bottom: 0,
            left: 20,
            
              child: Image.asset(
                'assets/dr_proton_full.png', // Replace with your scientist image path
                width: 100,
              ),
            ),
          
          // Table
          Positioned(
            bottom: 0,
            left: 120,
            right: 20,
            child: GestureDetector(
              onTap: () {
               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ExperimentScreen()
                        ),
                      );
              },
              child: Image.asset(
                'assets/lab_table.png', // Replace with your table image path
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


