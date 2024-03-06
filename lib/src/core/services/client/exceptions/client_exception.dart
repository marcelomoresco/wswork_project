import 'package:wswork_project/src/core/exceptions/ws_exceptions.dart';

class ClientException extends WsException {
  final int statusCode;

  ClientException({
    required super.message,
    required this.statusCode,
  });
}
