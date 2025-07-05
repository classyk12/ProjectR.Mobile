import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/kyc/kyc_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/extension.dart';
import 'package:projectr/shared/helpers/util.dart';
import 'package:dio/dio.dart';

abstract class IKycService {
  Future<Either<AppException, KycStatusModel>> getStatus();

  Future<Either<AppException, String>> upgradeToTierTwo(
      {required TierTwoUpdateModel model});

  Future<Either<AppException, String>> updateToTierOne();
}

class KycService implements IKycService {
  final NetworkService networkService;

  KycService(this.networkService);

  @override
  Future<Either<AppException, KycStatusModel>> getStatus() async {
    try {
      final eitherType = await networkService.get(
        'kyc/status',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting kyc status.',
            ),
          );
        },
        (response) {
          final data = KycStatusModel.fromJson(response.data);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting kyc status.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, String>> upgradeToTierTwo(
      {required TierTwoUpdateModel model}) async {
    try {
      FormData formData = FormData.fromMap({
        "address": model.address!.path.isNotEmpty
            ? await MultipartFile.fromFile(
                model.address?.path ?? '',
                contentType: model.address?.path.getMediaType(),
                filename: model.addressFileName,
              )
            : null,
        "signature": model.signature!.path.isNotEmpty
            ? await MultipartFile.fromFile(
                model.signature?.path ?? '',
                contentType: model.signature?.path.getMediaType(),
                filename: model.signatureFileName,
              )
            : null,
        "passportPhotograph": model.passportPhotograph!.path.isNotEmpty
            ? await MultipartFile.fromFile(
                model.passportPhotograph?.path ?? '',
                contentType: model.passportPhotograph?.path.getMediaType(),
                filename: model.passportPhotographFileName,
              )
            : null
      });
      final eitherType =
          await networkService.postObject('kyc/tier-two', data: formData);
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while upgrading to tier two.',
            ),
          );
        },
        (response) {
          final data = response.data;
          customDebugPrint(message: data);
          return Right(data['message']);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while upgrading to tier two.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, String>> updateToTierOne() async {
    try {
      final eitherType = await networkService.post(
        'kyc/tier-one/update',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while updating to tier one.',
            ),
          );
        },
        (response) {
          final data = response.data;
          return Right(data['message']);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while updating to tier one.',
          error: 'Error!',
        ),
      );
    }
  }
}
