import 'package:flutter/material.dart';
import 'HomeModuleState.dart';
import 'MusicModuleState.dart';
import 'VideoModuleState.dart';
import 'GameModuleState.dart';
import 'RandomWordsState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int _currentIndex = 0;

  // @override
  //   State<StatefulWidget> createState() {
  //     // TODO: implement createState
  //     return Scaffold(
  //       body: Text('data'),
  //     );
  //   }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Starup Name Generator',
  //     // home: RandomWords(),
  //     home: DefaultTabController(
  //       child: RandomWords(),
  //       length: 4,
  //     ),
  //     theme: ThemeData(primaryColor: Colors.white),

  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _initBottomNavigationBarItem(),
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}

/// 初始化底部菜单
List<BottomNavigationBarItem> _initBottomNavigationBarItem() {
  final bottomNavigationItem = <BottomNavigationBarItem>[];
  bottomNavigationItem
      .add(BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')));
  bottomNavigationItem.add(BottomNavigationBarItem(
      icon: Icon(Icons.library_music), title: Text('音乐')));
  bottomNavigationItem.add(BottomNavigationBarItem(
      icon: Icon(Icons.featured_video), title: Text('视频')));
  bottomNavigationItem
      .add(BottomNavigationBarItem(icon: Icon(Icons.games), title: Text('游戏')));
  return bottomNavigationItem;
}

class RandomWords extends StatefulWidget {
  @override
  createState() => RandomWordsState();
}

class HomeModule extends StatefulWidget {
  @override
  createState() => HomeModuleState();
}

class MusicModule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MusicModuleState();
  }
}

class VideoModule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VideoModuleState();
  }
}

class GameModule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GameModuleState();
  }
}
