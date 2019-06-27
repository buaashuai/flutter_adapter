import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_adapter/adapter_screen.dart';
import 'package:flutter_adapter/flexible_state.dart';
import 'package:flutter_adapter/flexible_stateless_widget.dart';
import 'package:flutter_adapter/flutter_adapter.dart';
import 'package:flutter_adapter_example/constant.dart';
import 'package:flutter_adapter_example/page/custom_stateless_page.dart';
import 'package:flutter_adapter_example/page/home.dart';
import 'package:flutter_adapter_example/page/stateful_page.dart';
import 'package:flutter_adapter_example/page/stateless_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final bool isCustomPlatform = false; //change this variable to true then you see a user self-defined adapter

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      home: WillPopScope(
          onWillPop: () async {
            return !await Constant.globalNavigatorKey.currentState.maybePop();
          },
          child: ScreenAdaptWidget(
            platform: isCustomPlatform ? Constant.newPlatform : TEAdaptPlatform.phone.toString(),
            child: Navigator(
              key: Constant.globalNavigatorKey,
              initialRoute: isCustomPlatform ? Constant.page3 : Constant.home,
              onGenerateRoute: (settings) {
                final route = generateRouteFor(settings);
                if (route == null) {
                  throw Exception('unrecognized route: ${settings.name}');
                }
                return route;
              },
            ),
          )),
    );
  }
}

class TEPageRoute extends MaterialPageRoute {
  final String name;
  final bool animated;

  TEPageRoute({
    this.name,
    this.animated = true,
    WidgetBuilder builder,
  }) : super(
          builder: builder,
          fullscreenDialog: false,
          maintainState: true,
          settings: RouteSettings(name: name, isInitialRoute: !animated),
        );
}

Route generateRouteFor(RouteSettings settings) {
  final name = settings.name;
  Route route;
  if (name == Constant.home) {
    route = TEPageRoute(
      name: name,
      animated: false,
      builder: (BuildContext context) => HomePage(),
    );
  } else if (name == Constant.page1) {
    route = TEPageRoute(
      name: name,
      animated: true,
      builder: (BuildContext context) => MyStatefulPage('I love flutter'),
    );
  } else if (name == Constant.page2) {
    route = TEPageRoute(
      name: name,
      animated: true,
      builder: (BuildContext context) => MyStatelessPage('I love flutter'),
    );
  } else if (name == Constant.page3) {
    route = TEPageRoute(
      name: name,
      animated: true,
      builder: (BuildContext context) => MyCustomStatelessPage('I love flutter'),
    );
  }
  return route;
}
