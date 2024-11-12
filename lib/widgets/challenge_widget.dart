import 'package:flutter/material.dart';

class ChallengeWidget extends StatefulWidget {
      const ChallengeWidget({Key? key}) : super(key: key);

  @override
  ChallengeWidgetState createState() => ChallengeWidgetState();
}

class ChallengeWidgetState extends State<ChallengeWidget> {
  int _questionIndex = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What was the first product launched by Apple?',
      'answers': ['iPhone', 'iPad', 'Apple I', 'iPod'],
      'correctAnswer': 'Apple I',
    },
    // Add more questions here
  ];

  void _answerQuestion(String answer) {
    // Handle answer selection logic here
    // You could check if answer is correct or proceed to the next question
    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = _questions[_questionIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurple, // Main background color
      appBar: AppBar(
        title: const Text('Math Land',style: TextStyle(fontFamily:'sparkFont',color:  Color.fromARGB(255, 255, 255, 255),fontSize: 35,fontWeight: FontWeight.w400),),
        backgroundColor: const Color(0xff261333),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/challenge_map.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: LinearProgressIndicator(
                value: (_questionIndex + 1) / _questions.length,
                
                color: Colors.purple,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Question ${_questionIndex + 1}/${_questions.length}',
                    style: const TextStyle(fontFamily:'sparkFont',color:  Color.fromARGB(255, 255, 255, 255),fontSize: 16,),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentQuestion['questionText'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ...(_questions[_questionIndex]['answers'] as List<String>).map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: const Size(double.infinity, 50), // Full-width buttons
                        ),
                        onPressed: () => _answerQuestion(answer),
                        child: Text(
                          answer,
                          style:const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
