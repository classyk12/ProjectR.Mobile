import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class ICustomerRepository {
  ///request OTP
  Future<Either<AppException, bool>> requestOTP();
}
