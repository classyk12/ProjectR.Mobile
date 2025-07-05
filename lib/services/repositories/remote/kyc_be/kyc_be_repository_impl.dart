import 'package:projectr/services/api_services/kyc_be/iKycBeService.dart';
import 'package:projectr/services/repositories/remote/kyc_be/kyc_be_repository.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/kyc_be/embassy_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class KycBeRepositoryImpl extends KycBeRepository {
  final IKycBeService service;

  KycBeRepositoryImpl(this.service);

  @override
  Future<Either<AppException, List<EmbassyModel>>> getEmbassies() async {
    if (EMBASSIES_LIST.isNotEmpty) {
      return Right(EMBASSIES_LIST);
    }
    return await service.getEmbassies();
  }
}
