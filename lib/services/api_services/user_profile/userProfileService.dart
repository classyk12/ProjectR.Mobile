import 'package:projectr/services/api_services/user_profile/iuserProfileService.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/domain/models/user_profile/user_profile_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/extension.dart';
import 'package:dio/dio.dart';

class UserProfileService implements IUserProfileService {
  final NetworkService networkService;

  UserProfileService(this.networkService);

  @override
  Future<Either<AppException, UserProfileModel>> getUserProfile() async {
    try {
      final eitherType = await networkService.get(
        'users/profile',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting user profile.',
            ),
          );
        },
        (response) {
          var data = UserProfileModel.fromMap(response.data);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting user profile.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> updateUserProfile(
      {required UpdateUserProfileModel model}) async {
    try {
      FormData formData = FormData.fromMap({
        "username": model.username,
        "otherName": model.otherName,
        "maritalStatus": model.maritalStatus,
        "gender": model.gender,
        "profilePicture": model.profilePicture!.path.isNotEmpty
            ? await MultipartFile.fromFile(
                model.profilePicture?.path ?? '',
                contentType: model.profilePicture?.path.getMediaType(),
                filename: model.fileName,
              )
            : null
      });

      final eitherType =
          await networkService.put('users/profile', data: formData);
      return eitherType.fold(
        (exception) {
          return Left(
            AppException(
              error: exception.error ?? '',
              message: exception.error ??
                  ''
                      'Unknown error occurred while updating user profile. Please try again.',
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
          message:
              'Unknown error occurred while updating user profile. Please try again.',
          error: 'Error!',
        ),
      );
    }
  }
}
