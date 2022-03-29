import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    final nameController = TextEditingController();
    final nameField = TextField(
      controller: nameController,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: '輸入姓名',
        labelStyle: TextStyle(fontSize: 20),
      ),
    );

    // Button.
    final btn = RaisedButton(
      child: Text('確定'),
      onPressed: () => _showSnackBar(nameController.text),
    );

    // Arrange widgets.
    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(child: nameField, width: 200, margin: EdgeInsets.symmetric(vertical: 10),),
          Container(child: btn, margin: EdgeInsets.symmetric(vertical: 10),),
        ],
      ),
    );

    return widget;
  }

  void _showSnackBar(String msg) {
    // 建立SnackBar物件
    final snackBar = SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blue,
    );

    // 顯示SnackBar
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
