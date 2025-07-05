import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/kyc_be/embassy_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class IKycBeService {
  Future<Either<AppException, List<EmbassyModel>>> getEmbassies();
}
