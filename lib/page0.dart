import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Page0 extends StatefulWidget {
  @override
  _Page0State createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  late YoutubePlayerController _controller;
  final String videoUrl = "https://youtu.be/WqzwrbzSqyY?si=6YOeBiwFnHKx7IRn";
  String? videoId;

  @override
  void initState() {
    super.initState();

    // Extraire l'ID de la vidéo
    videoId = YoutubePlayer.convertUrlToId(videoUrl);

    // Vérifiez que l'ID de la vidéo est valide
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    } else {
      print("Erreur : l'ID de la vidéo est introuvable.");
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Système Solaire',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: videoId == null
          ? Center(
              child: Text(
                "Impossible de charger la vidéo.",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : Center(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
              ),
            ),
    );
  }
}
