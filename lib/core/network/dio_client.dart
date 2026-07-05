import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_result.dart';

/// DioClient is a wrapper around Dio for API calls
/// It handles request/response interceptors and error handling
class DioClient {
  late Dio _dio;

  DioClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        responseType: ResponseType.json,
      ),
    );

    // Add interceptors
    _dio.interceptors.add(LoggingInterceptor());
  }

  /// GET request
  Future<ApiResult<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic json)? converter,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      final data = converter != null ? converter(response.data) : response.data;
      return ApiSuccess(data);
    } on DioException catch (e) {
      return ApiFailure.fromDioException(e);
    }
  }

  /// POST request
  Future<ApiResult<T>> post<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic json)? converter,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      final responseData =
          converter != null ? converter(response.data) : response.data;
      return ApiSuccess(responseData);
    } on DioException catch (e) {
      return ApiFailure.fromDioException(e);
    }
  }

  /// PUT request
  Future<ApiResult<T>> put<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic json)? converter,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      final responseData =
          converter != null ? converter(response.data) : response.data;
      return ApiSuccess(responseData);
    } on DioException catch (e) {
      return ApiFailure.fromDioException(e);
    }
  }

  /// DELETE request
  Future<ApiResult<T>> delete<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic json)? converter,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      final data = converter != null ? converter(response.data) : response.data;
      return ApiSuccess(data);
    } on DioException catch (e) {
      return ApiFailure.fromDioException(e);
    }
  }
}

/// Logging Interceptor for debugging API calls
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('REQUEST: ${options.method} ${options.path}');
      debugPrint('Headers: ${options.headers}');
      if (options.data != null) {
        debugPrint('Data: ${options.data}');
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('RESPONSE: ${response.statusCode} ${response.requestOptions.path}');
      debugPrint('Data: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('ERROR: ${err.message}');
      debugPrint('Status Code: ${err.response?.statusCode}');
    }
    super.onError(err, handler);
  }
}
