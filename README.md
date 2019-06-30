# flutter_adapter

一个解决flutter应用适配不同平台的插件，让你的flutter应用在一个工程中灵活高效的适配各种平台，实现UI最大化复用，业务逻辑代码平台间完全共享。


# 不同平台适配效果

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/phone.gif" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/NewPlatform.png" width = "240" height = "500" /></td>

</tr>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadPortrait.gif" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadLandscape.gif" width = "240" height = "500" /></td>
</tr>
</table>

## 使用方式

flutter_adapter插件内置了3类平台，分别是：手机（TEAdaptPlatform.phone）、pad横屏（TEAdaptPlatform.padLandscape）、pad竖屏（TEAdaptPlatform.padPortrait）
。如果你只适配部分平台，那么只需要对需要适配的widget实现特定平台的build函数即可，其他未适配的平台默认会返回Phone的样式。<br>
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