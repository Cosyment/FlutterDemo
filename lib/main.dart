import 'package:flutter/material.dart';

import 'RandomWordsState.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Starup Name Generator',
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.white
      ),
    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  createState() => RandomWordsState();
}

