import 'package:flutter/material.dart';

class SnackBarService {
  static void showSuccess(BuildContext context, String message) {
    _show(context, message, backgroundColor: Colors.green);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message, backgroundColor: Colors.red);
  }

  static void _show(
    BuildContext context,
    String message, {
    required Color backgroundColor,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
