import 'package:flutter/widgets.dart';

// support platforms
enum TEAdaptPlatform {
  phone,
  phoneLandscape,
  padPortrait, // Pad
  padLandscape, // Pad
}

InheritedScreenAdaptModel _adaptScreen({BuildContext context, String screenKey}) {
  InheritedScreenAdaptModel model;
  if (screenKey != null && screenKey != '') {
    model = new InheritedScreenAdaptModel(screenKey);
  } else {
    model = new InheritedScreenAdaptModel(TEAdaptPlatform.phone.toString());
  }
//  print('ADAPT_SCREEN: adaptScreen:' + model.adaptModelKey.toString());
  return model;
}

//adapt dart Object
dynamic superObjectAdapter(BuildContext context, Map<String, dynamic> adaptObjects) {
  dynamic result;
  var inheritedContext = InheritedScreenAdaptWidget.of(context);
  final inheritedModel = inheritedContext.inheritedScreenAdaptModel;
  if (adaptObjects.containsKey(inheritedModel.adaptModelKey)) {
    result = adaptObjects[inheritedModel.adaptModelKey];
  }
  return result;
}

//adapt dart Functions
void superFunctionAdapter(BuildContext context, Map<String, Function()> adaptFunctions) {
  Function result;
  var inheritedContext = InheritedScreenAdaptWidget.of(context);
  final inheritedModel = inheritedContext.inheritedScreenAdaptModel;
  if (adaptFunctions.containsKey(inheritedModel.adaptModelKey)) {
    result = adaptFunctions[inheritedModel.adaptModelKey];
  }
  if (result != null) {
    result();
  }
}

Widget _invokeCallback(BuildContext context, WidgetBuilder builder) {
  return builder(context);
}

Widget fetchAdaptWidget(BuildContext context, InheritedScreenAdaptModel model, Map<String, WidgetBuilder> allAdapters) {
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
      identical(this, other) || other is InheritedScreenAdaptModel && runtimeType == other.runtimeType && adaptModelKey == other.adaptModelKey;

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
    return context.dependOnInheritedWidgetOfExactType<InheritedScreenAdaptWidget>();
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
  final bool autoOrientation; // If automatically change the widget's style according to the screen's orientation

  ScreenAdaptWidget({@required this.child, @required this.platform, this.autoOrientation = false});

  @override
  State<StatefulWidget> createState() {
    return new _ScreenAdaptWidgetState();
  }
}

class _ScreenAdaptWidgetState extends State<ScreenAdaptWidget> with WidgetsBindingObserver {
  InheritedScreenAdaptModel inheritedScreenAdaptModel;

  _initData() {
    String screenKey = widget.platform;
    if (widget.autoOrientation) {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.landscape) {
        if (widget.platform == TEAdaptPlatform.padPortrait.toString()) {
          screenKey = TEAdaptPlatform.padLandscape.toString();
        } else if (widget.platform == TEAdaptPlatform.phone.toString()) {
          screenKey = TEAdaptPlatform.phoneLandscape.toString();
        }
      } else if (orientation == Orientation.portrait) {
        if (widget.platform == TEAdaptPlatform.padLandscape.toString()) {
          screenKey = TEAdaptPlatform.padPortrait.toString();
        } else if (widget.platform == TEAdaptPlatform.phoneLandscape.toString()) {
          screenKey = TEAdaptPlatform.phone.toString();
        }
      }
    }
    inheritedScreenAdaptModel = _adaptScreen(screenKey: screenKey);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initData();
  }

  @override
  void initState() {
    super.initState();
    if (widget.autoOrientation) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.autoOrientation) {
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  @override
  void didChangeMetrics() {
    Size screen = MediaQuery.of(context).size; // This is the screen size before screen direction changed.
    Orientation orientation = screen.width > screen.height ? Orientation.portrait : Orientation.landscape;
    if (widget.autoOrientation && orientation == Orientation.portrait && inheritedScreenAdaptModel.adaptModelKey == TEAdaptPlatform.phoneLandscape.toString()) {
      _changeScreenModel(context, screenKey: TEAdaptPlatform.phone.toString());
    } else if (widget.autoOrientation &&
        orientation == Orientation.landscape &&
        (inheritedScreenAdaptModel.adaptModelKey == TEAdaptPlatform.phone.toString())) {
      _changeScreenModel(context, screenKey: TEAdaptPlatform.phoneLandscape.toString());
    }
  }

  _changeScreenModel(BuildContext context, {String screenKey}) {
    setState(() {
      inheritedScreenAdaptModel = _adaptScreen(context: context, screenKey: screenKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedScreenAdaptWidget(inheritedScreenAdaptModel: inheritedScreenAdaptModel, onNewScreenMode: _changeScreenModel, child: widget.child);
  }
}
