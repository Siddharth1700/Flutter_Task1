import 'package:app/UI/NetworkVideo.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:ocarina/ocarina.dart';

final player = OcarinaPlayer(
  asset: 'assets/audio/audiofromapp.mp3',
);

final assetsAudioPlayer = AssetsAudioPlayer();
audio_video_app() {
  mybody() {
    player.load();
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/musicIcon.jpg'),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              color: Colors.black12,
              margin: EdgeInsets.only(left: 20, top: 120, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Audio Without Network"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Icon(Icons.play_arrow),
                        onPressed: () {
                          print("Playing");
                          player.play();
                        },
                      ),
                      RaisedButton(
                        child: Icon(Icons.pause),
                        onPressed: () {
                          print("Pausing");
                          player.pause();
                        },
                      ),
                      RaisedButton(
                        child: Icon(Icons.stop),
                        onPressed: () {
                          print("Stopping");
                          player.stop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              margin: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Audio from Netwok"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Icon(Icons.play_arrow),
                        onPressed: () {
                          print("Playing");
                          assetsAudioPlayer.open(
                            Audio.network(
                                "https://raw.githubusercontent.com/Siddharth1700/Flutter_Task1/master/audiofromnetwork.mp3"),
                          );
                          assetsAudioPlayer.play();
                        },
                      ),
                      RaisedButton(
                        child: Icon(Icons.pause),
                        onPressed: () {
                          print("Pausing");
                          assetsAudioPlayer.pause();
                        },
                      ),
                      RaisedButton(
                        child: Icon(Icons.stop),
                        onPressed: () {
                          print("Stopping");
                          assetsAudioPlayer.stop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Video From Network"),
                  RaisedButton(
                    onPressed: () {
                      VideoNetwork();
                    },
                    child: Icon(Icons.play_arrow),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Audio & Video App"),
      ),
      body: mybody(),
    ),
  );
}
