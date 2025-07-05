import 'package:projectr/shared/domain/models/customer/name_enquiry_model.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/utility/bank_model.dart';
import 'package:projectr/shared/domain/models/utility/country_model.dart';
import 'package:projectr/shared/domain/models/utility/states_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class UtilityRepository {
  ///get countriies list
  Future<Either<AppException, List<CountryModel>>> getCountries();

  ///get states by country with this method
  Future<Either<AppException, List<StatesModel>>> getStates(
      {required int countryId});

  ///get local government by state with this method
  Future<Either<AppException, Map<String, dynamic>?>> getLocalGovernments();

  ///get bank list state with this method
  Future<Either<AppException, List<BankModel>>> getBanks();

  Future<Either<AppException, ValidateAccountModelResponse>>
      validateBankAccountDetails({required ValidateBankAccountModel model});
}
