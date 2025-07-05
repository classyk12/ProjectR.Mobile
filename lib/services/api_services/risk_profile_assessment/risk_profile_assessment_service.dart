import 'package:projectr/services/api_services/risk_profile_assessment/irisk_profile_assessment_service.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/domain/models/risk_profile_assessment/risk_profile_assessment_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class RiskProfileAssessmentService implements IRiskProfileAssessmentService {
  final NetworkService networkService;

  RiskProfileAssessmentService(this.networkService);

  @override
  Future<Either<AppException, bool>> riskProfileAssessment(
      {required RiskProfileAssessmentModel model}) async {
    try {
      final eitherType = await networkService.post(
        'risk-assessment',
        data: model.toMap(),
      );
      return eitherType.fold((exception) {
        var result = BaseResponse.fromMap(exception.error);
        return Left(
          AppException(
            error: result.message,
            message: result.message ??
                'Unknown error occurred while submitting risk profile.',
          ),
        );
      }, (response) {
        return const Right(true);
      });
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while submitting risk profile.',
          error: 'Error!',
        ),
      );
    }
  }
}
