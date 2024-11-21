import 'package:flutter/material.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';


class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  /// also support url like this: 'www.vimeo.com/70591644', 'vimeo.com/70591644'
  // final String _vimeoVideoUrl = 'https://vimeo.com/70591644';
  final String _vimeoVideoUrl = 'https://player.vimeo.com/video/841319969';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: VimeoVideoPlayer(
          url: _vimeoVideoUrl,
          autoPlay: true,
        ),
      ),
    );
  }
}