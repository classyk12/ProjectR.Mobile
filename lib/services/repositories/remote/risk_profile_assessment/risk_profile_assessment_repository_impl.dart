import 'package:projectr/services/api_services/risk_profile_assessment/irisk_profile_assessment_service.dart';
import 'package:projectr/services/repositories/remote/risk_profile_assessment/risk_profile_assessment_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/risk_profile_assessment/risk_profile_assessment_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class RiskProfileAssessmentRepositoryImpl
    extends RiskProfileAssessmentRepository {
  final IRiskProfileAssessmentService service;

  RiskProfileAssessmentRepositoryImpl(this.service);

  @override
  Future<Either<AppException, bool>> riskProfileAssessment(
      {required RiskProfileAssessmentModel model}) async {
    return await service.riskProfileAssessment(model: model);
  }
}
