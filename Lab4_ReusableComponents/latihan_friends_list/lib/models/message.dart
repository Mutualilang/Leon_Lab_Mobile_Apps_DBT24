class Message {
  final int id;
  final String text;
  final bool sent;
  final DateTime? timestamp;

  Message({
    required this.id,
    required this.text,
    required this.sent,
    this.timestamp,
  });
}