import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/screens/on_board.dart';
import 'package:spark/widgets/background_music.dart';
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

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

// class PDFScreen extends StatefulWidget {
//   final String url;
//   PDFScreen({required this.url});
//
//   @override
//   _PDFScreenState createState() => _PDFScreenState();
// }
//
// class _PDFScreenState extends State<PDFScreen> {
//   String? localPath;
//
//   @override
//   void initState() {
//     super.initState();
//     _downloadPDF(widget.url);
//   }
//
//   Future<void> _downloadPDF(String url) async {
//     final dir = await getApplicationDocumentsDirectory();
//     final filePath = "${dir.path}/temp.pdf";
//
//     try {
//       await Dio().download(url, filePath);
//       setState(() {
//         localPath = filePath;
//       });
//     } catch (e) {
//       print("Error downloading PDF: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.red,
//       appBar: AppBar(backgroundColor: Colors.transparent,
//
//         title: Text("PDF Viewer"),
//       ),
//       body: localPath != null
//           ? PDFView(
//         filePath: localPath!,
//       )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }
//
// void main() => runApp(MaterialApp(
//
//   home: PDFScreen(
//     url: "https://pdf.ac/1ARWLH",
//   ),
// ));
//
//
//
