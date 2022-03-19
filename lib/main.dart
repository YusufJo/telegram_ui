import 'package:flutter/material.dart';
import 'package:telegram_ui_joseph/assets.dart';
import 'package:telegram_ui_joseph/home_view.dart';
import 'package:telegram_ui_joseph/theme.dart';

import 'menu_drawer.dart';

Future<void> main() async {
  runApp(const TelegramApp());
}

class TelegramApp extends StatelessWidget {
  const TelegramApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Telegram"),
        actions: [
          Image.asset(AssetIcon.icABSearch),
        ],
      ),
      drawer: const MenuDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(AssetIcon.floatingPencil),
      ),
      body: const HomeView(),
    );
  }
}
