class WsRequest {
  final String path;
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, String>? headers;
  final String? contentType;

  const WsRequest({
    required this.path,
    this.data,
    this.queryParameters,
    this.headers,
    this.contentType,
  });
}
