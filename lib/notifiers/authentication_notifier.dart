// import 'package:projectr/app_states/global_states/global_app_state.dart';
// import 'package:projectr/services/repositories/local/login_user/login_user_repository.dart';
// import 'package:projectr/services/repositories/remote/authentication/auth_repository.dart';
// import 'package:projectr/shared/constants.dart';
// import 'package:projectr/shared/domain/models/authentication/login_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// ///This class holds the business logic for modules
// class AuthenticationNotifier extends StateNotifier<AppState> {
//   final AuthenticationRepository authRepository;
//   final LoginUserRepository loginUserRepository;

//   AuthenticationNotifier(
//       {required this.authRepository, required this.loginUserRepository})
//       : super(const AppState.initial());

//   Future<void> loginUser(
//       {required String userName,
//       required String password,
//       bool isSavePassword = false}) async {
//     state = const AppState.loading();
//     final response =
//         await authRepository.login(userName: userName, password: password);

//     state = await response.fold(
//       (failure) => AppState.failure(failure),
//       (data) async {
//         USER_DATA = data.user;
//         AUTH_TOKEN = data.token;
//         //  if (isSavePassword) {
//         var userData = UserData(
//             userName: data.user.username,
//             password: isSavePassword ? password : '',
//             firstName: data.user.firstName,
//             lastName: data.user.lastName);
//         await loginUserRepository.save(userData);
//         //  }

//         return const AppState.success();
//       },
//     );
//   }
// }
