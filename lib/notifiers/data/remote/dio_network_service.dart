import 'package:projectr/shared/configs/app_configs.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/util.dart';
import 'package:projectr/shared/mixins/exception_handler_mixin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  final Ref _ref;
  String? baseUrl;
  final List<Function()> _failedAPIRequests = [];

  DioNetworkService(this.dio, this._ref, {this.baseUrl}) {
    // this throws error while running test
    //if (!kDebugMode) {
    dio.options = dioBaseOptions;
    dio.interceptors.add(TokenInterceptors(dio));
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    // _monitorConnectivity();
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl ?? AppConfigs.baseUrl,
        headers: headers,
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        validateStatus: (status) => status! < 500,
      );

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    //  if (!kDebugMode) {
    dio.options.headers = header;
    //}
    return header;
  }

  @override
  Future<Either<AppException, BaseResponse>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    customDebugPrint(message: 'URL: $endpoint - ${data.toString()}');

    // final connectivity = await Connectivity().checkConnectivity();

    // if (connectivity.contains(ConnectivityResult.none)) {
    //   _failedAPIRequests.add(() => post(endpoint, data: data));
    //   return Left(AppException(
    //       message: 'No Internet Connection', error: 'No Internet Connection'));
    // }

    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, BaseResponse>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    // final connectivity = await Connectivity().checkConnectivity();
    // if (connectivity.contains(ConnectivityResult.none)) {
    //   _failedAPIRequests
    //       .add(() => get(endpoint, queryParameters: queryParameters));
    //   return Left(AppException(
    //       message: 'No Internet Connection', error: 'No Internet Connection'));
    // }

    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, BaseResponse>> delete(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    // final connectivity = await Connectivity().checkConnectivity();
    // if (connectivity.contains(ConnectivityResult.none)) {
    //   _failedAPIRequests
    //       .add(() => delete(endpoint, queryParameters: queryParameters));
    //   return Left(AppException(
    //       message: 'No Internet Connection', error: 'No Internet Connection'));
    // }
    final res = handleException(
      () => dio.delete(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, BaseResponse>> postObject(String endpoint,
      {data}) async {
    // final connectivity = await Connectivity().checkConnectivity();
    // if (connectivity.contains(ConnectivityResult.none)) {
    //   _failedAPIRequests.add(() => post(endpoint, data: data));
    //   return Left(AppException(
    //       message: 'No Internet Connection', error: 'No Internet Connection'));
    // }
    final res = handleException(
      () => dio.post(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, BaseResponse>> put(String endpoint, {data}) {
    final res = handleException(
      () => dio.put(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  // void _monitorConnectivity() {
  //   Connectivity().onConnectivityChanged.listen((result) {
  //     final isConnected = !result.contains(ConnectivityResult.none);
  //     _ref.read(internetConnectivityProvider.notifier).state = isConnected;
  //     if (!result.contains(ConnectivityResult.none)) {
  //       _retryFailedRequests();
  //     }
  //   });
  // }

  void _retryFailedRequests() {
    for (var request in _failedAPIRequests) {
      request(); // Retry each request
    }
    _failedAPIRequests.clear();
  }
}

class TokenInterceptors extends Interceptor {
  final Dio dio;

  TokenInterceptors(this.dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    //log user out when status code is 401
    // if (response.statusCode == 401) {}

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    customDebugPrint(message: err, key: 'Error on Resource File');
    return super.onError(err, handler);
  }
}
