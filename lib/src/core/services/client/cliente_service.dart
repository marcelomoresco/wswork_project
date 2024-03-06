import 'package:wswork_project/src/core/services/client/models/ws_request.dart';
import 'package:wswork_project/src/core/services/client/models/ws_response.dart';

abstract interface class ClientService {
  Future<WsResponse> get(WsRequest wsRequest);
  Future<WsResponse> post(WsRequest wsRequest);
  Future<WsResponse> put(WsRequest wsRequest);
  Future<WsResponse> delete(WsRequest wsRequest);
}
