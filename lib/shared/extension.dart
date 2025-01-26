import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

extension WidgetExtension on Widget {
  /// Add ripple and also on tap
  Widget rippleOnTap({
    required VoidCallback? onTap,
    HitTestBehavior? behavior,
    bool enable = true,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    double borderRadius = 0,
    bool canRequestFocus = true,
    bool autoFocus = false,
    Color? hoverColor,
    Color? focusColor,
    Color? splashColor,
    Color? highlightColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    ShapeBorder? customBorder,
  }) {
    if (!enable || onTap == null) return this;

    final customBorder = borderRadius == 0
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        splashFactory: splashFactory,
        radius: radius,
        customBorder: customBorder,
        enableFeedback: enableFeedback,
        excludeFromSemantics: excludeFromSemantics,
        focusNode: focusNode,
        canRequestFocus: canRequestFocus,
        autofocus: autoFocus,
        onTap: onTap,
        child: this,
      ),
    );

    // old behaviour that use 2 widget
    // return ripple(
    //   enable: onTap != null && isEnabled,
    //   hoverColor: hoverColor,
    //   focusColor: focusColor,
    //   splashColor: splashColor,
    //   highlightColor: highlightColor,
    //   customBorder: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(borderRadius),
    //   ),
    // ).gestures(
    //   onTap: isEnabled ? onTap : null,
    //   behavior: behavior,
    // );
  }

  /// `padding` usually a public properties on flutter. This is just another
  /// alias for it.
  Widget setPadding({
    Key? key,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
    bool animate = false,
  }) {
    return padding(
      key: key,
      all: all,
      horizontal: horizontal,
      vertical: vertical,
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      animate: animate,
    );
  }
}
