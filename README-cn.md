# flutter_adapter

一个解决flutter应用适配不同平台的插件，让你的flutter应用在一个工程中灵活高效的适配各种平台，实现UI最大化复用，业务逻辑代码在不同平台间完全共享。


# 不同平台适配效果

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/phone.gif" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/NewPlatform.png" width = "240" height = "500" /></td>
</tr>
</table>
<img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadLandscape.gif" width = "960" height = "600" />
<img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadPortrait.gif" width = "480" height = "768" />

## 使用方式

flutter_adapter插件内置了3类平台，分别是：手机（TEAdaptPlatform.phone）、pad横屏（TEAdaptPlatform.padLandscape）、pad竖屏（TEAdaptPlatform.padPortrait）
。如果你只适配部分平台，那么只需要对待适配的widget实现特定平台的build函数即可，其他未适配的平台默认会返回Phone的样式。<br>
使用的时候只需要在APP的入口处采用ScreenAdaptWidget，然后设置当前APP需要适配的平台名称即可。

### 插件使用示例：

```
ScreenAdaptWidget(
    platform: TEAdaptPlatform.phone.toString(),
    child: 任意widget
)),
```
如果你的某个StatelessWidget需要适配特定平台，只需要将该widget继承自FlexibleStatelessWidget，然后实现特定平台的build函数即可。
### StatelessWidget适配示例：

```
class MyStatelessPage extends FlexibleStatelessWidget {

  @override
  Widget buildPhone(BuildContext context) {
    return Text('Phone',style: TextStyle(fontSize: 18.0),);
  }

  @override
  Widget buildPadPortrait(BuildContext context) {
    return Text('PadPortrait',style: TextStyle(fontSize: 22.0),);
  }

  @override
  Widget buildPadLandscape(BuildContext context) {
    return Text('PadLandscape',style: TextStyle(fontSize: 30.0),);
  }
}
```
### StatefulWidget适配示例：
如果你的某个StatefulWidget需要适配特定平台，只需要将该StatefulWidget对应的的State继承自FlexibleState，然后实现特定平台的build函数即可，例如：
```
class MyStatefulPageState extends FlexibleState<MyStatefulPage> {

  @override
  Widget buildPhone(BuildContext context) {
    return Text('Phone',style: TextStyle(fontSize: 18.0),);
  }

  @override
  Widget buildPadPortrait(BuildContext context) {
    return Text('PadPortrait',style: TextStyle(fontSize: 22.0),);
  }

  @override
  Widget buildPadLandscape(BuildContext context) {
    return Text('PadLandscape',style: TextStyle(fontSize: 30.0),);
  }
}
```


### 普通Widget适配示例：
如果你的某个widget仅仅需要在不同平台中改变个别属性的值，那么只需要对特定的属性值进行跨平台适配即可，flutter_adapter提供了superObjectAdapter函数来解决属性值的跨平台适配难题。

```
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
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 100.0,
            color: superObjectAdapter(context, {TEAdaptPlatform.phone.toString(): Colors.yellow, TEAdaptPlatform.padPortrait.toString(): Colors.greenAccent}),
            child: Center(
              child: Text(
                '$textStr ${superObjectAdapter(context, {
                  TEAdaptPlatform.phone.toString(): "[Phone]",
                  TEAdaptPlatform.padPortrait.toString(): "[PadPortrait]"
                })}',
                style: TextStyle(
                    fontSize: superObjectAdapter(context, {TEAdaptPlatform.phone.toString(): 18.0, TEAdaptPlatform.padPortrait.toString(): 38.0}),
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/normalPhone.png" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/normalPadPortrait.png" width = "240" height = "500" /></td>
</tr>
</table>

# License

Copyright (C) 2019 The Android Open Source Project <br>
Copyright (C) 2019 WeslyWang

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
