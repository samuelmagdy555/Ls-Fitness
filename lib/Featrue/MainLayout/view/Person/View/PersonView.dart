import 'package:flutter/material.dart';

class PersonView extends StatefulWidget {
  const PersonView({super.key});

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView>
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
    final mediaQuery = MediaQuery.sizeOf(context);
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: _flipImage,
        child: Icon(Icons.flip ),),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final angle = _animation.value * 3.14159265359;
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: angle < 1.57
                      ? Image.asset(
                      'assets/images/Person.png', width: width * .8,
                      height: height * .8)
                      : Transform(
                    transform: Matrix4.identity()
                      ..rotateY(3.14159265359),
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/Person back.png',
                        width: width * .8, height: height * .8),
                  ),
                );
              },
            ),

          ),
          Positioned(
              top: height*.255,
              right: width*.205,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Nick',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                    width: width * .25,
                    height: height * .006,
                    color: Colors.black.withOpacity(.5),

                  ),
                ],
              )),
          Positioned(
              top: height*.28,
              left: width*.0925,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('shoulders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                    width: width * .25,
                    height: height * .006,
                    color: Colors.black.withOpacity(.5),

                  ),
                ],
              )),
          Positioned(
              top: height*.32,
              left: width*.0925,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chest',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                    width: width * .34,
                    height: height * .006,
                    color: Colors.black.withOpacity(.5),

                  ),
                ],
              )),
          Positioned(
            top: height*.32,
              right: width*.085,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Biceps',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                              width: width * .25,
                              height: height * .006,
                              color: Colors.black.withOpacity(.5),

                            ),
                ],
              )),
          Positioned(
              top: height*.385,
              left: width*.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Forearms',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                    width: width * .2,
                    height: height * .006,
                    color: Colors.black.withOpacity(.5),

                  ),
                ],
              )),
          Positioned(
              top: height*.385,
              right: width*.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Abs',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                    width: width * .4,
                    height: height * .006,
                    color: Colors.black.withOpacity(.5),

                  ),
                ],
              )),
          Positioned(
              top: height*.47,
              left: width*.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aductors',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                    width: width * .375,
                    height: height * .006,
                    color: Colors.black.withOpacity(.5),

                  ),
                ],
              )),
          Positioned(
              top: height*.5,
              right: width*.125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Quads',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * .03,color: Colors.black),),
                  Container(
                    width: width * .3,
                    height: height * .006,
                    color: Colors.black.withOpacity(.5),

                  ),
                ],
              )),
        ],
      ),
    );
  }
}
