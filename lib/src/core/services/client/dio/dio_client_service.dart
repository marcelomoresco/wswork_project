import 'package:dio/dio.dart';
import 'package:wswork_project/src/core/services/client/cliente_service.dart';
import 'package:wswork_project/src/core/services/client/dio/custom_dio.dart';
import 'package:wswork_project/src/core/services/client/exceptions/client_exception.dart';
import 'package:wswork_project/src/core/services/client/models/ws_request.dart';
import 'package:wswork_project/src/core/services/client/models/ws_response.dart';

class DioClientService implements ClientService {
  final CustomDio dio;

  const DioClientService({
    required this.dio,
  });

  @override
  Future<WsResponse> delete(WsRequest wsRequest) async {
    try {
      final response = await dio.delete(
        wsRequest.path,
        data: wsRequest.data,
        queryParameters: wsRequest.headers,
        options: Options(
          headers: wsRequest.headers,
          contentType: wsRequest.contentType,
        ),
      );

      return WsResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<WsResponse> get(WsRequest wsRequest) async {
    try {
      final response = await dio.get(
        wsRequest.path,
        data: wsRequest.data,
        queryParameters: wsRequest.headers,
        options: Options(
            headers: wsRequest.headers, contentType: wsRequest.contentType),
      );

      return WsResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<WsResponse> post(WsRequest wsRequest) async {
    try {
      final response = await dio.post(
        wsRequest.path,
        data: wsRequest.data,
        queryParameters: wsRequest.headers,
        options: Options(
          headers: wsRequest.headers,
          contentType: wsRequest.contentType,
        ),
      );

      return WsResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<WsResponse> put(WsRequest wsRequest) async {
    try {
      final response = await dio.put(
        wsRequest.path,
        data: wsRequest.data,
        queryParameters: wsRequest.headers,
        options: Options(
          headers: wsRequest.headers,
          contentType: wsRequest.contentType,
        ),
      );

      return WsResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.message ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }
}
