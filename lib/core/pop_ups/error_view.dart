import 'package:flutter/material.dart';

showError(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.red[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(msg),
        ),
      );
    },
  );
}
