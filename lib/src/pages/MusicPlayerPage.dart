import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/Widgets/CustomAppBar.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/AudioPlayerModel.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGorund(),
          Column(
            children: [
              CustomAppBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImagenDiscoDuracion(),
                  BarraProgreso()
                ],
              ),
              TituloYPlay(),
              Expanded(child: Lyris())
            ],
          ),
        ],
      ),
    );
  }
}

class BackGorund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      // color: Colors.red,
      height: size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28),
          ]
        )
      ),
    );
  }
}

class Lyris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final lirics = getLyrics();
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,

        children: lirics.map((e) => Text(e,style: TextStyle(fontSize: 20.0,color: Colors.white.withOpacity(0.6)),)).toList()
      ),
    );
  }
}

class TituloYPlay extends StatefulWidget {

  @override
  _TituloYPlayState createState() => _TituloYPlayState();
}

class _TituloYPlayState extends State<TituloYPlay> with SingleTickerProviderStateMixin{

  bool isPlaying = false;
  AnimationController playAnimation;

  final assetAudioPlayer = new AssetsAudioPlayer();
  bool firsTime = true ;

  void open()async{
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context,listen: false);
    await assetAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'));
    assetAudioPlayer.currentPosition.listen((event) { 
      audioPlayerModel.current = event;
    });

    assetAudioPlayer.current.listen((event) {
      audioPlayerModel.songDuration = event.audio.duration;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    playAnimation = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    playAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0),
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Titulo",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: Colors.white60),),
              Text("Subtitulo",style: TextStyle(color: Colors.white60),),
            ],
          ),
          FloatingActionButton(
            onPressed: (){
              final audioPlayerModel = Provider.of<AudioPlayerModel>(context,listen: false);
              if(this.isPlaying){
                playAnimation.reverse();
                this.isPlaying = false;
                audioPlayerModel.controller.stop();
              }else{
                playAnimation.forward();
                this.isPlaying = true;
                audioPlayerModel.controller.repeat();
              }

              if(firsTime){
                this.open();
                firsTime = false;
              }else{
                assetAudioPlayer.playOrPause();
              }
            },
            backgroundColor: Colors.orange,
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause, 
              progress: playAnimation
            )
          )
        ],
      ),
    );
  }
}

class BarraProgreso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("00:00", style: TextStyle(color: Colors.white54),),

        Stack(
          children: [
            Container(
              height: 200.0,
              width: 5.0,
              color: Colors.white12,
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                height: 100.0,
                width: 5.0,
                color: Colors.white54,
              ),
            ),
          ],
        ),

        Text("00:00", style: TextStyle(color: Colors.white54),),
      ],
    );
  }
}

class ImagenDiscoDuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: EdgeInsets.all(20.0),
      width: 250.0,
      height: 250.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: [

            SpinPerfect(
              duration: Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (animationController)=> audioPlayerModel.controller = animationController,
              child: Image(image: AssetImage("assets/aurora.jpg"))
            ),

            Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100)
              ),
            )
          ],
        )
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ]
        )
      ),
    );
  }
}