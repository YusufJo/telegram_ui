import 'package:flutter/material.dart';
import 'assets.dart';
import 'home_view.dart';
import 'menu_drawer.dart';
import 'theme.dart';

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
