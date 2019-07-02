# flutter_adapter

A plugin that adapts the flutter application to different platforms, allowing your flutter application to flexibly and efficiently adapt to various platforms in the same flutter project, maximizing UI multiplexing, and sharing business logic code across different platforms.
<br><br>
<font size=8>[Readme for Chinese](https://github.com/buaashuai/flutter_adapter/blob/master/README-ch.md)</font>

# Preview

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/phone.gif" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/NewPlatform.png" width = "240" height = "500" /></td>
</tr>
</table>
<img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadLandscape.gif" width = "960" height = "600" />
<img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadPortrait.gif" width = "480" height = "768" />

## Usage

The flutter_adapter plugin has three built-in platforms: mobile phone (TEAdaptPlatform.phone), pad horizontal screen (TEAdaptPlatform.padLandscape), pad vertical screen (TEAdaptPlatform.padPortrait). If you only need to adapt part of platforms, you only need to make the widget implement the platform-specific build function. Other unsuited platforms will return the Phone style by default.

### Example
When you use flutter_adapter, you only need to use ScreenAdaptWidget at the entrance of the app, and then set the platform name that the current APP needs to adapt.

```
ScreenAdaptWidget(
    platform: TEAdaptPlatform.phone.toString(),
    child: 任意widget
)),
```

### StatelessWidget Example
If one of your StatelessWidgets needs to be adapted to a particular platform, just pass the widget from the FlexibleStatelessWidget and implement the platform-specific build function.

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


### StatefulWidget Example
If one of your StatefulWidgets needs to be adapted to a specific platform, you only need to inherit the State corresponding to the StatefulWidget from FlexibleState, and then implement the build function of the specific platform.

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
