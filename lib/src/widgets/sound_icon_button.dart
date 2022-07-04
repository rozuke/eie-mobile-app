import 'package:audioplayers/audioplayers.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

class SoundIconButton extends StatefulWidget {

  final String soundUrl;
  const SoundIconButton({Key? key, required this.soundUrl}) : super(key: key);

  @override
  State<SoundIconButton> createState() => _SoundIconButtonState();
}

class _SoundIconButtonState extends State<SoundIconButton> {

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.STOPPED;
  // String soundURL = this.soundUrl;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((PlayerState player) {
      playerState = player;
      setState(() {});
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: ThemeApp.secondaryBlueColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: IconButton(
        
        onPressed: () {
          playerState == PlayerState.PLAYING
          ? audioPlayer.pause()
          : audioPlayer.play(widget.soundUrl);
        },
        icon: Icon(playerState == PlayerState.PLAYING 
        ? Icons.pause_circle
        : Icons.play_arrow_rounded,
        color: Colors.white,
        size: 100,),
      ),
    );
  }
}