import 'package:flutter/material.dart';
import 'package:spark/screens/help_info_screen.dart';
import 'package:spark/widgets/custom_button.dart';
import 'package:spark/widgets/planets_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/settings_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 20,
            left: 50,
            child: Column(
              children: [
                MuteButton(imgHeight: 50,pauseIconPath: 'assets/mute.png', playIconPath: 'assets/unmute.png', vertical: 25, horizontal: 25),
                Text(
                  'Mute Music',
                  style: TextStyle(
                    fontFamily: 'sparkFont',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 50,
            child: Column(
              children: [
                SettingsButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PlanetsWidget()),
                    );
                  },
                  imgHeight: 50,
                  imgPath: 'assets/solar_system.png',
                  vertical: 25,
                  horizontal: 25,
                ),
                const Text(
                  'Our Solar System',
                  style: TextStyle(
                    fontFamily: 'sparkFont',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
            Positioned(
            top: 20,
            right: 50,
            child: Column(
              children: [
                SettingsButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   HelpInfoPage()),
                    );
                  },
                  imgHeight: 50,
                  imgPath: 'assets/help.png',
                  vertical: 25,
                  horizontal: 25,
                ),
                const Text(
                  'Help',
                  style: TextStyle(
                    fontFamily: 'sparkFont',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
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
