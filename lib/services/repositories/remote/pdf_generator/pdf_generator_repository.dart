import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/pdf_generator/generate_pdf_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class PDFGeneratorRepository {
  ///generator report for valuations
  Future<Either<AppException, bool>> generateCustomerValuation(
      GenerateReportModel model);
  Future<Either<AppException, bool>> generateInvestmentLetter(
      GenerateReportModel model);
}
