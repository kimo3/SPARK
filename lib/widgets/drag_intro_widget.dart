import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/helpers/theme.dart';

class DragIntroWidget extends StatefulWidget {
  const DragIntroWidget({super.key});
  @override
  DragSplashScreenState createState() => DragSplashScreenState();
}

class DragSplashScreenState extends State<DragIntroWidget> {
  int currentZone = 0;

  // Define colors for each zone
  final List<Color> zoneColors = [clip1, clip2, clip3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Purple curved zone with drag gesture detection
          GestureDetector(
            onHorizontalDragEnd: (details) {
              setState(() {
                // Change the content in the purple zone when dragging left or right
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  // Swiping Right
                  if (currentZone > 0) {
                    currentZone--;
                  }
                } else {
                  // Swiping Left
                  if (currentZone < 2) {
                    currentZone++;
                  }
                }
              });
            },
            child: ClipPath(
              clipper: CurvedClipper(),
              child: Container(
                color: zoneColors[currentZone],
                height: MediaQuery.of(context).size.height * 0.6,
                child: buildPurpleZoneContent(),
              ),
            ),
          ),
        
        ],
      ),
    );
  }

  Widget buildPurpleZoneContent() {
    List<String> descriptions = [
      "Discover the world of Science, Technology, Engineering, and Math through fun and interactive challenges designed just for kids.",
      "Dive into exciting activities that make learning engaging. Experiment, build, and solve problems while having fun!",
      "Explore different STEM fields and unlock your potential by developing creativity, curiosity, and critical thinking skills."
    ];

    List<String> imagePaths = [
      'assets/astronaut5.png',
      'assets/astronaut2.png',
      'assets/astronaut3.png'
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePaths[currentZone], height: 200),
        const SizedBox(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Text(
            descriptions[currentZone],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'sparkFont',
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
       const  SizedBox(height: 30),
        // Page Indicator for the purple zone
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 15,
                width: currentZone == i ? 50 : 15,
                decoration: BoxDecoration(
                  color: currentZone == i ? Colors.pink : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          ],
        ),
         const  SizedBox(height: 50),
      ],
    );
  }
}