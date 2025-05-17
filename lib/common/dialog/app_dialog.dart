import 'package:flutter/material.dart';

class AppDialog {
 static Future<void> onLoading({
    required BuildContext context,
  }) async {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (c) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
