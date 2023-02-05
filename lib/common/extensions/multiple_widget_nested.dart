import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/common/extensions/widget_nested_common.dart';

/*
示例代码：
// widget 数组
List<Widget> widgets = [Text('a'), Icon(Icons.pets)];
// 嵌套一个 row
widgets.nestedRow();
// 嵌套一个 column
widgets.nestedColumn();
// 嵌套一个 stack
widgets.nestedStack();
// 嵌套一个 list
widgets.nestedListView();
// 嵌套一个 grid
widgets.nestedGridView();
// 嵌套一个 自定义scroll
widgets.nestedCustomScrollView();
*/

// 多个widget嵌套扩展
extension MultipleWidgetNestedExtension<T extends Widget> on List<T> {
  // 嵌套 Row
  Row nestedRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: this,
    );
  }

  // 嵌套 Column
  Column nestedColumn({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: this,
    );
  }

  // 嵌套stack
  Stack nestedStack({
    Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return Stack(
      key: key,
      alignment: alignment,
      textDirection: textDirection,
      fit: fit,
      clipBehavior: clipBehavior,
      children: this,
    );
  }

  // 嵌套 listView
  ListView nestedListView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    return ListView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemExtent: itemExtent,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      children: this,
    );
  }

  // 嵌套 gridView
  GridView nestedGridView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    required SliverGridDelegate gridDelegate,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? semanticChildCount,
  }) {
    return GridView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      gridDelegate: gridDelegate,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      children: this,
    );
  }

  // 嵌套自定义scrollerview
  CustomScrollView nestedCustomScrollView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    Key? center,
    double anchor = 0.0,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    return CustomScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      center: center,
      anchor: anchor,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      slivers: this,
    );
  }
}

// TextSpan 嵌套扩展
extension MultipleWidgetNestedTextSpan<T extends InlineSpan> on List<T> {
  // 嵌套一个 TextSpan
  TextSpan nestedTextSpan({
    String? text,
    TextStyle? style,
    GestureRecognizer? recognizer,
    String? semanticsLabel,
  }) {
    return TextSpan(
      text: text,
      style: style,
      recognizer: recognizer,
      semanticsLabel: semanticsLabel,
      children: this,
    );
  }
}

// 多个widget 添加widget 扩展
extension MultipleWidgetAddWidgetExtension<T extends Widget> on List<Widget> {
  // 添加一个 widget
  List<Widget> addWidget(Widget widget,
      {AddWidgetAsListType addType = AddWidgetAsListType.behind,}) {
    if (addType == AddWidgetAsListType.front) {
      return [widget] + this;
    }
    return this..add(widget);
  }

  // 添加 widget 数组 然后 返回一个list
  List<Widget> addWidgetList(List<Widget> widgets,
      {AddWidgetAsListType addType = AddWidgetAsListType.behind,}) {
    if (addType == AddWidgetAsListType.front) {
      return widgets + this;
    }
    return this + widgets;
  }
}

/// widget 嵌套 的list 扩展
extension WidgetNestedListExtension<T> on List<T> {
  // 将list转换为widget数组
  List<Widget> transformToWidgets(Widget Function(T) builder) {
    return map<Widget>((item) {
      return builder(item);
    }).toList();
  }
}
