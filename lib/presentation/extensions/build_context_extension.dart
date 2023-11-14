import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void showSnacBar(String message) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
}
