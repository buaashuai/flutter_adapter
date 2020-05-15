import 'package:flutter/material.dart';
import 'package:flutter_adapter_example/adapter/custom_state.dart';

class MyCustomStatefulPage extends StatefulWidget {
  final String textStr;

  MyCustomStatefulPage(this.textStr);

  @override
  State<StatefulWidget> createState() {
    return MyCustomStatefulPageState();
  }
}

class MyCustomStatefulPageState extends CustomFlexibleState<MyCustomStatefulPage> {
  int num = 1;
  int num2 = 1;

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
              setState(() {
                num = num + 1;
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              height: 100.0,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  '${widget.textStr} [NewPlatform]  [click me]-$num',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                num2 = num2 + 1;
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              height: 100.0,
              color: Colors.lightGreenAccent,
              child: Center(
                child: Text(
                  '${widget.textStr} [NewPlatform]  [click me]-$num2',
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
