import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'main.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  int _currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            _suggestions.clear();
          });
        },
        tooltip: 'delete',
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        items: _initBottomNavigationBarItem(),
        currentIndex: _currentIdx,
        onTap: (i) {
          setState(() {
            _currentIdx = i;
          });
        },
      ),
    );
  }

  /// 初始化底部菜单
  List<BottomNavigationBarItem> _initBottomNavigationBarItem() {
    final bottomNavigationItem = <BottomNavigationBarItem>[];
    bottomNavigationItem.add(
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')));
    bottomNavigationItem.add(BottomNavigationBarItem(
        icon: Icon(Icons.library_music), title: Text('音乐')));
    bottomNavigationItem.add(BottomNavigationBarItem(
        icon: Icon(Icons.featured_video), title: Text('视频')));
    bottomNavigationItem.add(
        BottomNavigationBarItem(icon: Icon(Icons.games), title: Text('游戏')));
    return bottomNavigationItem;
  }

  ///构造列表
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      //对于每个建议的单词都会调用一次itemBuilder,然后将单词对添加到listTile行中
      //在偶数行，该函数会为单词对添加 一个listTile row.
      //在奇数行，该函数添加一个分割线widget，来分隔相邻的词对
      //注意，在小屏幕上分割线看起来可能比较吃力
      itemBuilder: (context, i) {
        //在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return Divider();

        //语法“i~/2"表示i除以2，但返回值是整型（向下取整），
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  ///构造第行数据
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        //在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  ///点击菜单跳转页面
  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              _saved.clear();
            });
          },
        ),
      );
    }));
  }
}
