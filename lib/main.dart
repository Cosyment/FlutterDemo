import 'package:flutter/material.dart';
import 'HomeModuleState.dart';
import 'MusicModuleState.dart';
import 'VideoModuleState.dart';
import 'GameModuleState.dart';
import 'RandomWordsState.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainState();
  }
}

class MainState extends State<MyApp> {
  int _currentIndex = 0;
  String _title = '首页';
  List<BottomNavigationBarItem> _bottomNavigationBarItemList =
      _initBottomNavigationBarItem();
  List<Widget> _bodyList = _initBody();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _bodyList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomNavigationBarItemList,
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() {
              _title = (_bottomNavigationBarItemList[i].title as Text).data;
              _currentIndex = i;
            });
          },
        ),
      ),
    );
  }
}

List<Widget> _initBody() {
  final bodyList = <Widget>[];
  bodyList.add(HomeModule());
  bodyList.add(MusicModule());
  bodyList.add(VideoModule());
  bodyList.add(GameModule());
  return bodyList;
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
  createState() => MusicModuleState();
}

class VideoModule extends StatefulWidget {
  @override
  createState() => VideoModuleState();
}

class GameModule extends StatefulWidget {
  @override
  createState() => GameModuleState();
}
