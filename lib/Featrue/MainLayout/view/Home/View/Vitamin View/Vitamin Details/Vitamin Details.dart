import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:video_player/video_player.dart';

class VitaminDetails extends StatefulWidget {
  const VitaminDetails({super.key});

  @override
  State<VitaminDetails> createState() => _VitaminDetailsState();
}

class _VitaminDetailsState extends State<VitaminDetails> {
  late VideoPlayerController controller;
  bool isError = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/videos/Vitamins.mp4')
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          controller.play();
        }
      }).catchError((error) {
        setState(() {
          isError = true;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 50,
          title:  Text(
            'Potassium',
            style: TextStyle(
                color: Colors.white,
                fontSize: width*.05,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height * .7,
              child: GestureDetector(
                onTap: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                },
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              ),
            ),
            SizedBox(
              height: height * .025,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'potassium',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Vitamin',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    ' 20 - 100 ml',
                    style: TextStyle(
                        color: Colors.white30,
                        fontSize: width * .04,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * .015,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * .075,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'a mineral that your body needs to work properly. It is a type of electrolyte. It helps your nerves to function and muscles to contract. It helps your heartbeat stay regular. It also helps move nutrients into cells and waste products out of cells',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * .04,
                    ),
                  ),
                  SizedBox(
                    height: height * .035,
                  ),

                  Image(image: AssetImage('assets/images/Potassium_food.png'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
