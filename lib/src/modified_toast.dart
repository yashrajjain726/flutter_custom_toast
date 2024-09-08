import 'package:flutter/material.dart';

import 'modified_toast_animation.dart';
import 'modified_toast_position.dart';
import 'modified_toast_type.dart';
import 'utils.dart';

class ModifiedToast {
  final BuildContext context;
  final String message; // Required message
  final ModifiedToastType type;
  final ModifiedToastPosition position;
  final int duration; // Duration in seconds
  final Icon? icon;
  final String? actionLabel;
  final VoidCallback? actionCallback;
  final TextStyle? textStyle;
  final bool dismissOnTap;
  final bool persistent;
  final ModifiedToastAnimation animation;
  final double animationDuration;
  final double elevation;
  final Color? shadowColor;
  final double margin;
  final double padding;
  final BorderRadius? borderRadius;
  final String? backgroundImage;
  final bool dismissOnSwipe;
  final double? width;
  final double? height;
  final Curve entranceCurve;
  final Curve exitCurve;
  final double iconSize;
  final Color? backgroundColor;
  final TextAlign textAlign;
  final Color? borderColor;
  final double borderWidth;
  final Offset shadowOffset;
  final double dismissDuration;
  final TextStyle? actionButtonStyle;
  final double iconPadding;
  final String? toastId;
  final Function? onShow;
  final Function? onDismiss;
  final bool accessibilityAnnouncement;
  final double opacity;
  final double fadeDuration;
  final double slideDistance;
  final double scaleFactor;
  final double textPadding;
  final double actionPadding;
  final Color? iconColor;
  final Color? actionButtonColor;
  final double actionButtonElevation;
  final double actionButtonBorderRadius;
  final double actionButtonIconSize;
  final double actionButtonIconPadding;
  final String? accessibilityLabel;
  final String? accessibilityHint;
  final String? accessibilityRole;
  final String? accessibilityValue;
  final Function? onClick;
  final Function? onLongPress;
  final Function? onDoubleTap;
  final Function? onSwipe;
  final bool showIcon;
  final bool showActionButton;

  // Constructor
  ModifiedToast({
    required this.context,
    required this.message,
    this.type = ModifiedToastType.info,
    this.position = ModifiedToastPosition.bottom,
    this.duration = 3,
    this.icon,
    this.actionLabel,
    this.actionCallback,
    this.textStyle,
    this.dismissOnTap = false,
    this.persistent = false,
    this.animation = ModifiedToastAnimation.fade,
    this.animationDuration = 300.0,
    this.elevation = 4.0,
    this.shadowColor,
    this.margin = 10.0,
    this.padding = 12.0,
    this.borderRadius,
    this.backgroundImage,
    this.dismissOnSwipe = false,
    this.width,
    this.height,
    this.entranceCurve = Curves.easeIn,
    this.exitCurve = Curves.easeOut,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.textAlign = TextAlign.center,
    this.borderColor,
    this.borderWidth = 0.0,
    this.shadowOffset = const Offset(0, 2),
    this.dismissDuration = 0.5,
    this.actionButtonStyle,
    this.iconPadding = 8.0,
    this.toastId,
    this.onShow,
    this.onDismiss,
    this.accessibilityAnnouncement = false,
    this.opacity = 1.0,
    this.fadeDuration = 0.5,
    this.slideDistance = 50.0,
    this.scaleFactor = 1.0,
    this.textPadding = 0.0,
    this.actionPadding = 0.0,
    this.iconColor,
    this.actionButtonColor,
    this.actionButtonElevation = 0.0,
    this.actionButtonBorderRadius = 0.0,
    this.actionButtonIconSize = 16.0,
    this.actionButtonIconPadding = 0.0,
    this.accessibilityLabel,
    this.accessibilityHint,
    this.accessibilityRole,
    this.accessibilityValue,
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.onSwipe,
    this.showIcon = true,
    this.showActionButton = true,
  });

  void show() {
    final overlay = Overlay.of(context);
    late final OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        if (accessibilityAnnouncement) {
          // Announce the toast message for accessibility
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Use a screen reader announcement here if necessary
          });
        }

        return Positioned(
          top: position == ModifiedToastPosition.top ? 50.0 : null,
          bottom: position == ModifiedToastPosition.bottom ? 50.0 : null,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: dismissOnTap ? () => overlayEntry.remove() : null,
              onHorizontalDragEnd: dismissOnSwipe
                  ? (details) {
                      if (details.velocity.pixelsPerSecond.dx > 0) {
                        overlayEntry.remove();
                        onDismiss?.call();
                      }
                    }
                  : null,
              onLongPress: onLongPress != null ? () => onLongPress!() : null,
              onDoubleTap: onDoubleTap != null ? () => onDoubleTap!() : null,
              child: Container(
                width: width,
                height: height,
                margin: EdgeInsets.all(margin),
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: padding,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor ??
                      getDefaultBackgroundColor(type).withOpacity(opacity),
                  borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                  border: borderColor != null
                      ? Border.all(color: borderColor!, width: borderWidth)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor ?? Colors.black.withOpacity(0.5),
                      blurRadius: elevation,
                      offset: shadowOffset,
                    ),
                  ],
                  image: backgroundImage != null
                      ? DecorationImage(
                          image: NetworkImage(backgroundImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (showIcon && icon != null)
                      Padding(
                        padding: EdgeInsets.all(iconPadding),
                        child: Icon(
                          icon?.icon,
                          size: iconSize,
                          color: iconColor ?? icon?.color,
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(textPadding),
                        child: Text(
                          message,
                          style:
                              textStyle ?? TextStyle(color: getTextColor(type)),
                          textAlign: textAlign,
                        ),
                      ),
                    ),
                    if (showActionButton &&
                        actionLabel != null &&
                        actionCallback != null)
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: actionButtonColor,
                          padding: EdgeInsets.all(actionPadding),
                          elevation: actionButtonElevation,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(actionButtonBorderRadius),
                          ),
                        ),
                        onPressed: () {
                          actionCallback!();
                          overlayEntry.remove();
                          onDismiss?.call();
                        },
                        child: Row(
                          children: [
                            if (actionButtonIconSize > 0)
                              Padding(
                                padding:
                                    EdgeInsets.all(actionButtonIconPadding),
                                child: Icon(
                                  Icons
                                      .check, // Placeholder for action button icon
                                  size: actionButtonIconSize,
                                  color: getTextColor(type),
                                ),
                              ),
                            Text(
                              actionLabel!,
                              style: actionButtonStyle ??
                                  TextStyle(color: getTextColor(type)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
    onShow?.call();

    if (!persistent) {
      Future.delayed(Duration(seconds: duration), () {
        overlayEntry.remove();
        onDismiss?.call();
      });
    }
  }
}
