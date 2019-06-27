import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adapter/adapter_screen.dart';

abstract class FlexibleStatelessWidget extends StatelessWidget {
  final Map<String, WidgetBuilder> _allAdapters = {};

  @protected
  InheritedScreenAdaptWidget getInheritedContext(BuildContext context) {
    return InheritedScreenAdaptWidget.of(context);
  }

  @protected
  Widget buildPhone(BuildContext context);

  @protected
  Widget buildPadPortrait(BuildContext context) {
    return buildPhone(context);
  }

  @protected
  Widget buildPadLandscape(BuildContext context) {
    return buildPhone(context);
  }

  @protected
  void addAdapter(String platformType, WidgetBuilder builder) {
    if (_allAdapters.containsKey(platformType)) {
      return;
    }
    _allAdapters[platformType] = builder;
  }

  @protected
  void initAdapter() {
    addAdapter(TEAdaptPlatform.phone.toString(), buildPhone);
    addAdapter(TEAdaptPlatform.padPortrait.toString(), buildPadPortrait);
    addAdapter(TEAdaptPlatform.padLandscape.toString(), buildPadLandscape);
  }

  @protected
  Widget adaptStrategy(BuildContext context) {
    var inheritedContext = InheritedScreenAdaptWidget.of(context);
    final inheritedModel = inheritedContext.inheritedScreenAdaptModel;
    return fetchAdaptWidget(context, inheritedModel, _allAdapters);
  }

  Widget build(BuildContext context) {
    initAdapter();
    return adaptStrategy(context);
  }
}
