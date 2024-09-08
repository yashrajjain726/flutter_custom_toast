import 'package:flutter/material.dart';
import 'package:flutter_modified_toast/src/modified_toast_type.dart';

// Utility function to get default background color based on toast type
Color getDefaultBackgroundColor(ModifiedToastType type) {
  switch (type) {
    case ModifiedToastType.success:
      return Colors.green;
    case ModifiedToastType.error:
      return Colors.red;
    case ModifiedToastType.warning:
      return Colors.orange;
    case ModifiedToastType.info:
    default:
      return Colors.blue;
  }
}

// Utility function to get text color based on toast type
Color getTextColor(ModifiedToastType type) {
  return Colors.white;
}
