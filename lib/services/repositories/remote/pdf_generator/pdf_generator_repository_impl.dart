import 'package:projectr/services/api_services/pdf_generator/ipdfGeneratorService.dart';
import 'package:projectr/services/repositories/remote/pdf_generator/pdf_generator_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/pdf_generator/generate_pdf_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class PDFGeneratorRepositoryImpl extends PDFGeneratorRepository {
  final IPdfGeneratorService service;

  PDFGeneratorRepositoryImpl(this.service);

  @override
  Future<Either<AppException, bool>> generateCustomerValuation(
      GenerateReportModel model) async {
    return await service.generateCustomerValuation(model);
  }

  @override
  Future<Either<AppException, bool>> generateInvestmentLetter(
      GenerateReportModel model) async {
    return await service.generateInvestmentLetter(model);
  }
}
