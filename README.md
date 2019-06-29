# flutter_adapter

一个解决flutter应用适配不同平台的插件，让你的flutter应用能够灵活高效的适配各种平台。

## 使用方式

flutter_adapter插件内置了3类平台，分别是：手机（TEAdaptPlatform.phone），pad横屏（TEAdaptPlatform.padLandscape），pad竖屏（TEAdaptPlatform.padPortrait）
。使用的时候只需要在APP的入口处采用ScreenAdaptWidget，然后设置当前APP需要适配的平台名称即可
```
ScreenAdaptWidget(
    platform: TEAdaptPlatform.phone.toString(),
    child: 任意widget
)),
```
如果你的某个StatelessWidget需要适配特定平台，只需要将你自己的widget继承自FlexibleStatelessWidget，然后实现特定平台的build函数即可，例如：
```
class MyStatelessPage extends FlexibleStatelessWidget {
  MyStatelessPage();

  @override
  Widget buildPhone(BuildContext context) {
    return Text('Phone',style: TextStyle(fontSize: 18.0),);
  }

  @override
  Widget buildPadPortrait(BuildContext context) {
    return Text('PadPortrait',style: TextStyle(fontSize: 18.0),);
  }

  @override
  Widget buildPadLandscape(BuildContext context) {
    return Text('PadLandscape',style: TextStyle(fontSize: 18.0),);
  }
}
```
如果你只实现其中的部分平台，那么只需要实现特定平台的build函数即可，其他平台默认会返回Phone的样式。
如果你的某个StatefulWidget需要适配特定平台，只需要将该StatefulWidget对应的的State继承自FlexibleState，然后实现特定平台的build函数即可，例如：
```
class MyStatefulPageState extends FlexibleState<MyStatefulPage> {

  @override
  Widget buildPhone(BuildContext context) {
    return Text('Phone',style: TextStyle(fontSize: 18.0),);
  }

  @override
  Widget buildPadPortrait(BuildContext context) {
    return Text('PadPortrait',style: TextStyle(fontSize: 18.0),);
  }

  @override
  Widget buildPadLandscape(BuildContext context) {
    return Text('PadLandscape',style: TextStyle(fontSize: 18.0),);
  }
}
```

# Preview

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/phone.gif" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadLandscape.gif" width = "240" height = "500" /></td>
</tr>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadPortrait.gif" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/NewPlatform.png" width = "240" height = "500" /></td>
</tr>
</table>


This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
    