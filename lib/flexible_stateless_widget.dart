import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adapter/adapter_screen.dart';

abstract class FlexibleStatelessWidget extends StatelessWidget {
  @protected
  InheritedScreenAdaptWidget getInheritedContext(BuildContext context) {
    return InheritedScreenAdaptWidget.of(context);
  }

//  @protected
//  Map<TEAdaptPlatform, WidgetBuilder> buildAdapters();

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
  Widget adaptStrategy(BuildContext context) {
    var inheritedContext = InheritedScreenAdaptWidget.of(context);
    final inheritedModel = inheritedContext.inheritedScreenAdaptModel;
    return fetchAdaptWidget(context, inheritedModel,
        {TEAdaptPlatform.phone: buildPhone, TEAdaptPlatform.padPortrait: buildPadPortrait, TEAdaptPlatform.padLandscape: buildPadLandscape});
  }

  Widget build(BuildContext context) {
    return adaptStrategy(context);
  }
}
