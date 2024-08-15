import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

sucessNotification(title, context) {
  toastification.show(
    context: context,
    title: Text(title),
    icon: Icon(
      Icons.check,
      color: Colors.green,
    ),
    primaryColor: Colors.green,
    autoCloseDuration: const Duration(seconds: 2),
  );
}

errorNotification(title, context) {
  toastification.show(
    context: context,
    title: Text(title),
    icon: Icon(
      Icons.error,
      color: Colors.red,
    ),
    primaryColor: Colors.red,
    autoCloseDuration: const Duration(seconds: 2),
  );
}
