import 'package:flutter/material.dart';

import 'package:flutter_adapter/flutter_adapter.dart';
import 'package:flutter_adapter_example/constant.dart';
import 'package:flutter_adapter_example/page/custom_stateful_page.dart';
import 'package:flutter_adapter_example/page/custom_stateless_page.dart';
import 'package:flutter_adapter_example/page/home.dart';
import 'package:flutter_adapter_example/page/normal_page.dart';
import 'package:flutter_adapter_example/page/stateful_page.dart';
import 'package:flutter_adapter_example/page/stateless_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final bool isCustomPlatform = false; //change this variable to true then you will see a user self-defined adapter example

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
            autoOrientation: true,
            child: Navigator(
              key: Constant.globalNavigatorKey,
              initialRoute: isCustomPlatform ? Constant.pageCustomPlatform : Constant.home,
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
  } else if (name == Constant.pageCustomPlatform) {
    route = TEPageRoute(
      name: name,
      animated: true,
      builder: (BuildContext context) => MyCustomStatelessPage('I love flutter'),
    );
  } else if (name == Constant.page4) {
    route = TEPageRoute(
      name: name,
      animated: true,
      builder: (BuildContext context) => MyNormalPage('I love flutter'),
    );
  } else if (name == Constant.page5) {
    route = TEPageRoute(
      name: name,
      animated: true,
      builder: (BuildContext context) => MyCustomStatefulPage('I love flutter'),
    );
  }
  return route;
}
