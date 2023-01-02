class MessageResponseWs {
  final String message;

  MessageResponseWs({
    required this.message,
  });

  factory MessageResponseWs.fromJson(Map<String, dynamic> json) {
    return MessageResponseWs(
      message: json["message"] as String,
    );
  }
}
