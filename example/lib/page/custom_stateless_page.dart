import 'package:flutter/material.dart';
import 'package:flutter_adapter_example/adapter/custom_stateless_widget.dart';
import 'package:flutter_adapter_example/constant.dart';

class MyCustomStatelessPage extends CustomFlexibleStatelessWidget {
  final String textStr;

  MyCustomStatelessPage(this.textStr);

  @override
  Widget buildNewPlatform(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page custom'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Constant.globalNavigatorKey.currentState.pushNamed(
                Constant.page5,
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              height: 100.0,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  '$textStr [NewPlatform] [click me]',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Constant.globalNavigatorKey.currentState.pushNamed(
                Constant.page4,
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              height: 100.0,
              color: Colors.lightGreenAccent,
              child: Center(
                child: Text(
                  '$textStr [NewPlatform] [click me]',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildPhone(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page custom'),
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
        title: const Text('page custom'),
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
        title: const Text('page custom'),
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
