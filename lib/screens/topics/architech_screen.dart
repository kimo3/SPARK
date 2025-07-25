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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/space_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
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
                          pdfUrl:
                              'https://drive.google.com/uc?export=download&id=1NWTvRVZQeDLiAZWwqoVsI44YT94qiZ3b'),
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
      ),
    );
  }
}
