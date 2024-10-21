import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class ExercisePage extends StatefulWidget {
  final String videoPath;
  final String title;

  ExercisePage({required this.videoPath, required this.title});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  String selectedTab = 'Animation';
  late VideoPlayerController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      }).catchError((error) {
        setState(() {
          _isError = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThirdColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                child: _isError
                    ? Center(
                  child: Text(
                    "Error loading video",
                    style: TextStyle(color: Colors.red),
                  ),
                )
                    : _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : Container(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTabButton('Animation', selectedTab == 'Animation'),
                    _buildTabButton('Muscle', selectedTab == 'Muscle'),
                    _buildTabButton('How to do', selectedTab == 'How to do'),
                  ],
                ),
              ),

              SizedBox(height: 20),

              _buildContent(),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'CLOSE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = text;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedTab == 'Animation') {
      return Text(
        'Animation content: Here is where the animation related content will be displayed.',
        style: TextStyle(fontSize: 16, color: Colors.white),
      );
    } else if (selectedTab == 'Muscle') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REPEATS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'x12',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),Text(
                'Sets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'x3',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Text(
            'INSTRUCTIONS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Start in the regular push-up position but with your hands spread wider than your shoulders.\n\n'
                'Then push your body up and down. Remember to keep your body straight.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 20),

          Text(
            'FOCUS AREA',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
        ],
      );


    } else if (selectedTab == 'How to do') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to do content: Step by step instructions.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      );
    }
    return Container();
  }
}
