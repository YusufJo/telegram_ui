import 'package:flutter/material.dart';
import 'package:telegram_ui_joseph/assets.dart';
import 'package:telegram_ui_joseph/chat_model.dart';
import 'package:telegram_ui_joseph/chat_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatModel>>(
      future: ChatService.getLastChats(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 12, bottom: 24),
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ChatListTile(chatModel: snapshot.data![index]),
            ),
            separatorBuilder: (_, __) => const Padding(
              padding: EdgeInsets.only(
                left: 90,
              ),
              child: Divider(),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({Key? key, required ChatModel chatModel})
      : _chatModel = chatModel,
        super(key: key);

  final ChatModel _chatModel;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Avatar(
            networkImageUri: _chatModel.profileImage,
            fallback: _chatModel.firstName,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _chatModel.firstName + ' ' + _chatModel.lastName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (_chatModel.seen != null && _chatModel.seen == true)
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Image.asset(
                          AssetIcon.msgSeen,
                          color: Colors.green,
                        ),
                      ),
                    Text(
                      _chatModel.timeSent,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _chatModel.lastMessage,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: _chatModel.seen != null &&
                                    _chatModel.seen == false
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.grey),
                      ),
                    ),
                    if (_chatModel.seen != null && _chatModel.seen == false)
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required String? networkImageUri,
    required String fallback,
  })  : _networkImageUri = networkImageUri,
        _fallback = fallback,
        super(key: key);

  static final _backgroundColors = [...Colors.primaries];
  final String? _networkImageUri;
  final String _fallback;

  @override
  Widget build(BuildContext context) {
    if (_networkImageUri != null) {
      return CircleAvatar(
        radius: 35,
        backgroundColor: (_backgroundColors..shuffle())[0],
        foregroundImage: NetworkImage(_networkImageUri!),
      );
    } else {
      return CircleAvatar(
        radius: 35,
        backgroundColor: (_backgroundColors..shuffle())[0],
        child: Text(
          _fallback.substring(0, 2).toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      );
    }
  }
}
