import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '瀏覽影像',
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
      title: Text('瀏覽影像'),
    );

    const images = <String>[
      'assets/image_1.jpeg',
      'assets/image_2.jpeg',
      'assets/image_1.jpeg'
    ];

    var imgBrowser = _ImageBrowser(GlobalKey<_ImageBrowserState>(), images);

    // 建立App的操作畫面
    final previousBtn = FlatButton(
      child: Image.asset('assets/previous.png'),
      onPressed: () {
        imgBrowser.previousImage();
      },
    );

    final nextBtn = FlatButton(
      child: Image.asset('assets/next.png'),
      onPressed: () {
        imgBrowser.nextImage();
      },
    );

    final widget = Center(
      child: Stack(children: <Widget>[
        Container(
          child: imgBrowser,
        ),
        Container(
          child: Row(
            children: <Widget>[previousBtn, nextBtn],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
        ),
      ], alignment: Alignment.topCenter),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _ImageBrowser extends StatefulWidget {
  final GlobalKey<_ImageBrowserState> _key;
  List<String> _images;
  int _imageIndex;

  _ImageBrowser(this._key, this._images) : super(key: _key) {
    _imageIndex = 0;
  }

  @override
  State<StatefulWidget> createState() => _ImageBrowserState();

  previousImage() => _key.currentState.previousImage();
  nextImage() => _key.currentState.nextImage();
}

class _ImageBrowserState extends State<_ImageBrowser> {
  @override
  Widget build(BuildContext context) {
    var img = PhotoView(
        imageProvider: AssetImage(widget._images[widget._imageIndex]),
        minScale: PhotoViewComputedScale.contained * 0.6,
        maxScale: PhotoViewComputedScale.covered,
        enableRotation: true,
        backgroundDecoration: BoxDecoration(
          color: Colors.white,
        ));
    return img;
  }

  previousImage() {
    widget._imageIndex = widget._imageIndex == 0
        ? widget._images.length - 1
        : widget._imageIndex - 1;
    setState(() {});
  }

  nextImage() {
    widget._imageIndex = ++widget._imageIndex % widget._images.length;
    setState(() {});
  }
}
