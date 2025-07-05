import 'package:projectr/services/api_services/customer/icustomerService.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class CustomerService implements ICustomerService {
  final NetworkService networkService;

  CustomerService(this.networkService);

  @override
  Future<Either<AppException, bool>> requestOTP() async {
    try {
      final eitherType =
          await networkService.post('customer/request-otp', data: null);
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while requesting OTP.',
            ),
          );
        },
        (response) {
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while requesting OTP',
          error: 'Error!',
        ),
      );
    }
  }
}
