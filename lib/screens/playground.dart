import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/screens/topics/roboland_screen.dart';
import 'package:spark/screens/topics/architech_screen.dart';
import 'package:spark/screens/topics/astrotech_screen.dart';
import 'package:spark/screens/topics/biosphere_screen.dart';
import 'package:spark/screens/topics/chemia_screen.dart';
import 'package:spark/screens/topics/codeverse_screen.dart';
import 'package:spark/screens/topics/ecozone_screen.dart';
import 'package:spark/screens/topics/mathmatica_screen.dart';
import 'package:spark/widgets/custom_button.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  PlaygroundScreenState createState() => PlaygroundScreenState();
}

class PlaygroundScreenState extends State<PlaygroundScreen> {
   @override
  void initState() {
    super.initState();
    // Force landscape mode when this screen is displayed
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/space_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Back button
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Horizontally scrollable content
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10), // Add spacing at the start
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EcoZone()),
                        );
                      },
                      imagePath: 'assets/earth.png',
                      buttonText: 'EcoZone',
                    ),
                    const SizedBox(width: 10),
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MathMatica()),
                        );
                      },
                      imagePath: 'assets/venus.png',
                      buttonText: 'MathMatica',
                    ),
                    const SizedBox(width: 10),
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RoboLand()),
                        );
                      },
                      imagePath: 'assets/mars.png',
                      buttonText: 'RoboLand',
                    ),
                    const SizedBox(width: 10),
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CodeVerse()),
                        );
                      },
                      imagePath: 'assets/saturn.png',
                      buttonText: 'CodeVerse',
                    ),
                    const SizedBox(width: 10),
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Chemia()),
                        );
                      },
                      imagePath: 'assets/jupiter.png',
                      buttonText: 'Chemia',
                    ),
                    const SizedBox(width: 10),
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BioSphere()),
                        );
                      },
                      imagePath: 'assets/mercury.png',
                      buttonText: 'BioSphere',
                    ),
                    const SizedBox(width: 10),
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Astrotech()),
                        );
                      },
                      imagePath: 'assets/neptune.png',
                      buttonText: 'Astrotech',
                    ),
                    const SizedBox(width: 10),
                    PlanetButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ArchiTech()),
                        );
                      },
                      imagePath: 'assets/uranus.png',
                      buttonText: 'ArchiTech',
                    ),
                    const SizedBox(width: 10), 
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
