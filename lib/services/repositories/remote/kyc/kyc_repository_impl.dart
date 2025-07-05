import 'package:projectr/services/api_services/kyc/kyc_service.dart';
import 'package:projectr/services/repositories/remote/kyc/kyc_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/kyc/kyc_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class KycRepositoryImpl extends KycRepository {
  final IKycService service;

  KycRepositoryImpl(this.service);

  @override
  Future<Either<AppException, KycStatusModel>> getStatus() async {
    return await service.getStatus();
  }

  @override
  Future<Either<AppException, String>> upgradeToTierTwo(
      {required TierTwoUpdateModel model}) async {
    return await service.upgradeToTierTwo(model: model);
  }

  @override
  Future<Either<AppException, String>> updateToTierOne() async {
    return await service.updateToTierOne();
  }
}
