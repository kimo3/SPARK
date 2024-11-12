import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/screens/intro_screen.dart';






class OnBoardScreen extends StatefulWidget{
const OnBoardScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> with SingleTickerProviderStateMixin{
  

  @override
   
  void initState(){
    super.initState(); 
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds:4),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const IntroScreen() ));
      
      });
  }
  @override
  void dispose(){
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);

  }
  @override
  Widget build(BuildContext context){

    return(Scaffold(
      backgroundColor:  Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex:3,child:Image.asset('assets/ieee_black.png')),
           
            
            
          ],
        ),
      ));
  }
}