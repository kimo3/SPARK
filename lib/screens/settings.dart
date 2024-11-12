import 'package:flutter/material.dart';

import 'package:spark/widgets/custom_button.dart';
import 'package:spark/widgets/planets_widget.dart';


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return(
      Scaffold(
        body:Stack(
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
              top:50,
              left:50,
              child:Column(children: [
                MuteButton(imgHeight:50, imgPath: 'assets/mute.png', vertical: 25, horizontal: 25),
                Text('Mute Music',style: TextStyle(
                  fontFamily: 'sparkFont',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),),
              ],)
              ),
               Positioned(
              top:200,
              left:50,
              child:Column(children: [
                SettingsButton(onPressed:(){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const PlanetsWidget()),
                      );},imgHeight:50, imgPath: 'assets/solar_system.png', vertical: 25, horizontal: 25),
                const Text('Our Solar System',style: TextStyle(
                  fontFamily: 'sparkFont',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),),
              ],)
              ),
             
            
          ],
        )
      )
    );
  }
}