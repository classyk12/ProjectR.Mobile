// import 'package:csalpha_2/services/repositories/local/login_user/local_user_repository_data_source.dart';
// import 'package:csalpha_2/services/repositories/local/login_user/login_user_repository.dart';
// import 'package:csalpha_2/services/repositories/local/login_user/login_user_respository_impl.dart';
// import 'package:csalpha_2/shared/data/local/storage_service.dart';
// import 'package:csalpha_2/shared/domain/providers/shared_preference_service_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// ///This provider exposes the login user data source class
// final loginUserServiceProvider =
//     Provider.family<LoginUserDataSource, StorageService>(
//   (ref, storageService) => LoginUserDataSourceImpl(storageService),
// );

// //This provider exposes the login user repository class
// final loginUserRepositoryProvider = Provider<LoginUserRepository>((ref) {
//   final storageService = ref.watch(storageServiceProvider);
//   final datasource = ref.watch(loginUserServiceProvider(storageService));
//   final repository = LoginUserRepositoryImpl(datasource);
//   return repository;
// });
