import 'package:flutter/material.dart';

class HelpInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Info'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Purpose Section
               Text(
                'Why We Created This App',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 8.0),
               Text(
                'This app was designed to spark children’s interest in STEM fields by offering engaging challenges and activities. Our goal is to make learning fun and accessible for everyone.',
                style: TextStyle(fontFamily: 'sparkFont', fontSize: 16.0),
              ),
               SizedBox(height: 20.0),

              // Contact Section
               Text(
                'Contact Us',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 8.0),
               Text(
                'We’d love to hear your feedback! Feel free to reach out to us:',
                style: TextStyle(fontFamily: 'sparkFont', fontSize: 16.0),
              ),
               SizedBox(height: 8.0),
               Text(
                '📧 slim.belabria@ieee.org',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
               SizedBox(height: 10.0),
               Text(
                '📸 Instagram: @Spark',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
               SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
