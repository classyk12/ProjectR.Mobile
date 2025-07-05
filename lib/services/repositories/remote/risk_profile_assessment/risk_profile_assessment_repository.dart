import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/risk_profile_assessment/risk_profile_assessment_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class RiskProfileAssessmentRepository {
  Future<Either<AppException, bool>> riskProfileAssessment(
      {required RiskProfileAssessmentModel model});
}
