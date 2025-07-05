import 'package:projectr/shared/configs/app_configs.dart';
import 'package:projectr/shared/data/remote/dio_network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider =
    Provider.family<DioNetworkService, String?>((ref, baseUrl) {
  final Dio dio = Dio();
  return DioNetworkService(dio, ref, baseUrl: baseUrl ?? AppConfigs.baseUrl);
});
