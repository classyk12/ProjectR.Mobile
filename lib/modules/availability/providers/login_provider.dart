import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/providers/auth_provider.dart';
import 'package:projectr/shared/domain/models/authentication/auth_models.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

bool canListenToProvider = false;
String phoneNumber = '';
String phoneCode = '';

final authenticateWithPhoneNumber = FutureProvider.autoDispose<
    Either<AppException, PhoneNumberLoginResponseModel>>((ref) async {
  if (canListenToProvider == true) {
    final authProvider = ref.watch(authRepositoryProvider);
    var result = await authProvider.withPhoneNumber(
      phoneCode: phoneCode,
      phoneNumber: phoneNumber,
    );
    return result;
  }
  return Right(PhoneNumberLoginResponseModel());
});
