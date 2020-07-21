import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.red,
        margin: EdgeInsets.symmetric(vertical: 5.0, ),
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            Icon(Icons.arrow_left),
            Spacer(),
            Icon(Icons.chat_bubble_outline),
            SizedBox(width: 20.0,),
            Icon(Icons.headset),
            SizedBox(width: 20.0,),
            Icon(Icons.share),
          ],
        ),
      ),
    );
  }
}