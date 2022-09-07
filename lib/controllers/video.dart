import 'package:adessua/models/lesson_model.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoDisplay extends StatefulWidget {
  final bool islooping;
  final String videoUrl, topicName;


  VideoDisplay({this.islooping, this.videoUrl, this.topicName, });

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  BetterPlayerController _betterPlayerController;
  GlobalKey _betterPlayerKey = GlobalKey();
  BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: widget.islooping,
      autoDetectFullscreenDeviceOrientation: true,
      placeholder: Image.asset("assets/img/colorful.jpg"),
      showPlaceholderUntilPlay: true,
      autoDispose: true,

    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.videoUrl);

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return    Scaffold(
      appBar: AppBar(title:Text('Lessons')),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                  key: _betterPlayerKey, controller: _betterPlayerController),
            ),
          )
        ],
      ),
    );
  }

}
