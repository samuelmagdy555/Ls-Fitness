import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flip Image')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isFlipped = !_isFlipped;
              if (_isFlipped) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(animation),
                child: child,
              );
            },
            child: _isFlipped
                ? Image.asset('assets/images/Person.png') // الصورة الخلفية
                : Image.asset('assets/images/Person back.png'), // الصورة الأمامية
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}