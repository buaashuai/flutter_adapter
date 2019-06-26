import 'package:flutter/widgets.dart';

// 支持适配的平台
enum TEAdaptPlatform {
  phone, //手机
  dingDang, //叮当
  padPortrait, // Pad 竖屏
  padLandscape, // Pad 横屏
}

//用于保存当前适配的屏幕的相关数据
class InheritedScreenAdaptModel {
  TEAdaptPlatform adaptModelKey; //当前适配的屏幕 key
  InheritedScreenAdaptModel(this.adaptModelKey);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is InheritedScreenAdaptModel && runtimeType == other.runtimeType && adaptModelKey == other.adaptModelKey;

  @override
  int get hashCode => adaptModelKey.hashCode;
}

//构造新的屏幕适配模型
InheritedScreenAdaptModel _adaptScreen({BuildContext context, TEAdaptPlatform screenKey}) {
  InheritedScreenAdaptModel model = new InheritedScreenAdaptModel(TEAdaptPlatform.phone);
  if (screenKey != null) {
    model = new InheritedScreenAdaptModel(screenKey);
  }
//  print('ADAPT_SCREEN: adaptScreen:' + model.adaptModelKey.toString());
  return model;
}

// 执行函数回调
Widget _invokeCallback(BuildContext context, WidgetBuilder builder) {
  return builder(context);
}

// 多屏幕适配策略
Widget fetchAdaptWidget(BuildContext context, InheritedScreenAdaptModel model, Map<TEAdaptPlatform, WidgetBuilder> adapters) {
  // TODO 适配策略得优化（最好是决策树模型，动态适配）
  Widget item;
//  Widget item = _invokeCallback(context, adapters[TEAdaptPlatform.PHONE]); //默认用 phone 的适配
  switch (model.adaptModelKey) {
    case TEAdaptPlatform.phone:
      item = _invokeCallback(context, adapters[TEAdaptPlatform.phone]);
      break;
    case TEAdaptPlatform.dingDang:
      item = _invokeCallback(context, adapters[TEAdaptPlatform.dingDang]);
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
  //屏幕适配数据
  final InheritedScreenAdaptModel inheritedScreenAdaptModel;

  final Function(BuildContext context, {TEAdaptPlatform screenKey}) onNewScreenMode; //适配新的屏幕模式

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

// 屏幕适配组件
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
  InheritedScreenAdaptModel inheritedScreenAdaptModel; //屏幕适配模型

  _initData() {
    inheritedScreenAdaptModel = _adaptScreen(screenKey: widget.platform); //初始化屏幕适配模型
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
