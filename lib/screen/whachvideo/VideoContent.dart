import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:beautyapp/model/youtubemodel.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/api.dart';
import '../../utils/constant.dart';
import '../home/home.dart';

class VideoContent extends StatefulWidget {
  const VideoContent({Key? key}) : super(key: key);

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> with TickerProviderStateMixin {
  final  videoUrl = 'https://www.youtube.com/watch?v=bLCw2brsgUs';
  late YoutubePlayerController _controller;
  Future<youtubemodel>? futureAlbum ;

  Future<youtubemodel> fetchAlbum() async {
    final response = await CallApi().getData('getYoutube/');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return youtubemodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load skine profile');
    }
  }
  @override
  void initState() {

    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      )

    );
    super.initState();
    futureAlbum = fetchAlbum();
  }
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: const ParticleOptions(
          spawnMaxRadius: 50,
          spawnMinSpeed: 10.00,
          particleCount: 28,
          spawnMaxSpeed: 50,
          minOpacity: 0.1,
          baseColor: Colors.white38,
        ),
      ),
      vsync: this,
      child: ListView(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
          children: [
            Row(children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return  HomePage();
                      }));
                },
                color: Colors.pink,
              ),
              const Text(
                ' Home',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: KPrimaryColor),
              )
            ]),
            const Text(
              'Watch Video.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25,),
    Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: YoutubePlayer(
    controller: _controller,
    showVideoProgressIndicator: true,
    onReady: ()=>debugPrint('Ready'),
    bottomActions: [
    CurrentPosition(),
    ProgressBar(
    isExpanded: true,
    colors: const ProgressBarColors(
    playedColor: Colors.pink,
    handleColor: Colors.pinkAccent,
    ),
    ),
    const PlaybackSpeedButton(),
    ],


    ),
    )




          ]
      ),
    );
  }
}


