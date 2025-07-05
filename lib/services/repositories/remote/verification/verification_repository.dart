import 'package:projectr/shared/domain/models/base_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/verification/bvn/verify_bvn_req_model.dart';
import 'package:projectr/shared/domain/models/verification/cac/verify_cac_req_model.dart';
import 'package:projectr/shared/domain/models/verification/id_document/verify_id_document.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class VerificationRepository {
  ///verify user bvn with this method
  Future<Either<AppException, BaseModel>> verifyBvn(
      {required VerifyBvnRequestModel model});

  ///verify company CAC with this method
  Future<Either<AppException, BaseModel>> verifyCac(
      {required VerifyCacRequestModel model});

  ///verify identity document with this method
  Future<Either<AppException, bool>> verifyIdentityDocument(
      {required VerifyIdDocumentModel model});
}
