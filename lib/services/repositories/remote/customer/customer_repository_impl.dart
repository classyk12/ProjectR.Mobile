import 'package:projectr/services/api_services/customer/icustomerService.dart';
import 'package:projectr/services/repositories/remote/customer/customer_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class CustomerRepositoryImpl extends ICustomerRepository {
  final ICustomerService service;

  CustomerRepositoryImpl(this.service);

  @override
  Future<Either<AppException, bool>> requestOTP() async {
    return await service.requestOTP();
  }
}
