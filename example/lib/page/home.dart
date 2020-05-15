import 'package:flutter/material.dart';

import 'package:flutter_adapter/flutter_adapter.dart';
import 'package:flutter_adapter_example/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('plugin example'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MyStatefulWidget('I love flutter'),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final String textStr;

  MyStatefulWidget(this.textStr);

  @override
  State<StatefulWidget> createState() {
    return MyStatefulWidgetState();
  }
}

class MyStatefulWidgetState extends FlexibleState<MyStatefulWidget> {
  @override
  Widget buildPhone(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Constant.globalNavigatorKey.currentState.pushNamed(
              Constant.page1,
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
                '${widget.textStr} [Phone] [click me]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Constant.globalNavigatorKey.currentState.pushNamed(
              Constant.page2,
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
                '${widget.textStr} [Phone] [click me]',
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
                '${widget.textStr} [Phone] [click me]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildPhoneLandscape(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 0.0),
              width: 200.0,
              height: 200.0,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  '${widget.textStr} [PhoneLandscape]',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(bottom: 0.0),
                    width: double.infinity,
                    height: 100.0,
                    color: Colors.lightGreenAccent,
                    child: Center(
                      child: Text(
                        '${widget.textStr} [PhoneLandscape]',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.black26,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(bottom: 0.0),
                    width: double.infinity,
                    height: 100.0,
                    color: Colors.lightGreenAccent,
                    child: Center(
                      child: Text(
                        '${widget.textStr} [PhoneLandscape]',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildPadPortrait(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Constant.globalNavigatorKey.currentState.pushNamed(
              Constant.page1,
            );
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 200.0,
            color: Colors.yellow,
            child: Center(
              child: Text(
                '${widget.textStr} [PadPortrait] [click me]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Constant.globalNavigatorKey.currentState.pushNamed(
              Constant.page2,
            );
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 200.0,
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(
                '${widget.textStr} [PadPortrait] [click me]',
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
            height: 200.0,
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(
                '${widget.textStr} [PadPortrait] [click me]',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildPadLandscape(BuildContext context) {
    return Container(
      height: 400.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Constant.globalNavigatorKey.currentState.pushNamed(
                  Constant.page1,
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 30.0),
                height: 200.0,
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    '${widget.textStr} [PadLandscape] [click me]',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Constant.globalNavigatorKey.currentState.pushNamed(
                  Constant.page2,
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 30.0),
                height: 200.0,
                color: Colors.lightGreenAccent,
                child: Center(
                  child: Text(
                    '${widget.textStr} [PadLandscape] [click me]',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
