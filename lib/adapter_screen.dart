import 'package:flutter/widgets.dart';

// support platforms
enum TEAdaptPlatform {
  phone,
  padPortrait, // Pad
  padLandscape, // Pad
}

InheritedScreenAdaptModel _adaptScreen(
    {BuildContext context, String screenKey}) {
  InheritedScreenAdaptModel model;
  if (screenKey != null && screenKey != '') {
    model = new InheritedScreenAdaptModel(screenKey);
  } else {
    model = new InheritedScreenAdaptModel(TEAdaptPlatform.phone.toString());
  }
//  print('ADAPT_SCREEN: adaptScreen:' + model.adaptModelKey.toString());
  return model;
}

//adapt dart object
dynamic superObjectAdapter(
    BuildContext context, Map<String, dynamic> adaptObjects) {
  dynamic result;
  var inheritedContext = InheritedScreenAdaptWidget.of(context);
  final inheritedModel = inheritedContext.inheritedScreenAdaptModel;
  if (adaptObjects.containsKey(inheritedModel.adaptModelKey)) {
    result = adaptObjects[inheritedModel.adaptModelKey];
  }
  return result;
}

Widget _invokeCallback(BuildContext context, WidgetBuilder builder) {
  return builder(context);
}

Widget fetchAdaptWidget(BuildContext context, InheritedScreenAdaptModel model,
    Map<String, WidgetBuilder> allAdapters) {
  Widget item = Container(
    child: Text('not found adapter ${model.adaptModelKey} in this widget'),
  );
  if (allAdapters.containsKey(model.adaptModelKey)) {
    item = _invokeCallback(context, allAdapters[model.adaptModelKey]);
  }
  return item;
}

// the data model for current screen-mode
class InheritedScreenAdaptModel {
  String adaptModelKey;

  InheritedScreenAdaptModel(this.adaptModelKey);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InheritedScreenAdaptModel &&
          runtimeType == other.runtimeType &&
          adaptModelKey == other.adaptModelKey;

  @override
  int get hashCode => adaptModelKey.hashCode;
}

class InheritedScreenAdaptWidget extends InheritedWidget {
  final InheritedScreenAdaptModel inheritedScreenAdaptModel;

  final Function(BuildContext context, {String screenKey}) onNewScreenMode;

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
  final String platform;

  ScreenAdaptWidget({@required this.child, @required this.platform});

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

  _changeScreenModel(BuildContext context, {String screenKey}) {
//    String re = screenKey + new DateTime.now().toString();
    setState(() {
      inheritedScreenAdaptModel =
          _adaptScreen(context: context, screenKey: screenKey);
    });
//    print('ADAPT_SCREEN: _changeScreenModel phone: ' + screenKey.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedScreenAdaptWidget(
        inheritedScreenAdaptModel: inheritedScreenAdaptModel,
        onNewScreenMode: _changeScreenModel,
        child: widget.child);
  }
}
