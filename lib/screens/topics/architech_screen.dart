import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/widgets/card.dart';
import 'package:spark/widgets/pdf_view_screen.dart';
import 'package:spark/widgets/video_player_screen.dart';

class ArchiTech extends StatefulWidget {
  const ArchiTech({Key? key}) : super(key: key);

  @override
  ArchiTechState createState() => ArchiTechState();
}

class ArchiTechState extends State<ArchiTech> {
  @override
  void initState() {
    super.initState();
    // Force landscape mode when this screen is displayed
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   // Reset orientation when this screen is disposed
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // }

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

            // Centered CustomCards
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Lesson Card - Opens a video
                  CustomCard(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(
                            videoPath: 'assets/architech.mp4',
                          ),
                        ),
                      );
                    },
                    text: 'Lesson',
                    textColor: Colors.white,
                    imagePath: 'assets/play_video.png',
                    backgroundColor: const Color(0xff72ddf7),
                  ),

                  // Success Story Card - Opens a PDF
                  CustomCard(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PdfViewerScreen(
                            pdfPath: 'assets/architech.pdf',
                          ),
                        ),
                      );
                    },
                    text: 'Success Story',
                    textColor: Colors.white,
                    imagePath: 'assets/success_icon.png',
                    backgroundColor: const Color(0xffff8fab),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
