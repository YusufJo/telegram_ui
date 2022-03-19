class ChatModel {
  const ChatModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.profileImage,
    required this.lastMessage,
    required this.dateSent,
    required this.timeSent,
    this.seen,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String? profileImage;
  final String lastMessage;
  final String dateSent;
  final String timeSent;
  final bool? seen;

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as String,
      firstName: map['first-name'] as String,
      lastName: map['last-name'] as String,
      profileImage: map['profile-image'] as String?,
      lastMessage: map['last-message'] as String,
      dateSent: map['date-sent'] as String,
      timeSent: map['time-sent'] as String,
      seen: map['seen'] as bool?,
    );
  }
}
