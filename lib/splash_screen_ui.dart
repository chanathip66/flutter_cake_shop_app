import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({
    super.key,
    this.nextPage,
    this.duration = const Duration(seconds: 2),
  });

  final Widget? nextPage;
  final Duration duration;

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    if (widget.nextPage != null) {
      _timer = Timer(widget.duration, () {
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => widget.nextPage!),
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg_welcome.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 96),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'สายด่วนกินเค้ก',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.prompt(
                        color: const Color(0xFFE60012),
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'CAKE CALL FAST',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.prompt(
                        color: const Color(0xFFE34A4A),
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 34),
                    const SizedBox(
                      width: 64,
                      height: 64,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF5C6368),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
