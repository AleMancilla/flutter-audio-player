import 'package:flutter/material.dart';
import 'package:music_player/src/models/AudioPlayerModel.dart';
import 'package:music_player/src/pages/MusicPlayerPage.dart';
import 'package:music_player/src/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>new AudioPlayerModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Players',
        theme: miTema,
        home: MusicPlayerPage()
      ),
    );
  }
}