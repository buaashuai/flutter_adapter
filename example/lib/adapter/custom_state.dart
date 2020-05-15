import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adapter/flutter_adapter.dart';
import 'package:flutter_adapter_example/constant.dart';

abstract class CustomFlexibleState<T extends StatefulWidget> extends FlexibleState<T> {
  @protected
  Widget buildNewPlatform(BuildContext context) {
    return buildPhone(context); // by default, you can return the phone's style
  }

  @protected
  void initAdapter() {
    super.initAdapter();
    addAdapter(Constant.newPlatform, buildNewPlatform); // register new Platform
  }
}
