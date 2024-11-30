
import 'package:flutter/material.dart';
class ChemistryEquationApp extends StatelessWidget {
  const ChemistryEquationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChemistryEquationScreen(),
    );
  }
}

class ChemistryEquationScreen extends StatefulWidget {
  @override
  _ChemistryEquationScreenState createState() =>
      _ChemistryEquationScreenState();
}

class _ChemistryEquationScreenState extends State<ChemistryEquationScreen> {
  final _coController = TextEditingController();
  final _chController = TextEditingController();

  String _resultMessage = '';

  void _startExperiment() {
    // Simple logic to validate the inputs (example for demonstration)
    if (_coController.text == "2" && _chController.text == "3") {
      setState(() {
        _resultMessage = "Correct! Well done.";
      });
    } else {
      setState(() {
        _resultMessage = "Incorrect! Try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/black_board.jpg"), // Replace with your background path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Balance this equation:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                 fontFamily: 'chalk', // Replace with your custom font family
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CH₃COOH + NaHCO₃ → ",
                    style: TextStyle(fontFamily: 'chalk',color: Colors.white, fontSize: 20),
                  ),
                  // CO with subscript field
                  Row(
                    children: [
                      const Text(
                        "CO",
                        style: TextStyle(fontFamily: 'chalk',color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 30,
                        child: TextField(
                          controller: _coController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: '?',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    " + H₂O + ",
                    style: TextStyle(fontFamily: 'chalk',color: Colors.white, fontSize: 20),
                  ),
                  // CH with subscript field in CH₃COONa
                  Row(
                    children: [
                      const Text(
                        "CH",
                        style: TextStyle(fontFamily: 'chalk',color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 30,
                        child: TextField(
                          controller: _chController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: '?',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const Text(
                        "COONa",
                        style: TextStyle(fontFamily: 'chalk',color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: _startExperiment,
                child: const Text(
                  "Start Experimenting",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'chalk', 
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _resultMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
