import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String videoUrl;

  WorkoutDetailsPage({required this.videoUrl});

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
  }
  //
  // Future<void> _initializeVideoPlayer() async {
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
  //   try {
  //     await _controller.initialize();
  //     setState(() {});
  //     _controller.addListener(() {
  //       if (_controller.value.isPlaying != _isPlaying) {
  //         setState(() {
  //           _isPlaying = _controller.value.isPlaying;
  //         });
  //       }
  //     });
  //   } catch (error) {
  //     print("Error initializing video player: $error");
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: height * 0.05,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _controller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                        _isPlaying = false;
                      } else {
                        _controller.play();
                        _isPlaying = true;
                      }
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      if (!_isPlaying)
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 80.0,
                        ),
                    ],
                  ),
                ),
              )
                  : Center(child: CircularProgressIndicator()),
              SizedBox(height: height * 0.02),
              Text(
                'NEXT EXERCISE',
                style: TextStyle(color: Colors.white70, fontSize: width * 0.04),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
