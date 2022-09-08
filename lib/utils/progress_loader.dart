import 'package:flutter/material.dart';
import 'package:progress_loader_overlay/progress_loader_overlay.dart';

class PLoader {
  PLoader._();

  static Future<void> show(BuildContext context) async {
    if (!ProgressLoader().isLoading) {
      await ProgressLoader().show(context);
    }
  }

  static Future<void> dismiss() async {
    if (ProgressLoader().isLoading) {
      await ProgressLoader().dismiss();
    }
  }
}
