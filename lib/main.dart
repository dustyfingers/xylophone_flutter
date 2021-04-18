import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKey(int keyNumber) {
    Color keyColor;
    int shownKeyNumber = keyNumber + 1;

    switch (keyNumber) {
      case 0:
        keyColor = Colors.red;
        break;
      case 1:
        keyColor = Colors.orange;
        break;
      case 2:
        keyColor = Colors.yellow;
        break;
      case 3:
        keyColor = Colors.green;
        break;
      case 4:
        keyColor = Colors.blue;
        break;
      case 5:
        keyColor = Colors.indigo;
        break;
      case 6:
        keyColor = Colors.purple;
        break;
      default:
        keyColor = Colors.red;
    }

    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: keyColor),
        onPressed: () {
          playSound(shownKeyNumber);
        },
        child: Text(
          'Note $shownKeyNumber',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  List buildKeyboard() {
    List keyboard = <Widget>[];
    for (int i = 0; i < 7; i++) {
      keyboard.add(buildKey(i));
    }
    return keyboard;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildKeyboard(),
            ),
          ),
        ),
      ),
    );
  }
}
