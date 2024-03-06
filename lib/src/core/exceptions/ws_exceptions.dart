class WsException implements Exception {
  final String message;

  const WsException({
    required this.message,
  });
}
