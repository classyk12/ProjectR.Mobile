import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class NetworkService {
  // String? baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, BaseResponse>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, BaseResponse>> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, BaseResponse>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, BaseResponse>> postObject(
    String endpoint, {
    dynamic data,
  });

  Future<Either<AppException, BaseResponse>> put(
    String endpoint, {
    dynamic data,
  });
}
