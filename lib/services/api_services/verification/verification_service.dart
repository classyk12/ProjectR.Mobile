import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/base_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/domain/models/verification/bvn/verify_bvn_req_model.dart';
import 'package:projectr/shared/domain/models/verification/bvn/verify_bvn_res_model.dart';
import 'package:projectr/shared/domain/models/verification/cac/verify_cac_req_model.dart';
import 'package:projectr/shared/domain/models/verification/id_document/verify_id_document.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class IVerificationService {
  Future<Either<AppException, BaseModel>> verifyBvn(
      {required VerifyBvnRequestModel model});

  Future<Either<AppException, BaseModel>> verifyCac(
      {required VerifyCacRequestModel model});

  Future<Either<AppException, bool>> verifyIdentityDocument(
      {required VerifyIdDocumentModel model});
}

class VerificationService implements IVerificationService {
  final NetworkService networkService;

  VerificationService(this.networkService);

  @override
  Future<Either<AppException, BaseModel>> verifyBvn(
      {required VerifyBvnRequestModel model}) async {
    try {
      final eitherType = await networkService.post(
        'verifications/verify-bvn',
        data: model.toMap(),
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while verifying bvn.',
            ),
          );
        },
        (response) {
          final bvnData = BvnData.fromJson(response.data['data']);
          return Right(
              BaseModel(status: bvnData.isBvnVerified ?? false, message: ''));
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while verifying bvn.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, BaseModel>> verifyCac(
      {required VerifyCacRequestModel model}) async {
    try {
      final eitherType = await networkService.post(
        'verifications/verify-cac',
        data: model.toMap(),
      );
      return eitherType.fold(
        (exception) {
          return Left(
            AppException(
              error: exception.message,
              message: exception.message ??
                  'Unknown error occurred while verifying cac.',
            ),
          );
        },
        (response) {
          final data = response.data['data'];
          return Right(
              BaseModel(status: data['isCACVerified'] ?? false, message: ''));
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while verifying cac.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> verifyIdentityDocument(
      {required VerifyIdDocumentModel model}) async {
    try {
      var json = model.toMap();
      final eitherType = await networkService.post(
        'verifications/verify-identity-document',
        data: json,
      );
      return eitherType.fold(
        (exception) {
          return Left(
            AppException(
              error: exception.message,
              message: exception.message ??
                  'Unknown error occurred while verifying Id Number.',
            ),
          );
        },
        (response) {
          // final user = BaseResponse.fromJson(response.data['data']);
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while verifying Id Number.',
          error: 'Error!',
        ),
      );
    }
  }
}
