import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adapter/flexible_state.dart';

class MyStatefulPage extends StatefulWidget {
  final String textStr;

  MyStatefulPage(this.textStr);

  @override
  State<StatefulWidget> createState() {
    return MyStatefulPageState();
  }
}

class MyStatefulPageState extends FlexibleState<MyStatefulPage> {
  @override
  Widget buildPhone(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page 1'),
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
                '${widget.textStr} [Phone]',
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
                '${widget.textStr} [Phone]',
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
        title: const Text('page 1'),
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
                '${widget.textStr} [PadPortrait]',
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
                '${widget.textStr} [PadPortrait]',
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
        title: const Text('page 1'),
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
                '${widget.textStr} [PadLandscape]',
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
                '${widget.textStr} [PadLandscape]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
