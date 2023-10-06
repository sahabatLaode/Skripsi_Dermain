import 'package:flutter/material.dart';

class CatatanController {
  final TextEditingController textEditingController = TextEditingController();

  void dispose() {
    textEditingController.dispose();
  }
}
