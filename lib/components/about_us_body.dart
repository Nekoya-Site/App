import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({Key? key}) : super(key: key);

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://nekoya.moe.team/img/AboutUs.mp4'))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const Image(
                      image:
                          AssetImage('assets/images/about_us_thumbnail.webp'),
                    ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Card(
              color: const Color(0xff212226),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Nekoya is your place for sneakers for the entire family from many name brands. You’ll discover styles for ladies, men and children from brands like Nike, Converse, Vans, Sperry, Madden Girl, Skechers, ASICS and then some! Nekoya is a main family footwear goal for the popular brands you know and love.',
                  style: TextStyle(
                      fontSize: 20.0, color: Colors.white, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                    foregroundColor:
                        MaterialStateProperty.all(const Color(0xff8B0000)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff8B0000)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black)))),
                child: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  if (!await launchUrl(
                      Uri.parse('mailto:nekoya@chocola.dev'))) {
                    throw 'Could not launch';
                  }
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse('https://nekoya.moe.team'))) {
                    throw 'Could not launch';
                  }
                },
                child: const Text(
                  '© 2021-2023 Nekoya Co. Ltd.',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
          ),
        ],
      ),
    );
  }
}
