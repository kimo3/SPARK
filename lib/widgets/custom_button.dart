import 'package:flutter/material.dart';
import 'package:spark/widgets/background_music.dart';

// GoogleButton
class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: width * 0.175 ), // Adjusted padding
        elevation: 4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google_icon.png', // Ensure this path is correct
            height: width * 0.05  , // Adjusted icon size
          ),
          
        ],
      ),
    );
  }
}

// SettingsButton
class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double vertical;
  final double horizontal;
  final String? imgPath;
  final double imgHeight;

  const SettingsButton({
    Key? key,
    required this.onPressed,
    required this.imgHeight,
    required this.imgPath,
    required this.vertical,
    required this.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 254, 254, 254),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            '$imgPath', // Ensure this path is correct
            height: imgHeight,
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

// MuteButton
class MuteButton extends StatefulWidget {
  final String playIconPath;   // Icon for playing (unmuted) state
  final String pauseIconPath;  // Icon for paused (muted) state
  final double vertical;       // Vertical padding
  final double horizontal;     // Horizontal padding
  final double imgHeight;      // Height of the icon

  const MuteButton({
    Key? key,
    required this.playIconPath,
    required this.pauseIconPath,
    required this.vertical,
    required this.horizontal,
    required this.imgHeight,
  }) : super(key: key);

  @override
  State<MuteButton> createState() => MuteButtonState();
}

class MuteButtonState extends State<MuteButton> {
  bool isPlaying = true;

  void toggleMusic() {
    if (isPlaying) {
      BackgroundMusicService().pause(); // Pause the music
    } else {
      BackgroundMusicService().play(); // Play the music
    }
    setState(() {
      isPlaying = !isPlaying; // Toggle the state
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            isPlaying ? widget.playIconPath : widget.pauseIconPath, // Switch icon based on state
            height: widget.imgHeight,
          ),
          const SizedBox(width: 12),  // Corrected to SizedBox
        ],
      ),
    );
  }
}

// IntroButton (Main Button for Signup/Login)
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
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.8,  // Set width to 80% of screen width
      height: 70,  // Adjusted height for mobile
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'sparkFont',
            color: textColor,
            fontSize: width * 0.05,  // Adjust font size based on screen width
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// BackButton
class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
      iconSize: width * 0.08, // Adjust icon size based on screen width
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
    final double width = MediaQuery.of(context).size.width;

    // Use a percentage of screen width for width and height, rather than static values
    double buttonWidth = widget.hwidth ?? width * 0.4; // Adjust width to fit the text better
    double buttonHeight = widget.vheight ?? width * 0.12; // Adjust height proportionally

    return Container(
      width: buttonWidth, // Set container width for flexible width
      height: buttonHeight, // Set container height for flexible height
      child: TextButton(
        onPressed: _toggleBorderColor,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.3, horizontal: buttonWidth * 0.1),
          side: BorderSide(color: borderColor, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          widget.date,
          style: TextStyle(
            color: Colors.black,
            fontSize: width * 0.05, // Scaled font size for better fit
            fontWeight: FontWeight.bold, // Make the font weight bold for clarity
          ),
        ),
      ),
    );
  }
}



// NextButton (Skip Button)
class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Skip",
        style: TextStyle(
          fontFamily: 'sparkFont',
          color: Colors.white,
          fontSize: width * 0.08, // Adjust font size
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class PlanetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath; // Image path parameter
  final String buttonText; // Text to display below the image

  const PlanetButton({
    super.key,
    required this.onPressed,
    required this.imagePath,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Transparent background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: width * 0.175), // Adjusted padding
        elevation: 0, // Set elevation to 0 to remove shadow
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath, // Image path (ensure the path is correct)
            height: width * 0.09, // Adjust image size
          ),
          const SizedBox(height: 8), // Space between image and text
          Text(
            buttonText, // Button text
            style: TextStyle(
              fontFamily: 'sparkFont',
              color: const Color.fromARGB(255, 255, 255, 255), // Text color
              fontSize: width * 0.02, // Font size adjusted based on screen width
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
