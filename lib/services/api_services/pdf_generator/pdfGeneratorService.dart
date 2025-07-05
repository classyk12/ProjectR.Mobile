import 'package:projectr/services/api_services/pdf_generator/ipdfGeneratorService.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/pdf_generator/generate_pdf_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class PdfGeneratorService implements IPdfGeneratorService {
  final NetworkService networkService;

  PdfGeneratorService(this.networkService);

  @override
  Future<Either<AppException, bool>> generateCustomerValuation(
      GenerateReportModel model) async {
    try {
      var map = model.toMap();
      final eitherType =
          await networkService.post('customer-valuation', data: map);
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while generating report.',
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
          message: 'Unknown error occurred while generating report.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> generateInvestmentLetter(
      GenerateReportModel model) async {
    try {
      var map = model.toMap();
      final eitherType =
          await networkService.post('customer-valuation-letter', data: map);
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while generating report.',
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
          message: 'Unknown error occurred while generating report.',
          error: 'Error!',
        ),
      );
    }
  }
}
