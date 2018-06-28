import 'package:flutter/material.dart';
import 'main.dart';

class VideoModuleState extends State<VideoModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // const SliverAppBar(
          //   pinned: true,
          //   expandedHeight: 250.0,
          //   flexibleSpace: const FlexibleSpaceBar(
          //     title: const Text('Demo'),
          //   ),
          // ),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Image.network(
                    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1529640778,2280694627&fm=27&gp=0.jpg',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                );
              },
              childCount: 20,
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
