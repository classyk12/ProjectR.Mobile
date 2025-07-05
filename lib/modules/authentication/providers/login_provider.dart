// import 'package:projectr/app_states/global_states/global_app_state.dart';
// import 'package:projectr/notifiers/authentication_notifier.dart';
// import 'package:projectr/providers/auth_provider.dart';
// import 'package:projectr/providers/local_data_source_providers/login_user_data_source_provider.dart';
// import 'package:projectr/services/repositories/local/login_user/login_user_repository.dart';
// import 'package:projectr/services/repositories/remote/authentication/auth_repository.dart';
// import 'package:projectr/shared/domain/models/authentication/login_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final isPasswordProvider = StateProvider<bool>((ref) => true);

// final authStateNotifierProvider =
//     StateNotifierProvider<AuthenticationNotifier, AppState>(
//   (ref) {
//     final AuthenticationRepository authenticationRepository =
//         ref.watch(authRepositoryProvider);
//     final LoginUserRepository loginUserRepository =
//         ref.watch(loginUserRepositoryProvider);
//     return AuthenticationNotifier(
//       authRepository: authenticationRepository,
//       loginUserRepository: loginUserRepository,
//     );
//   },
// );

// final loginUserProvider = FutureProvider<UserData?>((ref) async {
//   var loginRepo = ref.watch(loginUserRepositoryProvider);
//   return await loginRepo.get();
// });
