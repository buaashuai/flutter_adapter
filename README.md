# flutter_adapter

A plugin that adapts the flutter application to different platforms, allowing your flutter application to flexibly and efficiently adapt to various platforms in the same flutter project, maximizing UI multiplexing, and sharing business logic code across different platforms.
<br><br>
<font size=8>[Readme for Chinese](https://github.com/buaashuai/flutter_adapter/blob/master/README-cn.md)</font>

# Preview

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/phone.gif" width = "240" height = "500" /></td>
<td><img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/NewPlatform.png" width = "240" height = "500" /></td>
</tr>
</table>
<img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadLandscape.gif" width = "960" height = "600" />
<img src="https://raw.githubusercontent.com/buaashuai/flutter_adapter/master/preview/PadPortrait.gif" width = "600" height = "960" />

## Usage

The flutter_adapter plugin has three built-in platforms: mobile phone (TEAdaptPlatform.phone), pad horizontal screen (TEAdaptPlatform.padLandscape), pad vertical screen (TEAdaptPlatform.padPortrait). If you only need to adapt part of platforms, you only need to make the widget implement the platform-specific build function. Other unsuited platforms will return the Phone style by default.

### Example
When you use flutter_adapter, you only need to use ScreenAdaptWidget at the entrance of the app, and then set the platform name that the current APP needs to adapt.

```
ScreenAdaptWidget(
    platform: TEAdaptPlatform.phone.toString(),
    child: any widget
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

### Normal Widget Example
If one of your widgets only needs to change the value of an individual attribute value on a different platform, then only a cross-platform adaptation of the specific attribute is required. flutter_adapter provides a ```superObjectAdapter ``` function to solve the cross-platform adaptation problem of attribute values.

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
