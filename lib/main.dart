import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_radio/flutter_radio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const streamUrl =
      "http://23.227.169.206:9300/;stream.mp3";

  bool isPlaying;

  @override
  void initState() {
    super.initState();
    audioStart();
    playingStatus();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Online Radio'),
          backgroundColor: Colors.pink.shade500,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.pink.shade600,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Icon(
                  Icons.radio,
                  size: 250,
                  color: Colors.white,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, bottom: 10),
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.play_circle_filled,
                            color: Colors.white,
                            size: 40,),
                          onPressed: () {
                            FlutterRadio.playOrPause(url: streamUrl);
                            playingStatus();
                          },
                        ),
                        Divider(),
                        FlatButton(
                          child: Icon(Icons.pause_circle_filled,
                            color: Colors.white,
                            size: 40,),
                          onPressed: () {
                            FlutterRadio.playOrPause(url: streamUrl);
                            playingStatus();
                          },
                        ),
                        Divider(),
                        FlatButton(
                          child: Icon(Icons.stop,
                            color: Colors.white,
                            size: 40,),
                          onPressed: () {
                            FlutterRadio.playOrPause(url: streamUrl);
                            playingStatus();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future playingStatus() async {
    bool isP = await FlutterRadio.isPlaying();
    setState(() {
      isPlaying = isP;
    });
  }
}