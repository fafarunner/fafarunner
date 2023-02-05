import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/extensions/widget_nested_common.dart';

// Commonly used 常用
// Uncommonly used 不常用

// 单个widget的扩展常用Widget
extension SingleWidgetNestedCommonlyUsedExtension on Widget {
  // 嵌套一个container
  Container nestedContainer({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Clip clipBehavior = Clip.none,
  }) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  // 嵌套一个center
  Center nestedCenter({
    Key? key,
    double? widthFactor,
    double? heightFactor,
  }) {
    return Center(
      key: key,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  // 嵌套一个padding
  Padding nestedPadding({
    Key? key,
    required EdgeInsetsGeometry padding,
  }) {
    return Padding(
      key: key,
      padding: padding,
      child: this,
    );
  }

  // 嵌套一个Expanded
  Expanded nestedExpanded({
    Key? key,
    int flex = 1,
  }) {
    return Expanded(
      key: key,
      flex: flex,
      child: this,
    );
  }

  // 嵌套一个TextButton
  TextButton nestedTextButton({
    Key? key,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    return TextButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      child: this,
    );
  }

  // 嵌套一个Align
  Align nestedAlign({
    Key? key,
    Alignment alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      key: key,
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  // 嵌套一个ClipRRect
  ClipRRect nestedClipRRect({
    Key? key,
    BorderRadius borderRadius = BorderRadius.zero,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipRRect(
      key: key,
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  // 嵌套一个ClipOval
  ClipOval nestedClipOval({
    Key? key,
    BorderRadius borderRadius = BorderRadius.zero,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  // 嵌套一个Offstage
  Offstage nestedOffstage({
    Key? key,
    bool offstage = true,
  }) {
    return Offstage(
      key: key,
      offstage: offstage,
      child: this,
    );
  }

  // 嵌套一个Positioned
  Positioned nestedPositioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
    );
  }

  // 嵌套一个SingleChildScrollView
  SingleChildScrollView nestedSingleChildScrollView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      child: this,
    );
  }

  // 嵌套一个Flexible
  Flexible nestedFlexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) {
    return Flexible(
      key: key,
      flex: flex,
      fit: fit,
      child: this,
    );
  }

  // 嵌套一个SizedBox
  SizedBox nestedSizedBox({
    Key? key,
    double? width,
    double? height,
  }) {
    return SizedBox(
      key: key,
      width: width,
      height: height,
      child: this,
    );
  }

  // 嵌套一个LimitedBox
  LimitedBox nestedLimitedBox({
    Key? key,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) {
    return LimitedBox(
      key: key,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: this,
    );
  }

  // 嵌套一个OverflowBox
  OverflowBox nestedOverflowBox({
    Key? key,
    Alignment alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return OverflowBox(
      key: key,
      alignment: alignment,
      minWidth: minWidth,
      minHeight: minHeight,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: this,
    );
  }

  // 嵌套一个SizedOverflowBox
  SizedOverflowBox nestedSizedOverflowBox({
    Key? key,
    required Size size,
    Alignment alignment = Alignment.center,
  }) {
    return SizedOverflowBox(
      key: key,
      size: size,
      alignment: alignment,
      child: this,
    );
  }

  // 嵌套一个FittedBox
  FittedBox nestedFittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return FittedBox(
      key: key,
      fit: fit,
      alignment: alignment,
      child: this,
    );
  }

  // 嵌套一个card
  Card nestedCard({
    Key? key,
    Color? color,
    Color? shadowColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
  }) {
    return Card(
      key: key,
      color: color,
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      child: this,
    );
  }

  // 嵌套一个 InkWell
  InkWell nestedInkWell({
    Key? key,
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureTapDownCallback? onTapDown,
    GestureTapCancelCallback? onTapCancel,
    ValueChanged<bool>? onHighlightChanged,
    ValueChanged<bool>? onHover,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    ValueChanged<bool>? onFocusChange,
    bool autofocus = false,
  }) {
    return InkWell(
      key: key,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      child: this,
    );
  }

  // 嵌套一个 SafeArea
  SafeArea nestedSafeArea({
    Key? key,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) {
    return SafeArea(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: this,
    );
  }
}

// 单个widget的扩展非常用Widget
extension SingleWidgetNestedUncommonlyUsedExtension on Widget {
  // 嵌套一个ConstrainedBox
  ConstrainedBox nestedConstrainedBox({
    Key? key,
    required BoxConstraints constraints,
  }) {
    return ConstrainedBox(
      key: key,
      constraints: constraints,
      child: this,
    );
  }

  // 嵌套一个ClipPath
  ClipPath nestedClipPath({
    Key? key,
    BorderRadius borderRadius = BorderRadius.zero,
    CustomClipper<Path>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipPath(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  // 嵌套一个DecoratedBox
  DecoratedBox nestedDecoratedBox({
    Key? key,
    required Decoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) {
    return DecoratedBox(
      key: key,
      decoration: decoration,
      position: position,
      child: this,
    );
  }

  // 嵌套一个RotatedBox
  RotatedBox nestedRotatedBox({
    Key? key,
    required int quarterTurns,
  }) {
    return RotatedBox(
      key: key,
      quarterTurns: quarterTurns,
      child: this,
    );
  }

  // 嵌套一个UnconstrainedBox
  UnconstrainedBox nestedUnconstrainedBox({
    Key? key,
    TextDirection? textDirection,
    Alignment alignment = Alignment.center,
    Axis? constrainedAxis,
  }) {
    return UnconstrainedBox(
      key: key,
      textDirection: textDirection,
      alignment: alignment,
      constrainedAxis: constrainedAxis,
      child: this,
    );
  }

  // 嵌套一个AnimatedAlign
  AnimatedAlign nestedAnimatedAlign({
    Key? key,
    Alignment alignment = Alignment.center,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) {
    return AnimatedAlign(
      key: key,
      alignment: alignment,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: this,
    );
  }

  // 嵌套一个Animatedpadding
  AnimatedPadding nestedAnimatedpadding({
    Key? key,
    required EdgeInsetsGeometry padding,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) {
    return AnimatedPadding(
      key: key,
      padding: padding,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: this,
    );
  }

  // 嵌套一个AnimatedContainer
  AnimatedContainer nestedAnimatedContainer({
    Key? key,
    Alignment? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) {
    return AnimatedContainer(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      child: this,
    );
  }
}

// 单个widget 手势 嵌套 扩展
extension WidgetGestureExtension on Widget {
  // 单击手势
  GestureDetector nestedTap(GestureTapCallback onTap, {Key? key}) {
    return _nestedGestureDetector(onTap: onTap, key: key);
  }

  // 双击手势
  GestureDetector nestedDoubleTap(GestureTapCallback onDoubleTap, {Key? key}) {
    return _nestedGestureDetector(onDoubleTap: onDoubleTap, key: key);
  }

  // 长按手势
  GestureDetector nestedLongPress(
    GestureLongPressCallback onLongPress, {
    Key? key,
  }) {
    return _nestedGestureDetector(onLongPress: onLongPress, key: key);
  }

  // 嵌套手势
  GestureDetector _nestedGestureDetector({
    Key? key,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    return GestureDetector(
      key: key,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onForcePressStart: onForcePressStart,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
      child: this,
    );
  }
}

// 单个widget 转 list 扩展
extension WidgetAsListExtension on Widget {
  // 将self转成list
  List<Widget> asList() {
    return [this];
  }

  // 添加一个 widget 然后 返回一个list
  List<Widget> addWidgetAsList(
    Widget widget, {
    AddWidgetAsListType nestedType = AddWidgetAsListType.behind,
  }) {
    if (nestedType == AddWidgetAsListType.front) {
      return [widget, this];
    }
    return [this, widget];
  }

  // 添加 widget 数组 然后 返回一个list
  List<Widget> addWidgetListAsList(
    List<Widget> widgets, {
    AddWidgetAsListType nestedType = AddWidgetAsListType.behind,
  }) {
    if (nestedType == AddWidgetAsListType.front) {
      return widgets..add(this);
    }
    return [this] + widgets;
  }
}
