import 'package:dio/dio.dart';

/// ApiResult is a wrapper class for API responses
/// It follows the Either pattern for success/failure handling
sealed class ApiResult<T> {
  const ApiResult();

  /// Maps the result to another type
  R when<R>({
    required R Function(T data) success,
    required R Function(String message, int? statusCode) failure,
  }) {
    if (this is ApiSuccess<T>) {
      return success((this as ApiSuccess<T>).data);
    } else if (this is ApiFailure<T>) {
      final failureResult = this as ApiFailure<T>;
      return failure(failureResult.message, failureResult.statusCode);
    }
    throw UnimplementedError();
  }

  /// Get data or null
  T? getOrNull() {
    if (this is ApiSuccess<T>) {
      return (this as ApiSuccess<T>).data;
    }
    return null;
  }

  /// Check if result is success
  bool get isSuccess => this is ApiSuccess<T>;

  /// Check if result is failure
  bool get isFailure => this is ApiFailure<T>;
}

/// Success result wrapper
class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  const ApiSuccess(this.data);
}

/// Failure result wrapper
class ApiFailure<T> extends ApiResult<T> {
  final String message;
  final int? statusCode;
  final DioException? exception;

  const ApiFailure({required this.message, this.statusCode, this.exception});

  /// Factory to create failure from DioException
  factory ApiFailure.fromDioException(DioException e) {
    String message;
    int? statusCode = e.response?.statusCode;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        message = 'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.badResponse:
        message =
            e.response?.data['message'] ??
            'An error occurred: ${e.response?.statusCode}';
        statusCode = e.response?.statusCode;
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled.';
        break;
      case DioExceptionType.unknown:
        message = 'An unknown error occurred.';
        break;
      case DioExceptionType.badCertificate:
        message = 'Certificate error occurred.';
        break;
      case DioExceptionType.connectionError:
        message = 'Connection error. Please check your internet connection.';
        break;
    }

    return ApiFailure(message: message, statusCode: statusCode, exception: e);
  }
}
