class WsResponse {
  final int statusCode;
  final dynamic body;

  const WsResponse({
    required this.statusCode,
    required this.body,
  });
}
