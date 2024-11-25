

import 'package:flutter/material.dart';

class FlipImageScreen extends StatefulWidget {
  @override
  _FlipImageScreenState createState() => _FlipImageScreenState();
}

class _FlipImageScreenState extends State<FlipImageScreen>
    with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipImage() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flip Image Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final angle = _animation.value * 3.14159265359; // زاوية الدوران
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: angle < 1.57
                      ? Image.asset('assets/images/Person.png', width: 200, height: 200)
                      : Transform(
                    transform: Matrix4.identity()..rotateY(3.14159265359),
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/Person back.png',
                        width: 200, height: 200),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _flipImage,
              child: Text('Flip Image'),
            ),
          ],
        ),
      ),
    );
  }
}