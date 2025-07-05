import 'package:projectr/services/api_services/user_profile/iuserProfileService.dart';
import 'package:projectr/services/repositories/remote/user_profile/user_profile_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/user_profile/user_profile_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class UserProfileRepositoryImpl extends UserProfileRepository {
  final IUserProfileService service;

  UserProfileRepositoryImpl(this.service);

  @override
  Future<Either<AppException, UserProfileModel>> getUserProfile() async {
    return await service.getUserProfile();
  }

  @override
  Future<Either<AppException, bool>> updateUserProfile(
      {required UpdateUserProfileModel model}) {
    return service.updateUserProfile(model: model);
  }
}
