import 'package:flutter/widgets.dart';

// support platforms
enum TEAdaptPlatform {
  phone,
  padPortrait, // Pad
  padLandscape, // Pad
}

// the data model for current screen-mode
class InheritedScreenAdaptModel {
  TEAdaptPlatform adaptModelKey;

  InheritedScreenAdaptModel(this.adaptModelKey);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is InheritedScreenAdaptModel && runtimeType == other.runtimeType && adaptModelKey == other.adaptModelKey;

  @override
  int get hashCode => adaptModelKey.hashCode;
}

InheritedScreenAdaptModel _adaptScreen({BuildContext context, TEAdaptPlatform screenKey}) {
  InheritedScreenAdaptModel model = new InheritedScreenAdaptModel(TEAdaptPlatform.phone);
  if (screenKey != null) {
    model = new InheritedScreenAdaptModel(screenKey);
  }
//  print('ADAPT_SCREEN: adaptScreen:' + model.adaptModelKey.toString());
  return model;
}

Widget _invokeCallback(BuildContext context, WidgetBuilder builder) {
  return builder(context);
}

Widget fetchAdaptWidget(BuildContext context, InheritedScreenAdaptModel model, Map<TEAdaptPlatform, WidgetBuilder> adapters) {
  Widget item;
  switch (model.adaptModelKey) {
    case TEAdaptPlatform.phone:
      item = _invokeCallback(context, adapters[TEAdaptPlatform.phone]);
      break;
    case TEAdaptPlatform.padLandscape:
      item = _invokeCallback(context, adapters[TEAdaptPlatform.padLandscape]);
      break;
    case TEAdaptPlatform.padPortrait:
      item = _invokeCallback(context, adapters[TEAdaptPlatform.padPortrait]);
      break;
    default:
      item = _invokeCallback(context, adapters[TEAdaptPlatform.phone]);
      break;
  }
  return item;
}

class InheritedScreenAdaptWidget extends InheritedWidget {
  final InheritedScreenAdaptModel inheritedScreenAdaptModel;

  final Function(BuildContext context, {TEAdaptPlatform screenKey}) onNewScreenMode;

  InheritedScreenAdaptWidget({
    Key key,
    @required this.inheritedScreenAdaptModel,
    @required this.onNewScreenMode,
    @required Widget child,
  }) : super(key: key, child: child);

  static InheritedScreenAdaptWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedScreenAdaptWidget);
  }

  @override
  bool updateShouldNotify(InheritedScreenAdaptWidget oldWidget) {
//    print('updateShouldNotify');
    return inheritedScreenAdaptModel != oldWidget.inheritedScreenAdaptModel;
  }
}

class ScreenAdaptWidget extends StatefulWidget {
  final Widget child;
  final TEAdaptPlatform platform;

  ScreenAdaptWidget({@required this.child, this.platform = TEAdaptPlatform.phone});

  @override
  State<StatefulWidget> createState() {
    return new _ScreenAdaptWidgetState();
  }
}

class _ScreenAdaptWidgetState extends State<ScreenAdaptWidget> {
  InheritedScreenAdaptModel inheritedScreenAdaptModel;

  _initData() {
    inheritedScreenAdaptModel = _adaptScreen(screenKey: widget.platform);
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _changeScreenModel(BuildContext context, {TEAdaptPlatform screenKey}) {
//    String re = screenKey + new DateTime.now().toString();
    setState(() {
      inheritedScreenAdaptModel = _adaptScreen(context: context, screenKey: screenKey);
    });
//    print('ADAPT_SCREEN: _changeScreenModel phone: ' + screenKey.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedScreenAdaptWidget(inheritedScreenAdaptModel: inheritedScreenAdaptModel, onNewScreenMode: _changeScreenModel, child: widget.child);
  }
}
