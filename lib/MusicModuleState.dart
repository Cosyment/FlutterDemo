import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';

class MusicModuleState extends State<MusicModule> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      displacement: 40.0,
      child: ListView.builder(
        itemBuilder: (context, i) {
          return _buildRow(context, i);
        },
      ),
      onRefresh: () {},
    );
    // return ListView.builder(
    //   physics: const AlwaysScrollableScrollPhysics(),
    //   itemBuilder: (context, i) {
    //     return _buildRow(context, i);
    //   },
    // );
  }

  Widget _buildRow(BuildContext context, int index) {
    return ListTile(
      trailing: Icon(Icons.face),
      title: Text(String.fromCharCode(index)),
      onLongPress: () {
        showDialog(
            context: context,
            builder: (builder) {
              return AlertDialog(
                  title: Text('提示'),
                  content: Text('确定删除?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('取消'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Text('确定'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ]);
            });
      },
    );
  }
}
