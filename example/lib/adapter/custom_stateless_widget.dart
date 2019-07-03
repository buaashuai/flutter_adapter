import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adapter/adapter_screen.dart';
import 'package:flutter_adapter/flexible_stateless_widget.dart';
import 'package:flutter_adapter_example/constant.dart';

abstract class CustomFlexibleStatelessWidget extends FlexibleStatelessWidget {
  @protected
  Widget buildNewPlatform(BuildContext context) {
    return buildPhone(context); // by default, you can return the phone's style
  }

  @protected
  void initAdapter() {
    super.initAdapter();
    addAdapter(Constant.newPlatform, buildNewPlatform); // register new Platform
//    print('add newPlatform');
  }
}
