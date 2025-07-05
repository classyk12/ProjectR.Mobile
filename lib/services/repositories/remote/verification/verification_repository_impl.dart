import 'package:projectr/services/api_services/verification/verification_service.dart';
import 'package:projectr/services/repositories/remote/verification/verification_repository.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/domain/models/base_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/verification/bvn/verify_bvn_req_model.dart';
import 'package:projectr/shared/domain/models/verification/cac/verify_cac_req_model.dart';
import 'package:projectr/shared/domain/models/verification/id_document/verify_id_document.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class VerificationRepositoryImpl extends VerificationRepository {
  final IVerificationService dataSource;

  VerificationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, BaseModel>> verifyBvn(
      {required VerifyBvnRequestModel model}) {
    return dataSource.verifyBvn(model: model);
  }

  @override
  Future<Either<AppException, BaseModel>> verifyCac(
      {required VerifyCacRequestModel model}) {
    return dataSource.verifyCac(model: model);
  }

  @override
  Future<Either<AppException, bool>> verifyIdentityDocument(
      {required VerifyIdDocumentModel model}) async {
    if (MOCK_ID_VALIDATION_RESPONSE) {
      return const Right(true);
    }
    return dataSource.verifyIdentityDocument(model: model);
  }
}
