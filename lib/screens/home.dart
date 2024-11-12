import 'package:flutter/material.dart';
import 'package:spark/helpers/helpers.dart';
import 'package:spark/screens/settings.dart';
import 'package:spark/widgets/challenge_widget.dart';
import 'package:spark/widgets/custom_button.dart';


class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);
  @override

  HomeState createState()=> HomeState();
}
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/space_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:  Stack(
          children: [
            Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white,size: 40,),
              onPressed: () => Navigator.pop(context),
            ),
          ),
             Center(
             
                child:  CurvedTextButton(
                  onPressed:(){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChallengeWidget()),
                      );},
                startAngle: 520,
                rotationAngle: 0,
                radius: 100,
                text: 'Engineering Island',
                textStyle: const TextStyle(
                  fontFamily: 'sparkFont',
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                ),
              ),
                

            ),
            Positioned(
              top: 350,
            left: 10,
              child: TextButton(
              onPressed: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChallengeWidget()),);
              },
              child:const Text("Challenge",style:TextStyle(fontFamily:'sparkFont',color:  Color.fromARGB(255, 255, 255, 255),fontSize: 35,fontWeight: FontWeight.w400),)
            ), ),
           
            // "Physics World" around the top-left planet
             Positioned(
              left: 160,
              top: 110,
              child: CurvedTextButton(
                 onPressed:(){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChallengeWidget()),
                      );},
                startAngle: 300, // Adjust based on the curve direction
                rotationAngle: -0.1,
                radius: 45,
                text: 'Physics World',
                textStyle: const TextStyle(
                  fontFamily: 'sparkFont',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // "Science City" around the bottom-left planet
            Positioned(
              left: 0.15*screenWidth,
              bottom: 0.22*screenHeight,
              child:  CurvedTextButton(
                 onPressed:(){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const  ChallengeWidget()),
                      );},
                startAngle: 300.5, // Adjust based on the curve direction
                rotationAngle: 0,
                radius: 80,
                text: 'Science City',
                textStyle: const TextStyle(
                  fontFamily: 'sparkFont',
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // "Math Land" around the bottom-right planet
            Positioned(
              right: 0.15*screenWidth,
              bottom: 0.15*screenHeight,
              child:  CurvedTextButton(
                 onPressed:(){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChallengeWidget()),
                      );},
                startAngle: 250, // Adjust based on the curve direction
                rotationAngle: 0,
                radius: 80,
                text: 'Math Land',
                textStyle:const  TextStyle(
                  fontFamily: 'sparkFont',
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
            right: 0.45*screenWidth,
              top: 0.015*screenHeight,
            child: SettingsButton(
              imgHeight: 100,
              onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Settings()),
                      );}, 
              imgPath: 'assets/space_ship.png',
              vertical: 1, 
              horizontal: 1,
              ),),
          ],
        ),
      ),
    );
  }
}
