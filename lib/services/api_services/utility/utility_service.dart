import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/customer/name_enquiry_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/domain/models/utility/bank_model.dart';
import 'package:projectr/shared/domain/models/utility/country_model.dart';
import 'package:projectr/shared/domain/models/utility/states_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/helper.dart';

abstract class IUtilityService {
  Future<Either<AppException, List<CountryModel>>> getCountry();

  Future<Either<AppException, List<StatesModel>>> getStates(
      {required int countryId});

  Future<Either<AppException, Map<String, dynamic>>> getLocalGovernments();
  Future<List<String>> getRelationships();

  Future<Either<AppException, List<BankModel>>> getBanks();

  Future<Either<AppException, ValidateAccountModelResponse>>
      validateBankAccountDetails({required ValidateBankAccountModel model});
}

class UtilityService implements IUtilityService {
  final NetworkService networkService;

  UtilityService(this.networkService);

  @override
  Future<Either<AppException, List<CountryModel>>> getCountry() async {
    try {
      final eitherType = await networkService.get(
        'getCountry',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting countries.',
            ),
          );
        },
        (response) {
          final countries = List<CountryModel>.from(
              response.data.map((x) => CountryModel.fromMap(x)));
          COUNTRIES_LIST = countries;
          return Right(countries);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting countries.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>>
      getLocalGovernments() async {
    try {
      final eitherType = await networkService.get('customer/state-lga');
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting local governments.',
            ),
          );
        },
        (response) {
          return Right(response.data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting local goverments.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<StatesModel>>> getStates(
      {required int countryId}) async {
    try {
      final eitherType = await networkService.get(
        'getState?countryID=$countryId',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);

          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting states.',
            ),
          );
        },
        (response) {
          final states = List<StatesModel>.from(
              response.data.map((x) => StatesModel.fromMap(x)));
          return Right(states);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting states.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<List<String>> getRelationships() async {
    return Future.value(AppHelper.getRelationships());
  }

  @override
  Future<Either<AppException, List<BankModel>>> getBanks() async {
    try {
      final eitherType = await networkService.get('mutualfunds/banks');
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting bank list.',
            ),
          );
        },
        (response) {
          final banks = List<BankModel>.from(
              response.data.map((x) => BankModel.fromMap(x)));
          BANK_LIST = banks;
          return Right(banks);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting bank list.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, ValidateAccountModelResponse>>
      validateBankAccountDetails(
          {required ValidateBankAccountModel model}) async {
    try {
      final eitherType = await networkService.get(
          'customer/resolveBankAccount?accountNumber=${model.accountNumber}&bankCode=${model.bankCode}');
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while validating account details.',
            ),
          );
        },
        (response) {
          var res = ValidateAccountModelResponse.fromMap(response.data['data']);
          return Right(res);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while validating account details.',
          error: 'Error!',
        ),
      );
    }
  }
}
