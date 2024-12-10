import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({Key? key, required this.videoPath}) : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  double _currentPosition = 0.0; // Current position of the video (used for slider)
  double _videoDuration = 0.0; // Total duration of the video (used for slider)

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _videoDuration = _controller.value.duration.inSeconds.toDouble();
        });
        _controller.play(); // Auto-play the video
      });

    // Listen to video player state to detect when the video ends
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        Navigator.pop(context); // Go back when the video ends
      }
      setState(() {
        _currentPosition = _controller.value.position.inSeconds.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to skip 10 seconds forward in the video
  void skipForward() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    _controller.seekTo(newPosition);
  }

  // Function to handle dragging the slider to seek the video
  void seekVideo(double value) {
    final position = Duration(seconds: value.toInt());
    _controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Ensures a black background for the video
      body: Center(
        child: _controller.value.isInitialized
            ? Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    onDoubleTap: skipForward, // Skip forward 10 seconds on double tap
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  // Show slider when video is paused
                  if (!_controller.value.isPlaying)
                    Positioned(
                      bottom: 40,
                      left: 20,
                      right: 20,
                      child: Slider(
                        value: _currentPosition,
                        min: 0,
                        max: _videoDuration,
                        onChanged: seekVideo,
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                      ),
                    ),
                ],
              )
            : const CircularProgressIndicator(), // Loading spinner
      ),
    );
  }
}
