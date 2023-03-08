import 'package:flutter/material.dart';

import '../constants/globals.dart';

void handleError(e) {
  if (e != null) {
    debugPrint('e: $e');
    final SnackBar snackBar = SnackBar(content: Text(e.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
