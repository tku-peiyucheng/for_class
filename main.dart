import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('Animation Examples'),
    );

    // 建立App的操作畫面
    final animationWrapper = _AnimationWrapper(
        GlobalKey<_AnimationWrapperState>(), Alignment.bottomCenter);

    var btn = RaisedButton.icon(
      icon: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 10),
        child: Icon(Icons.airplanemode_active, color: Colors.white),
      ),
      label: Padding(
        padding: EdgeInsets.only(left: 0, top: 10, right: 20, bottom: 10),
        child: Text('起飛', style: TextStyle(fontSize: 18, color: Colors.white),),
      ),
      color: Colors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        animationWrapper.setAlignment(Alignment.topCenter);
      },
    );

    final widget = Center(
      child: Container(
        height: 500,
        child: Column(
          children: <Widget>[animationWrapper,
            Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),)],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> _key;
  Alignment _alignment;

  _AnimationWrapper(this._key, this._alignment): super (key: _key);

  @override
  State<StatefulWidget> createState() => _AnimationWrapperState();

  setAlignment(Alignment alignment) {
    _key.currentState.setAlignment(alignment);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    var w = Expanded(
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: Icon(Icons.airplanemode_active, color: Colors.lightBlue, size: 50),
        alignment: widget._alignment,
        onEnd: () {
          setState(() {
            widget._alignment = Alignment.bottomCenter;
          });
        },
      ),
    );

    return w;
  }

  setAlignment(Alignment alignment) {
    setState(() {
      widget._alignment = alignment;
    });
  }
}