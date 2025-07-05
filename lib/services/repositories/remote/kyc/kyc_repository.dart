import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/kyc/kyc_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class KycRepository {
  ///get user kyc status
  Future<Either<AppException, KycStatusModel>> getStatus();

  Future<Either<AppException, String>> upgradeToTierTwo(
      {required TierTwoUpdateModel model});

  Future<Either<AppException, String>> updateToTierOne();
}
