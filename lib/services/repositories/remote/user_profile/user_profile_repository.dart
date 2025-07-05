import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/user_profile/user_profile_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class UserProfileRepository {
  Future<Either<AppException, UserProfileModel>> getUserProfile();
  Future<Either<AppException, bool>> updateUserProfile(
      {required UpdateUserProfileModel model});
}
