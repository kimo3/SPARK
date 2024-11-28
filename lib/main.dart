import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/screens/on_board.dart';
import 'package:spark/widgets/background_music.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force landscape mode globally
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  // Initialize and start playing background music
  final backgroundMusicService = BackgroundMusicService();
  await backgroundMusicService.initialize();
  backgroundMusicService.play();

  runApp(const Spark());
}

class Spark extends StatelessWidget {
  const Spark({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardScreen(),
    );
  }
}

