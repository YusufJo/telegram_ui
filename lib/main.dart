import 'package:flutter/material.dart';

void main() => runApp(const TelegramApp());

class TelegramApp extends StatelessWidget {
  const TelegramApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
