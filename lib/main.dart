import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Lottie.asset(
              'assets/lottieFile/delivery-riding.json',
              delegates: LottieDelegates(
                text: (initialText) => '**$initialText**',
                values: [
                  ValueDelegate.color(
                    const ['Shape Layer 1', 'Rectangle', 'Fill 1'],
                    value: Colors.red,
                  ),
                  ValueDelegate.opacity(
                    const ['Shape Layer 1', 'Rectangle'],
                    callback: (frameInfo) =>
                        (frameInfo.overallProgress * 100).round(),
                  ),
                  ValueDelegate.position(
                    const ['Shape Layer 1', 'Rectangle', '**'],
                    relative: Offset(100, 200),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  'assets/lottieFile/delivery-riding.json'
