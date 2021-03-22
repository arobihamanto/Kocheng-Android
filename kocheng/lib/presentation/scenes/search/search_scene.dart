import 'package:flutter/material.dart';

class SearchScene extends StatefulWidget {
  @override
  _SearchSceneState createState() => _SearchSceneState();
}

class _SearchSceneState extends State<SearchScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Cat'),
      ),
      body: Container(),
    );
  }
}
