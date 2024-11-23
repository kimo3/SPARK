import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerScreen extends StatefulWidget {
  final String pdfPath;

  const PdfViewerScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PDFSlideshowState();
}

class _PDFSlideshowState extends State<PdfViewerScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _totalPages = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      int nextPage = _currentPage + 1;

      if (nextPage >= _totalPages) {
        _timer?.cancel(); // Stop at the last page
      } else {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
        _currentPage = nextPage;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color for the slideshow
      body: PDFView(
        filePath: widget.pdfPath,
        fitEachPage: true,
        fitPolicy: FitPolicy.BOTH,
        onRender: (pages) {
          setState(() {
            _totalPages = pages ?? 0;
          });
        },
        onPageChanged: (page, _) {
          setState(() {
            _currentPage = page ?? 0;
          });
        },
      ),
    );
  }
}
