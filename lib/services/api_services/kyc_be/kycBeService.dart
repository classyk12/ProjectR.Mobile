import 'package:projectr/services/api_services/kyc_be/iKycBeService.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/kyc_be/embassy_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class KycBeService implements IKycBeService {
  final NetworkService networkService;

  KycBeService(this.networkService);

  @override
  Future<Either<AppException, List<EmbassyModel>>> getEmbassies() async {
    try {
      final eitherType = await networkService.get(
        'embassy',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting embassies.',
            ),
          );
        },
        (response) {
          var data = response.data['data'];
          final items =
              List<EmbassyModel>.from(data.map((x) => EmbassyModel.fromMap(x)));
          EMBASSIES_LIST = items;
          return Right(items);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting embassies.',
          error: 'Error!',
        ),
      );
    }
  }
}
