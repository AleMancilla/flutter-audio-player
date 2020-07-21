import 'package:flutter/material.dart';
import 'package:music_player/src/pages/MusicPlayerPage.dart';
import 'package:music_player/src/theme/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Players',
      theme: miTema,
      home: MusicPlayerPage()
    );
  }
}