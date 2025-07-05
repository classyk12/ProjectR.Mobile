//define data source
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/services/api_services/authentication/authentication_service.dart';
import 'package:projectr/services/repositories/remote/authentication/authentication_repository_impl.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/providers/dio_network_service_provider.dart';

//provide repository
//have a provider that reads from the repository provider to feed data to the presentation layer
final authServiceProvider = Provider.family<IAuthService, NetworkService>(
  (_, networkService) => AuthService(networkService),
);

//define providers
final authRepositoryProvider = Provider<AuthenticationRepositoryImpl>(
  (ref) {
    final NetworkService networkService =
        ref.watch(networkServiceProvider(null));
    final IAuthService dataSource =
        ref.watch(authServiceProvider(networkService));
    return AuthenticationRepositoryImpl(dataSource);
  },
);
