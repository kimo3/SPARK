import 'package:flutter/material.dart';
import 'package:spark/widgets/background_music.dart';



class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 332),
        elevation: 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,  // Compactly wrap around children
        crossAxisAlignment: CrossAxisAlignment.center,  // Vertically center children
        textDirection: TextDirection.ltr,  // Set left-to-right text direction
        children: [
          Image.asset(
            'assets/google_icon.png',  // Ensure this path is correct
            height: 40,
          ),
          const SizedBox(width: 12),  // Space between icon and text
          
        ],
      ),
    );
  }
}


class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double vertical;
  final double horizontal;
  final String? imgPath;
  final double imgHeight;

  const SettingsButton({Key?key,required this.onPressed,required this.imgHeight,required this.imgPath,required this.vertical,required this.horizontal}): super(key: key); 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 254, 254, 254),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding:  EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,  // Compactly wrap around children
        crossAxisAlignment: CrossAxisAlignment.center,  // Vertically center children
        textDirection: TextDirection.ltr,  // Set left-to-right text direction
        children: [
          Image.asset(
            '$imgPath',  // Ensure this path is correct
            height: imgHeight,
          ),
          const SizedBox(width: 12),  // Space between icon and text
          
        ],
      ),
    );
  }
}



class MuteButton extends StatefulWidget {
  final double vertical;
  final double horizontal;
  final String? imgPath;
  final double imgHeight;

  const MuteButton({
    super.key,
    required this.imgHeight,
    required this.imgPath,
    required this.vertical,
    required this.horizontal,
  });

  @override
  MuteButtonState createState() => MuteButtonState();
}

class MuteButtonState extends State<MuteButton> {
  bool isPlaying = true;

  void toggleMusic() {
    if (isPlaying) {
      BackgroundMusicService().pause();
    } else {
      BackgroundMusicService().play();
    }
    setState(() {
      isPlaying = !isPlaying; // Toggle the playing state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: toggleMusic,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 254, 254, 254),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(
          vertical: widget.vertical,
          horizontal: widget.horizontal,
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,  // Compactly wrap around children
        crossAxisAlignment: CrossAxisAlignment.center,  // Vertically center children
        children: [
          Image.asset(
            widget.imgPath!,  // Ensure this path is correct
            height: widget.imgHeight,
          ),
          const SizedBox(width: 12),  // Space between icon and text
        ],
      ),
    );
  }
}



class IntroButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const IntroButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFFFF4081), // Default pink color
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100, // Set your desired height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Adjust as needed
          ),
          padding: const EdgeInsets.symmetric(vertical: 12 ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'sparkFont',
            color: textColor,
            fontSize: 50, // Adjust font size as needed
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: (){Navigator.pop(context);},
    );
  }
}

class DateButton extends StatefulWidget {
  final String date;
  final double? hwidth;
  final double? vheight;

  const DateButton({Key? key, required this.date, required this.hwidth, required this.vheight})
      : super(key: key);

  @override
  DateButtonState createState() => DateButtonState();
}

class DateButtonState extends State<DateButton> {
  Color borderColor = Colors.black;

  void _toggleBorderColor() {
    setState(() {
      borderColor = borderColor == Colors.black ? const Color(0xFFF72585) : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _toggleBorderColor,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: widget.vheight ?? 8.0, horizontal: widget.hwidth ?? 16.0),
        side: BorderSide(color: borderColor, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        widget.date,
        style: const TextStyle(color: Colors.black, fontSize: 30),
      ),
    );
  }
}

class NextButton extends StatelessWidget {

  const NextButton({super.key});
  @override
  Widget build(BuildContext context){
    return(TextButton(
      onPressed: (){Navigator.pop(context);}, 
      child:const Text("Skip",style: TextStyle(
                  fontFamily: 'sparkFont',
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                ),)));
  }
}
