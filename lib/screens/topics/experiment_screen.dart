
import 'package:flutter/material.dart';
class ExperimentScreen extends StatefulWidget {
  @override
  ExperimentScreenState createState() => ExperimentScreenState();
}

class ExperimentScreenState extends State<ExperimentScreen> {
  // Variables to track the sequence and current state of the beaker.
  int _step = 0;
  String _beakerImage = 'assets/beaker.png'; // Initial image

  // Function to handle clicks and update images based on sequence
  void _handleClick(String item) {
    if (_step == 0 && item == 'soda') {
      _step++;
    } else if (_step == 1 && item == 'beaker') {
      _step++;
    } else if (_step == 2 && item == 'oil') {
      _step++;
    } else if (_step == 3 && item == 'beaker') {
      setState(() {
        _beakerImage = 'assets/beaker_reaction.png'; // Reaction image
      });
      _step = 0; // Reset the sequence for a new round
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color and table
          Positioned.fill(
            child: Container(
              color: Colors.grey[300], // Background color
            ),
          ),

          // Table
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/wood_table.png', // Table image file
              fit: BoxFit.cover,
              height: 300, // Adjust the table height as needed
            ),
          ),

          // Center content (interactive items)
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Beaker
                Positioned(
                  top: 100,
                  child: GestureDetector(
                    onTap: () => _handleClick('beaker'),
                    child: Image.asset(_beakerImage, width: 100, height: 100),
                  ),
                ),

                // Soda pack
                Positioned(
                  left: 50,
                  bottom: 70,
                  child: GestureDetector(
                    onTap: () => _handleClick('soda'),
                    child: Image.asset('assets/baking_soda.png', width: 70, height: 70),
                  ),
                ),

                // Oil bottle
                Positioned(
                  right: 50,
                  bottom: 70,
                  child: GestureDetector(
                    onTap: () => _handleClick('oil'),
                    child: Image.asset('assets/vinegar.png', width: 70, height: 70),
                  ),
                ),

                // Notebook (not part of the reaction, just for interaction)
                Positioned(
                  right: 150,
                  bottom: 150,
                  child: GestureDetector(
                    onTap: () => print("Notebook clicked!"),
                    child: Image.asset('assets/notebook.png', width: 50, height: 50),
                  ),
                ),

                // Question Mark (Hint or Help)
                Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      // Provide instructions or hints
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Hint"),
                            content: const Text("Click the items in the correct sequence to see the reaction."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.help_outline, size: 30),
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
