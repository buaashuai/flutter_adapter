import 'package:flutter/material.dart';
import 'package:flutter_adapter/adapter_screen.dart';
import 'package:flutter_adapter/flexible_stateless_widget.dart';
import 'package:flutter_adapter_example/constant.dart';

class MyNormalPage extends StatelessWidget {
  final String textStr;

  MyNormalPage(this.textStr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page normal'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              superFunctionAdapter(context, {
                TEAdaptPlatform.phone.toString(): () {
                  print('tab me on ${TEAdaptPlatform.phone.toString()}');
                },
                TEAdaptPlatform.padPortrait.toString(): () {
                  print('tab me on ${TEAdaptPlatform.padPortrait.toString()}');
                },
                Constant.newPlatform.toString(): () {
                  print('tab me on ${Constant.newPlatform.toString()}');
                },
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              height: 100.0,
              color: superObjectAdapter(context, {TEAdaptPlatform.phone.toString(): Colors.yellow, TEAdaptPlatform.padPortrait.toString(): Colors.greenAccent}),
              child: Center(
                child: Text(
                  '$textStr ${superObjectAdapter(context, {
                    TEAdaptPlatform.phone.toString(): "[Phone]",
                    TEAdaptPlatform.padPortrait.toString(): "[PadPortrait]",
                    Constant.newPlatform: "[newPlatform]"
                  })} \n [click me]',
                  style: TextStyle(
                      fontSize: superObjectAdapter(context, {TEAdaptPlatform.phone.toString(): 18.0, TEAdaptPlatform.padPortrait.toString(): 38.0}),
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
