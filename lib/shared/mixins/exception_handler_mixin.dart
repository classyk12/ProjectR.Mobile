import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:dio/dio.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, BaseResponse>> handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();

      if (res.statusCode == 200 || res.statusCode == 201) {
        return Right(
          BaseResponse(
              statusCode: res.statusCode ?? 200,
              message: res.statusMessage,
              data: res.data),
        );
      } else {
        ///return the raw error response and deserialize according to endpoint requirement. Because multiple base urls may be used and their error responses may not be uniform. This allows the specific endpoint to handle the error as they wish
        return Left(
          AppException(
              message: res.statusMessage ?? 'Request Failed, try again',
              error: res.data['message'] ?? res.data['error']),
        );
      }
    } catch (e) {
      String message = '';
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException _:
          e as SocketException;
          message = 'Unable to connect to the server.';
          break;

        case DioException _:
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';

          break;

        default:
          message = 'Unknown error occurred';
      }
      return Left(
        AppException(error: '', message: message),
      );
    }
  }
}
