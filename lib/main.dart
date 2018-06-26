import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'RandomWordsState.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return MaterialApp(
    //   title: 'Welcome to Flutter',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Welcome to Flutter'),
    //     ),
    //     body: Center(
    //       child: RandomWords(),
    //     ),
    //   ),
    // );


    return MaterialApp(
      title: 'Starup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  createState() => RandomWordsState();
}
