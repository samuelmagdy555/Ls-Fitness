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
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  late double width;
  late double height;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    precacheImage(AssetImage('assets/images/Person.png'), context);
    precacheImage(AssetImage('assets/images/Person back.png'), context);
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
      floatingActionButton: FloatingActionButton(
        onPressed: _flipImage,
        child: Icon(Icons.flip),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: !_isFlipped ? 0 : 1,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/images/Person back.png',
                width: width * 0.8,
                height: height * 0.8,
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: !_isFlipped ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/images/Person.jpeg',
                width: width * 0.8,
                height: height * 0.8,
              ),
            ),
          ),
          !_isFlipped
              ? Positioned(
                  top: height * .185,
                  right: width * .205,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Nick',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .25,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : SizedBox(),
          !_isFlipped
              ? Positioned(
                  top: height * .21,
                  left: width * .0925,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'shoulders',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .25,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : Positioned(
                  top: height * .19,
                  left: width * .1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trabs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .35,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  )),
          !_isFlipped
              ? Positioned(
                  top: height * .25,
                  left: width * .0925,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chest',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .34,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : Positioned(
                  top: height * .3,
                  left: width * .093,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lats',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .34,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  )),
          !_isFlipped
              ? Positioned(
                  top: height * .27,
                  right: width * .085,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Biceps',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .25,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : Positioned(
                  top: height * .27,
                  right: width * .085,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Triceps',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .25,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  )),
          !_isFlipped
              ? Positioned(
                  top: height * .32,
                  left: width * .05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forearms',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .2,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : SizedBox(),
          !_isFlipped
              ? Positioned(
                  top: height * .32,
                  right: width * .1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Abs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .4,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : Positioned(
                  top: height * .3375,
                  right: width * .06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Lower Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .4,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  )),
          !_isFlipped
              ? Positioned(
                  top: height * .4,
                  left: width * .1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aductors',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .375,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : Positioned(
                  top: height * .385,
                  left: width * .225,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Glutes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .25,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  )),
          !_isFlipped
              ? Positioned(
                  top: height * .425,
                  right: width * .1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Quads',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .3,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : Positioned(
                  top: height * .45,
                  right: width * .125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hamstrings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .3,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  )),
          _isFlipped
              ? Positioned(
                  top: height * .55,
                  left: width * .16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Calves',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * .03,
                            color: Colors.black),
                      ),
                      Container(
                        width: width * .3,
                        height: height * .006,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ))
              : SizedBox(),
        ],
      ),
    );
  }
}
