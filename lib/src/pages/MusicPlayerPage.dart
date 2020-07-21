import 'package:flutter/material.dart';
import 'package:music_player/src/Widgets/CustomAppBar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImagenDiscoDuracion(),
              BarraProgreso()
            ],
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
    return Container(
      padding: EdgeInsets.all(20.0),
      width: 250.0,
      height: 250.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: [

            Image(image: AssetImage("assets/aurora.jpg")),

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