import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widget/videowidget.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final String videoUrl;
  final String id;

  WorkoutDetailsPage({required this.videoUrl, required this.id, });

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse('https://vimeo.com/1015756012'));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    _controller.play();
  }


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
                      VideoWidget( controller: _controller, id: widget.id,),
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
                  : Center(child: CircularProgressIndicator(color: Colors.white,)),
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
