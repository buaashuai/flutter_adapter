import 'package:flutter/material.dart';
import 'package:flutter_adapter/flutter_adapter.dart';

class MyStatelessPage extends FlexibleStatelessWidget {
  final String textStr;

  MyStatelessPage(this.textStr);

  @override
  Widget buildPhone(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page 2'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 100.0,
            color: Colors.yellow,
            child: Center(
              child: Text(
                '$textStr [Phone]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 100.0,
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(
                '$textStr [Phone]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildPadPortrait(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page 2'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 100.0,
            color: Colors.yellow,
            child: Center(
              child: Text(
                '$textStr [PadPortrait]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 100.0,
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(
                '$textStr [PadPortrait]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildPadLandscape(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page 2'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 100.0,
            color: Colors.yellow,
            child: Center(
              child: Text(
                '$textStr [PadLandscape]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 100.0,
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(
                '$textStr [PadLandscape]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
