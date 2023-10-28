class ChatRoomModal {
  String? chatroomid;
  Map<String, dynamic>? participants;
  String? lastMessage;
  DateTime? lastMessageOn;
  List<dynamic>? users;
  DateTime? createdon;
  bool isPrivate;

  ChatRoomModal({
    this.chatroomid,
    this.participants,
    this.lastMessage,
    this.lastMessageOn,
    this.users,
    this.createdon,
    required this.isPrivate,
  });

  factory ChatRoomModal.fromMap(map) {
    return ChatRoomModal(
      chatroomid: map['chatroomid'],
      participants: map['participants'],
      lastMessage: map['lastMessage'],
      lastMessageOn: map['lastMessageOn'].toDate(),
      users: map['users'],
      createdon: map['createdon'].toDate(),
      isPrivate: map['isPrivate'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatroomid': chatroomid,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageOn': lastMessageOn,
      'users': users,
      'createdon': createdon,
      'isPrivate': isPrivate,
    };
  }
}
