class MessageModal {
  String? messageId;
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;

  MessageModal(
      {this.messageId, this.sender, this.text, this.seen, this.createdon});

  factory MessageModal.fromMap(map) {
    return MessageModal(
      messageId: map['messageId'],
      sender: map['sender'],
      text: map['text'],
      seen: map['seen'],
      createdon: map['createdon'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'sender': sender,
      'text': text,
      'seen': seen,
      'createdon': createdon,
    };
  }
}
