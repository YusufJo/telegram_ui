import 'dart:convert';

import 'package:flutter/services.dart';

import 'chat_model.dart';

abstract class ChatService {
  static Future<List<ChatModel>> getLastChats() async {
    final rawChatsString = await rootBundle.loadString('assets/chats.json');
    final chatsList = jsonDecode(rawChatsString) as List;
    return chatsList.map((entity) => ChatModel.fromMap(entity)).toList();
  }
}
