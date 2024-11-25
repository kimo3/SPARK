import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/screens/playground.dart';
import 'package:spark/screens/settings.dart';
import 'package:spark/widgets/card.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  
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
             Center(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
       CustomCard(onPressed:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const Settings()),);
       },
       text: 'settings', textColor: Colors.white, imagePath: 'assets/settings.png', backgroundColor: const Color(0xffD90368)),
             CustomCard(onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const PlaygroundScreen()),);
             },text: 'PlayGround', textColor: Colors.white, imagePath: 'assets/play_icon.png', backgroundColor: const Color(0xff820263)),

                ],
              )
            ),
      
        ]
       ),
      )
    );
  }
}